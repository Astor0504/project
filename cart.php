<?php require_once('./connections/conn_dbexpstore.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : " "; ?>
<!-- 這是降資料庫，連線程式載入 -->
<!-- 如果SESSION沒有啟動，則啟動SESSION功能，這是跨網頁變數存取 -->

<!-- 載入共用php函數庫 為了做分頁功能-->
<?php require_once("php_lib.php"); ?>



<!doctype html>
<html lang="zh-Tw">

<head>
    <!-- css link與相關設定 -->
    <!-- 引入網頁標頭 -->
    <?php require_once("headfile.php"); ?>
    <style type="text/css">
        /* 輸入錯誤時，顯示紅框 */
        table input:invalid {
            border: solid red 3px;
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

                    <!-- 購物車內容模組 -->
                    <?php require_once("./cart_content.php"); 
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

<script>




    $("input").change(function() {
        var qty = $(this).val();
        const cartid = $(this).attr("cartid");
        if (qty <= 0 || qty >= 50) {
            alert("更改數量需大於0以上，以及小於50以下。");
            return false;
        }
        $.ajax({
            url: 'change_qty.php',
            type: 'post',
            dataType: 'json',
            data: {
                cartid: cartid,
                qty: qty,
            },
            success: function(data) {
                if (data.c == true) {
                    //alert(data.m);
                    window.location.reload();

                } else {
                    alert(data.m);
                }
            },
            error: function(data) {
                alert("系統目前無法連接到後台資料庫");
            }
        });
    });
</script>


</html>