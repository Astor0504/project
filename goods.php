<?php require_once('./connections/conn_dbexpstore.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : " "; ?>
<!-- 這是降資料庫，連線程式載入 -->
<!-- 如果SESSION沒有啟動，則啟動SESSION功能，這是跨網頁變數存取 -->
<!-- 載入共用php函數庫 為了做分頁功能-->
<?php require_once("php_lib.php"); ?>



<!doctype html>
<html lang="zh-Tw">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("headfile.php"); ?>
    <link rel="stylesheet" href="./fancybox-2.1.7/source/jquery.fancybox.css">
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
                    <!-- 建立類別分項 -->
                    <?php require_once("breadcrumb.php"); ?>
                    <!-- 產品詳細資訊 -->
                    <?php require_once("goods_content.php"); 
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
<script type="text/javascript" src="./fancybox-2.1.7/source/jquery.fancybox.js"></script>
<script type="text/javascript">
    $(function(){
        //定義在滑鼠滑過圖片檔名填入主圖src中
        $(".card .row.mt-2 .col-md-4 a").mouseover(function(){
            var imgsrc = $(this).children("img").attr("src");
            $("#showGoods").attr({
                "src": imgsrc});
        });
        //將圖片放到lightbox展示
        $(".fancybox").fancybox();
    });
</script>

<script type="text/javascript">
    
    function addcart(p_id) {
        var qty = $("#qty").val();
        if (qty <= 0) {
            alert("產品數量不得為0或為負數,請再修改數量!");
            return (false);
        }
        if (qty == undefined) {
            qty = 1;
        } else if (qty >= 50) {
            alert("由於採購限制,產品數量將限制在50以下!");
            return (false);
        }
        //利用jquery $.ajax函數呼叫後台的addcart.php
        $.ajax({
            url: 'addcart.php',
            type: 'get',
            dataType: 'json',
            data: {
                p_id: p_id,
                qty: qty,
            },
            success: function(data) {
                if (data.c == true) {
                    alert(data.m);
                    window.location.reload();
                } else {
                    alert(data.m);
                }
            },
            error: function(data) {
                alert("系統目前無法連接到後台資料庫。");
            }
        });
    }
</script>

</html>