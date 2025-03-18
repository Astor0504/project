<?php require_once('./connections/conn_dbexpstore.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : " "; ?>
<!-- 這是降資料庫，連線程式載入 -->
<!-- 如果SESSION沒有啟動，則啟動SESSION功能，這是跨網頁變數存取 -->

<!-- 載入共用php函數庫 為了做分頁功能-->
<?php require_once("php_lib.php"); ?>
<?php
//驗證是否帳號登入
if (!isset($_SESSION['login'])) {
    $sPath = "login.php?sPath=orderlist";
    header(sprintf("Location:%s",$sPath));
}
?>



<!doctype html>
<html lang="zh-Tw">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("headfile.php"); ?>
    <style type="text/css">
        .accordion-header a {
            text-decoration: none;
        }
    </style>
</head>

<body>
    <section id="header">
        <!-- 引入導覽列 -->
        <?php require_once("navbar.php"); ?>
    </section>

    <hr>
    <hr>

    <section id="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <!-- 引入sidebar分類導覽 -->
                    <?php require_once("sidebar.php"); ?>
                    <!-- 引入熱銷商品模組 -->
                    <?php require_once("hot.php"); ?>

                </div>
                <div class="col-md-10">
                    <!-- 引入訂單查詢 -->
                    <?php require_once("order_content.php"); 
                    ?>
                    
                </div>
            </div>
        </div>
    </section>

    <hr>
    <section id="scontent">
        <!-- 服務說明 -->
        <?php require_once("scontent.php"); ?>
    </section>

    <section id="footer">
        <!-- 聯絡資訊 -->
        <?php require_once("footer.php"); ?>
    </section>




</body>
<!-- 引入javascript -->
<?php require_once("jsfile.php"); ?>

</html>