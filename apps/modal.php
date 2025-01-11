<?php

/**
 * 
 * insert data into database 
 */
function insertQuery($table, $data, $pdo)
{
    // Generate the query dynamically
    $columns = implode(", ", array_keys($data));
    $placeholders = ":" . implode(", :", array_keys($data));
    $sql = "INSERT INTO $table ($columns) VALUES ($placeholders)";

    try {
        $stmt = $pdo->prepare($sql); // Prepare the SQL statement
        $stmt->execute($data); // Bind and execute the query
        return $pdo->lastInsertId(); // Return the last inserted ID
    } catch (PDOException $e) {
        die("Insert Query Error: " . $e->getMessage());
    }
}

/**
 * 
 * Show all data
 */

function showAllData($pdo)
{
    try {
        // Prepare SQL query
        $sql = "SELECT 
    posts.id AS post_id,
    posts.name AS post_user_name,
    posts.profile_picture_url AS post_user_photo,
    posts.post_text,
    posts.post_image,
    posts.post_video_url,
    posts.created_at AS post_created_at,
    
    -- Post Likes Count
    (SELECT COUNT(*) FROM Likes WHERE post_id = posts.id AND comment_id IS NULL) AS post_likes_count,
    
    -- Total Comments Count (including replies)
    (SELECT COUNT(*) 
     FROM comments 
     WHERE post_id = posts.id) AS post_comments_count,

    -- Direct Comments Count (excluding replies)
    (SELECT COUNT(*) 
     FROM comments 
     WHERE post_id = posts.id 
           AND parent_comment_id IS NULL) AS direct_comments_count,
   

    -- Comments with Replies as Nested JSON
    (
        SELECT 
            CONCAT('[', 
                GROUP_CONCAT(
                    JSON_OBJECT(
                        'comment_id', c.id,
                        'comment_user_name', c.name,
                        'comment_user_photo', c.profile_picture_url,
                        'comment_text', c.comment_text,
                        'comment_image', c.comment_image,
                        'comment_video_url', c.comment_video_url,
                        'comment_created_at', c.created_at,
                        'comment_likes_count', (
                            SELECT COUNT(*) FROM Likes WHERE comment_id = c.id
                        ),
                        'replies', (
                            SELECT CONCAT('[', 
                                GROUP_CONCAT(
                                    JSON_OBJECT(
                                        'reply_id', r.id,
                                        'reply_user_name', r.name,
                                        'reply_user_photo', r.profile_picture_url,
                                        'reply_text', r.comment_text,
                                        'reply_image', r.comment_image,
                                        'reply_video_url', r.comment_video_url,
                                        'reply_created_at', r.created_at,
                                        'reply_likes_count', (
                                            SELECT COUNT(*) FROM Likes WHERE comment_id = r.id
                                        )
                                    )
                                ), ']')
                            FROM comments r
                            WHERE r.parent_comment_id = c.id
                        )
                    )
                ), ']'
            )
        FROM comments c
        WHERE c.post_id = posts.id AND c.parent_comment_id IS NULL
    ) AS comments
FROM 
    posts
ORDER BY 
    posts.created_at DESC;

        ";

        $stmt = $pdo->prepare($sql);

        // Execute the query
        $stmt->execute();

        // Fetch all rows
        $data = $stmt->fetchAll(PDO::FETCH_OBJ);


        // Return the data
        return [
            "status" => "success",
            "data" => $data
        ];
    } catch (PDOException $e) {
        // Return error message
        return [
            "status" => "error",
            "message" => $e->getMessage()
        ];
    }
}
