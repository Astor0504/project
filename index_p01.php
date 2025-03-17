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
</head>

<body>
    <section id="header">
        <!-- 引入導覽列 -->
        <?php require_once("navbar.php"); ?>
    </section>

    <section id="content">
        <div class="container-fluid">
            <div class="row">
                
                <div class="col-md-12">
                    <!-- 廣告輪播 -->
                    <?php require_once("carousel.php"); ?>
                    <hr>
                </div>
                
                <div class="row">
                    <div class="col-md-2">
                    <!-- 引入sidebar分類導覽 -->
                    <?php require_once("sidebar.php"); ?>
                    <!-- 引入熱銷商品模組 -->
                    <?php require_once("hot.php"); ?>
                    <!-- 左側篩選下拉式選單 -->
                    <div class="container mt-4">
                                <div class="card p-3" style="max-width: 300px;">
                                    <!-- 篩選按鈕 -->
                                    <button class="btn btn-danger w-100 mb-3">
                                        <i class="bi bi-funnel me-2"></i>套用篩選 (0/20)
                                    </button>

                                    <!-- 價格範圍 -->
                                    <div class="mb-3">
                                        <label class="form-label fw-bold">價格 (NT$)</label>
                                        <div class="d-flex align-items-center">
                                            <input type="number" class="form-control me-2" placeholder="最小金額" style=" font-size: 13px;">
                                            <span>~</span>
                                            <input type="number" class="form-control ms-2" placeholder="最大金額" style=" font-size: 13px;">
                                        </div>
                                    </div>

                                    <!-- 顏色篩選 -->
                                    <div>
                                        <label class="form-label fw-bold">顏色</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gold">
                                            <label class="form-check-label" for="gold">金色 (22)</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="silver">
                                            <label class="form-check-label" for="silver">銀色 (22)</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="rose-gold">
                                            <label class="form-check-label" for="rose-gold">玫瑰金 (6)</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="pink">
                                            <label class="form-check-label" for="pink">粉色 (2)</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="blue">
                                            <label class="form-check-label" for="blue">藍色 (2)</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="white">
                                            <label class="form-check-label" for="white">白色 (1)</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="purple">
                                            <label class="form-check-label" for="purple">紫色 (1)</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="black">
                                            <label class="form-check-label" for="black">黑色 (1)</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                    </div>
                    <div class="col-md-10">
                        <!-- product商品 -->
                    <?php require_once("product_list.php"); ?>
                    </div>
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