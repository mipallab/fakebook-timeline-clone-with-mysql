<?php
date_default_timezone_set("Asia/Dhaka");
/**
 * @param alert alert massage
 * @param  type {alert type (warning, success, danger}
 */



/**
 * Time ago function
 * @param timestamp
 */

function timeAgo($timestamp)
{
    $created_at = strtotime($timestamp);
    $current_time = time();

    $post_time = $current_time - $created_at;

    //minute
    $min = round($post_time / 60);
    //Hour
    $hour = round($min / 60);
    //Day
    $day = round($hour / 24);
    // week
    $week = round($day / 7);
    // month
    $month = round($day / 30);
    // year
    $year = round($month / 12);


    //time ago condition
    if ($post_time < 60) {
        return "Just Now";
    } else if ($min < 60) {
        return ($min == 1) ? "{$min} min ago"
            : "{$min} mins ago";
    } else if ($hour < 24) {
        return ($hour == 1) ? "{$hour} hour ago" : "{$hour} hours ago";
    } else
    if ($day < 7) {
        return ($day == 1) ? "{$day} day ago" : "{$day} days ago";
    } else if ($week < 4) {
        return ($week == 1)
            ? "{$week} week ago" : "{$week} weeks ago";
    } else if ($month < 12) {
        return ($month == 1) ? "{$month} month ago"
            : "{$month} month ago";
    } else {
        return "{$year} year ago";
    }
}

/**
 * move one file to another location
 */
function move(array $file_name, string $path, array $support_files)
{
    $name = $file_name['name'];   // get file name
    $tmp = $file_name['tmp_name'];  // get file tmp_name

    $file_exe = explode(".", $name);
    $file_exe_lower = strtolower(end($file_exe));

    if (in_array($file_exe_lower, $support_files)) {
        $unique_name = time() . "_" . rand() . "_" . str_shuffle("1234567890") . "." . $file_exe_lower;
        move_uploaded_file($tmp, $path . $unique_name);
        return $unique_name;
    } else {
        return NULL;
    }
}



/**
 * Function to upload multiple files to the server.
 *
 * @param array $files Array containing file details from the $_FILES superglobal.
 * @param string $destination Directory where files will be uploaded.
 * @param array $allowed_types Array of allowed file extensions (e.g., ['jpg', 'png', 'mp4']).
 * @param int $max_size Maximum allowed file size in bytes (0 for no limit).
 * @return array Array containing the uploaded file paths or error messages.
 */
function uploadFiles(array $files, string $destination, array $allowed_types, int $max_size = 0): array
{
    $uploaded_files = [];

    // Ensure the destination directory exists
    if (!is_dir($destination) && !mkdir($destination, 0777, true)) {
        return ['error' => 'Failed to create upload directory.'];
    }

    // Loop through each file
    for ($i = 0; $i < count($files['name']); $i++) {
        $file_name = $files['name'][$i];
        $file_tmp = $files['tmp_name'][$i];
        $file_size = $files['size'][$i];
        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

        // Validate file extension
        if (!in_array($file_ext, $allowed_types)) {
            $uploaded_files[] = "File '{$file_name}' has an unsupported file type.";
            continue;
        }

        // Validate file size
        if ($max_size > 0 && $file_size > $max_size) {
            $uploaded_files[] = "File '{$file_name}' exceeds the maximum allowed size.";
            continue;
        }

        // Generate a unique file name to avoid overwriting
        $unique_name = uniqid('', true) . '.' . $file_ext;
        $file_path = rtrim($destination, '/') . '/' . $unique_name;

        // Attempt to move the uploaded file
        if (move_uploaded_file($file_tmp, $file_path)) {
            $uploaded_files[] = $unique_name;
        } else {
            $uploaded_files[] = "Failed to upload file '{$file_name}'.";
        }
    }

    return $uploaded_files;
}