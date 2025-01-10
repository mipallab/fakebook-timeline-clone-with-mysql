<?php

/**
 *  config file
 */
if (file_exists(__DIR__ . '/config/connect.php')) {
    require_once __DIR__ . '/config/connect.php';
} else {
    echo "connect.php file not found";
}

/**
 *  functions.php file
 */
if (file_exists(__DIR__ . '/apps/functions.php')) {
    require_once __DIR__ . '/apps/functions.php';
} else {
    echo "functions.php file not found";
}

/**
 *  model.php file
 */
if (file_exists(__DIR__ . '/apps/modal.php')) {
    require_once __DIR__ . '/apps/modal.php';
} else {
    echo "modal.php file not found";
}
