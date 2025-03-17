<?php
//PDO sql連線指令
$dsn="mysql:host=localhost;dbname=pharmacy;charset=utf8";
$user="sales";
$password="123456";
$link=new PDO($dsn,$user,$password);
date_default_timezone_set ("Asia/Taipei");
$link->exec("set names utf8");
//php5.3.6以前的版本需要設置
// 這行程式碼用於設定資料庫連線的字元編碼為 UTF-8
//確保資料庫可以正確處理中文、日文等多語言字元

?>