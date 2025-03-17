<?php
include_once("connections/conn_dbOriginal.php");
if(isset($_GET['email'])) {
    $email = $_GET['email'];
    $query = "SELECT * FROM member WHERE email = '".$email."'";
    $result=$link->query($query);
    $row=$result->rowCount();
    if($row==0) {
        echo 'true';
        return ;
    }
}
echo 'false';
return;
?>