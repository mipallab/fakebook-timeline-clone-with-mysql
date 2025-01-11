<?php

/**
 *  autoload.php file
 */
if (file_exists('../autoload.php')) {
    require_once '../autoload.php';
} else {
    echo "autoload.php file not found";
}



if (isset($_GET['action'])) {
    $action = $_GET['action'];
}

switch ($action) {
    case 'insert-data':

        // get data
        $name = $_POST['name'] ?? null;
        $postContent = $_POST['post-content'] ?? null;

        // get files
        $pPhoto = $_FILES['p_photo'] ?? null;
        $pPhotos = $_FILES['posts_photos'] ?? [];
        $pVideos = $_FILES['post_video'] ?? [];


        if (!empty($name) && !empty($pPhoto['name'] && (!empty($postContent) || !empty($pPhotos['name'][0]) || !empty($pVideos['name'][0])))) {

            // has post photos
            if (!empty($pPhotos['name'][0])) {
                // upload post photos files
                $postPhotos = uploadFiles($pPhotos, '../assets/images/post-images/', ['jpg', 'png', 'jpeg', 'gif'], 10485760);
            } else {
                $postPhotos = [];
            }

            // has post videos
            if (!empty($pVideos['name'][0])) {
                // upload post video 
                $postVideos = uploadFiles($pVideos, '../assets/images/post-videos/', ['mp4', 'mkv'], 10485760);
            } else {
                $postVideos = [];
            }

            // upload profile photo
            $proPhoto = move($pPhoto, '../assets/images/profile-images/', ['jpg', 'png', 'jpeg', 'gif']);




            // insert data into database
            $data = [
                'name' => $name,
                'post_text' => $postContent,
                'profile_picture_url' => $proPhoto,
                'post_image' => json_encode($postPhotos),
                'post_video_url' => json_encode($postVideos)
            ];

            $lastInsertId = insertQuery('posts', $data, $connect);
            echo json_encode([
                "status" => "success",
                'message'   => "Post submit successfully"
            ]);
        } else {
            echo json_encode([
                "status" => "error",
                'message'   => 'Field\'s are require!'
            ]);
        }




        break;

    case "insert-comment":
        // get data
        $comm_name = $_POST['comm_usr_name'] ?? null;
        $comm_postContent = $_POST['comment_content'] ?? null;
        $post_id = $_POST['post_id'] ?? null;

        // get files
        $comm_pPhoto = $_FILES['comment_pro_photo'] ?? null;
        $comm_pPhotos = $_FILES['comment_photos'] ?? [];
        $comm_pVideos = $_FILES['comment_video'] ?? [];


        if (!empty($post_id) && !empty($comm_name) && !empty($comm_pPhoto['name'] && (!empty($comm_postContent) || !empty($comm_pPhotos['name'][0]) || !empty($comm_pVideos['name'][0])))) {

            // has comment photos
            $comment_photo = '';
            if (!empty($comm_pPhotos['name'][0])) {
                // upload post photos files
                $comment_photo =  move($comm_pPhotos, '../assets/images/post-images/', ['jpg', 'png', 'jpeg', 'gif']);
            } else {
                $comment_photo = NULL;
            }

            // has comment videos
            $comment_video = '';
            if (!empty($comm_pVideos['name'][0])) {
                // upload post video 
                $comment_video = move($comm_pVideos, '../assets/images/post-videos/', ['mp4', 'mkv']);
            } else {
                $comment_video = NULL;
            }

            // upload profile photo
            $proPhoto = move($comm_pPhoto, '../assets/images/profile-images/', ['jpg', 'png', 'jpeg', 'gif']);


            // insert comment into database
            $data = [
                'post_id' => $post_id,
                'name' => $comm_name,
                'comment_text' => $comm_postContent,
                'profile_picture_url' => $proPhoto ?? null,
                'comment_image' => $comment_photo,
                'comment_video_url' => $comment_video
            ];

            $lastInsertId = insertQuery('comments', $data, $connect);
            echo json_encode([
                "status" => "success",
                'message'   => "Post submit successfully"
            ]);
        } else {
            echo json_encode([
                "status" => "error",
                'message'   => 'Field\'s are require!'
            ]);
        }


        break;

        /**
         * 
         *  Show All Post
         */
    case "all-data":

        // show all data
        $all_post_data = showAllData($connect);



        // echo "<pre>";
        // print_r($all_post_data);
        // echo "</pre>";



        if ($all_post_data['status'] == 'success') {
            echo json_encode($all_post_data['data']);
        } else {
            echo  "Somgthing wrong. post all data not found";
        }







    default:
        # code...
        break;
}