<?php

try {
    $connect = new PDO("mysql:host=localhost;dbname=cloneFakebook", "root", "");
} catch (PDOException $e) {
    echo "Connect failed:" . $e->getMessage();
}
