<?php
// Docker database configuration
define('DB_HOST', 'db');                // service name
define('DB_USER', 'user');              // MYSQL_USER
define('DB_PASS', 'userpass');          // MYSQL_PASSWORD
define('DB_NAME', 'grade_management');  // your real DB name

session_start();

try {
    $pdo = new PDO(
        "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME,
        DB_USER,
        DB_PASS
    );
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("ERROR: Could not connect. " . $e->getMessage());
}
