<?php

function connectDatabase()
{
    $serverName = "localhost";
    $userName = "root";
    $password = "";
    $dbName = "test_pros_company";

    try {
        $conn = new PDO("mysql:host=$serverName;dbname=$dbName", $userName, $password);
        $conn->exec("set names utf8");
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        die;
    }
}

$pdo = connectDatabase();