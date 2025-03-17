<?php require_once('./connections/conn_dbexpstore.php'); ?>
<?php (!isset($_SESSION)) ? session_start() : " "; ?>
<!-- 這是降資料庫，連線程式載入 -->
<!-- 如果SESSION沒有啟動，則啟動SESSION功能，這是跨網頁變數存取 -->
<!-- 載入共用php函數庫 為了做分頁功能-->
<?php require_once("php_lib.php"); ?>



<!doctype html>
<html lang="zh-Tw">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>流行飾品</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.2.1/css/
all.css">
    <link rel="stylesheet" href="./website_s01.css">
</head>

<body>
<section id="header">
        <!-- 導航列 -->
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container-fluid">
                <!-- 導航列左側logo -->
                <a class="navbar-brand" href="#"><img src="./images/OSEWAYAtitie.webp" class="img-fluid rounded-circle" alt="流行飾品"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <?php
                //列出產品類別第一層
                $SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER BY sort";
                $pyclass01 = $link->query($SQLstring);
                ?>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" aria-expanded="false">
                                產品資訊
                            </a>
                            <ul class="dropdown-menu">
                                <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
                                    <li class="nav-item dropend">
                                        <a href="#" class="dropdown-item dropdown-toggle">
                                            <i class="fas <?php echo $pyclass01_Rows['fonticon']; ?> fa-fw"></i><?php echo $pyclass01_Rows['cname']; ?>
                                        </a>


                                        <?php

                                        $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND uplink=%d ORDER BY sort", $pyclass01_Rows['classid']);
                                        $pyclass02 = $link->query($SQLstring);
                                        ?>

                                        <ul class="dropdown-menu">
                                            <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                                <li><a class="dropdown-item" href="#"><em class="fas <?php echo $pyclass02_Rows['fonticon']; ?> fa-fw "></em><?php echo $pyclass02_Rows['cname']; ?></a></li>

                                            <?php } ?>
                                        </ul>
                                    </li>
                                <?php } ?>
                            </ul>
                        </li>
                        



                        <!-- 使用php函數外加類別功能 -->
                        <?php multiList01(); ?>
                    </ul>
                </div>
            </div>
        </nav>
        <?php
        function multiList01()
        {
            global $link;
            //列出產品類別第一層
            $SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER by sort";
            $pyclass01 = $link->query($SQLstring);
        ?>
            <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <?php echo $pyclass01_Rows['cname']; ?>
                    </a>
                    <ul class="dropdown-menu">
                        <?php

                        $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND uplink=%d ORDER BY sort", $pyclass01_Rows['classid']);
                        $pyclass02 = $link->query($SQLstring);
                        ?>

                        <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                            <li><a class="dropdown-item" href="#"><em class="fas <?php echo $pyclass02_Rows['fonticon']; ?> fa-fw "></em><?php echo $pyclass02_Rows['cname']; ?></a></li>
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?>

        <?php } ?>



    </section>




    <section id="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <div class="sidebar">
                        <form name="search" id="search" action="" method="get">
                            <div class="input-group">
                                <input type="text" name="search_name" class="form-control" placeholder="search...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit">
                                        <i class="fas fa-search fa-lg"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </div>

                    <?php
                    //列出產品類別第一層
                    $SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER BY sort";
                    $pyclass01 = $link->query($SQLstring);
                    $i = 1; //控制編號順序
                    ?>

                    <div class="accordion" id="accordionExample">

                        <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne<?php echo $i; ?>">
                                    <button class=" accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne<?php echo $i; ?>" aria-expanded="true" aria-controls="collapseOne<?php echo $i; ?>">
                                        <i class="fas <?php echo $pyclass01_Rows['fonticon']; ?> fa-fw"></i><?php echo $pyclass01_Rows['cname']; ?>
                                    </button>
                                </h2>

                                <?php
                                $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND uplink=%d ORDER BY sort", $pyclass01_Rows['classid']);
                                $pyclass02 = $link->query($SQLstring);
                                ?>

                                <div id="collapseOne<?php echo $i; ?>" class="accordion-collapse collapse <?php echo ($i == 1) ? 'show' : ''; ?>" aria-labelledby="headingOne<?php echo $i; ?>" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <table class="table">
                                            <tbody>
                                                <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                                    <tr>
                                                        <td><em class="fas <?php echo $pyclass02_Rows['fonticon']; ?></em><a href=" #"><?php echo $pyclass02_Rows['cname']; ?></a></td>
                                                    </tr>
                                                <?php } ?>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        <?php $i++;
                        } ?>



                    </div>

                    <?php
                    //建立熱銷商品查詢
                    $SQLstring = "SELECT * FROM hot,product,product_img WHERE hot.p_id=product_img.p_id AND hot.p_id=product.p_id AND product_img.sort=1 order by h_sort";
                    $hot = $link->query($SQLstring);
                    ?>

                    <div class="card text-center mt-3" style="border:none;">
                        <div class="card-body">
                            <h3 class="card-title">站長推薦，熱銷商品</h3>
                        </div>
                        <?php while ($data=$hot->fetch()) { ?>
                            <img src="product_img/<?php echo $data['img_file'];?>" class="card-img-top" alt="HOT<?php echo $data['h_sort'];?>" title="<?php echo $data['p_name'];?>">
                        <?php } ?>
                        
                        
                    </div>

                </div>
                <div class="col-md-10">
                    <!-- class="carousel slide" 預設會是關閉的 要記的開 -->
                    <?php
                    //建立廣告輪播carousel資料查詢
                    $SQLstring = "SELECT * FROM carousel WHERE caro_online=1 ORDER BY caro_sort";
                    $carousel = $link->query($SQLstring);
                    $i = 0; //控制active啟動
                    ?>

                    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <?php for ($i = 0; $i < $carousel->rowCount();$i++) {?>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="<?php echo $i; ?>" class="<?php echo activeShow($i, 0); ?>" aria-current="true" aria-label="Slide <?php echo $i; ?>"></button>
                            <?php } ?>
                            
                        </div>
                        <div class="carousel-inner">
                            <?php
                            $i = 0;
                            while ($data = $carousel->fetch()) { ?>
                            <div class="carousel-item <?php echo activeShow($i, 0); ?>">
                                <img src="product_img/<?php echo $data['caro_pic']; ?>" class="d-block w-100" alt="<?php echo $data['caro_title']; ?>">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5><?php echo $data['caro_title']; ?></h5>
                                    <p><?php echo $data['caro_content']; ?></p>
                                </div>
                            </div>
                            <?php $i++; }
                            ?>
                            
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <hr>
                    <?php
                    //建立product藥妝商品RS
                    $maxRows_rs = 12;  //分頁設定數量
                    $pageNum_rs = 0;   //起啟頁=0
                    if (isset($_GET['pageNum_rs'])) {
                        $pageNum_rs = $_GET['pageNum_rs'];
                    }
                    $startRow_rs = $pageNum_rs * $maxRows_rs;

                    //列出產品product資料查詢
                    $queryFirst = sprintf("SELECT * FROM product,product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id ORDER BY product.p_id DESC",$maxRows_rs);
                    $query = sprintf("%s LIMIT %d,%d" , $queryFirst, $startRow_rs, $maxRows_rs);
                    $pList01 = $link->query($query);
                    $i = 1; //控制每列row產生
                    ?>
                    <?php while ($pList01_Rows = $pList01->fetch()) { ?>
                        <?php if ($i % 4 == 1) { ?><div class="row text-center"> <?php } ?>
                    
                        <div class="card col-md-3">
                            <img src="product_img/<?php echo $pList01_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList01_Rows['p_name']; ?>" title="<?php echo $pList01_Rows['p_name']; ?>">
                            <div class="card-body">
                                <h5 class="card-title"><?php echo $pList01_Rows['p_name']; ?></php></h5>
                                <p class="card-text"><?php echo mb_substr($pList01_Rows['p_intro'], 0, 30, "utf-8"); ?></p>
                                <p>NT<?php echo $pList01_Rows['p_price']; ?></p>
                                <a href="#" class="btn btn-primary">更多資訊</a>
                                <a href="#" class="btn btn-success">放購物車</a>
                            </div>
                        </div>
                        <?php if ($i % 4 == 0|| $i == $pList01->rowCount()) { ?></div><?php } ?>
                    <?php $i++;
                    } ?>
                    </div>
                </div>
                <!-- 這裡是分頁功能 -->
                <div class="row mt-2">
                    <?php    //取得目前頁數
                    if (isset($_GET['totalRows_rs'])) {
                        $totalRows_rs = $_GET['totalRows_rs'];
                    } else {
                        $all_rs = $link->query($queryFirst);
                        $totalRows_rs = $all_rs->rowCount();
                    }
                    $totalPages_rs = ceil($totalRows_rs / $maxRows_rs) - 1;
                    //呼叫分頁功能函數
                    $prev_rs = "&laquo;";
                    $next_rs = "&raquo;";
                    $separator = "|";
                    $max_links = 20;
                    $pages_rs = buildNavigation($pageNum_rs, $totalPages_rs, $prev_rs, $next_rs,$separator,$max_links, true, 3, "rs");
                    ?>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <?php echo $pages_rs[0] . $pages_rs[1] .$pages_rs[2]; ?>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>

    <hr>
    <section id="scontent">
        <div class="container-fluid">
            <div id="aboutme" class="row text-center">
                <div class="col-md-2"></div>
                <div class="col-md-2">
                    <img src="./images/Qrcode02.png" alt="QRCODE" class="img-fluid mx-auto">
                </div>
                <div class="col-md-2"><i class="fas fa-thumbs-up fa-5x"></i>
                    <h3>關於我們</h3>
                    關於我們<br>
                    會員制度<br>
                    業務合作<br>
                </div>
                <div class="col-md-2"><i class="fas fa-truck fa-5x"></i>
                    <h3>購物須知</h3>
                    購物須知<br>
                    常見問題<br>
                    飾品保養<br>
                    退換貨政策<br>
                </div>
                <div class="col-md-2"><i class="fas fa-users fa-5x"></i>
                    <h3>客戶服務</h3>
                    蓉蓉有限公司<br>
                    線上客服 https://........<br>
                    10:00 am - 18:00 pm <br>
                    <a href="https://www.facebook.com/osewaya.taiwan" target="_blank">
                        <svg class="icon" width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M24.146 12.073C24.146 5.40365 18.7424 0 12.073 0C5.40365 0 0 5.40365 0 12.073C0 18.0988 4.41493 23.0935 10.1866 24V15.563H7.11968V12.073H10.1866V9.41306C10.1866 6.38751 11.9878 4.71627 14.7466 4.71627C16.0678 4.71627 17.4494 4.95189 17.4494 4.95189V7.92146H15.9267C14.4273 7.92146 13.9594 8.85225 13.9594 9.8069V12.073H17.3077L16.7723 15.563H13.9594V24C19.7311 23.0935 24.146 18.0988 24.146 12.073Z" fill="#333333" />
                        </svg>
                    </a>
                    <a href="https://www.instagram.com/osewaya_taiwan/" target="_blank">
                        <svg class="icon" width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_4527_91515)">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M5.39661 0.0436591C5.68114 0.0200558 7.14491 0.0148926 12.1499 0.0148926H16.0518C18.8638 0.0197783 19.0238 0.0429532 19.558 0.120312L19.589 0.124795C20.745 0.291493 21.7149 0.752495 22.5079 1.51001C22.9523 1.93764 23.2584 2.35586 23.5341 2.91588C23.87 3.60001 24.0351 4.24725 24.1107 5.20982C24.1269 5.41635 24.1343 8.70311 24.1343 11.9921C24.1343 15.2805 24.1275 18.5733 24.1112 18.7799C24.0366 19.7271 23.8715 20.3799 23.546 21.0511C23.2283 21.709 22.7708 22.2896 22.2055 22.7524C21.6402 23.2152 20.9806 23.549 20.2729 23.7305C19.752 23.8651 19.2809 23.9283 18.4695 23.9665C18.18 23.9812 15.1521 23.9849 12.1243 23.9849C9.09642 23.9849 6.07041 23.9757 5.77353 23.9628C5.07281 23.9296 4.52698 23.8595 4.03279 23.7323C2.60553 23.3635 1.39402 22.3751 0.75968 21.0585C0.427759 20.3707 0.271019 19.7419 0.188038 18.7424C0.164066 18.4584 0.158534 16.9962 0.158534 11.9952C0.158534 11.3825 0.158291 10.8265 0.158069 10.321C0.157681 9.43662 0.157361 8.70711 0.158534 8.09975C0.163248 5.28463 0.186142 5.12668 0.264016 4.58944C0.26535 4.58024 0.266701 4.57092 0.268068 4.56147C0.434951 3.40676 0.895952 2.43533 1.6566 1.64573C2.07427 1.21276 2.49747 0.903888 3.03408 0.637429C3.73037 0.290756 4.3695 0.129037 5.39661 0.0436591ZM8.4946 3.20338C9.43874 3.16041 9.74041 3.1499 12.1443 3.1499H12.1417C14.5463 3.1499 14.8468 3.16041 15.791 3.20338C16.7333 3.24653 17.3768 3.39571 17.9411 3.61459C18.5238 3.84048 19.0161 4.1429 19.5085 4.63525C20.0008 5.12723 20.3032 5.62105 20.5301 6.20321C20.7477 6.766 20.897 7.40918 20.9413 8.35147C20.9837 9.2956 20.9947 9.59728 20.9947 12.0011C20.9947 14.405 20.9837 14.7059 20.9413 15.65C20.897 16.592 20.7477 17.2353 20.5301 17.7983C20.3032 18.3803 20.0008 18.8741 19.5085 19.3661C19.0167 19.8584 18.5236 20.1616 17.9416 20.3877C17.3785 20.6065 16.7345 20.7557 15.7923 20.7989C14.8481 20.8418 14.5474 20.8524 12.1433 20.8524C9.73968 20.8524 9.43818 20.8418 8.49405 20.7989C7.55195 20.7557 6.90858 20.6065 6.34542 20.3877C5.76363 20.1616 5.26981 19.8584 4.77801 19.3661C4.28585 18.8741 3.98343 18.3803 3.75717 17.7981C3.53847 17.2353 3.38929 16.5921 3.34596 15.6499C3.30318 14.7057 3.29248 14.405 3.29248 12.0011C3.29248 9.59728 3.30354 9.29542 3.34559 8.35129C3.388 7.40937 3.53736 6.766 3.7568 6.20302C3.98361 5.62105 4.28603 5.12723 4.77838 4.63525C5.27036 4.14308 5.76419 3.84067 6.34634 3.61459C6.90913 3.39571 7.55232 3.24653 8.4946 3.20338ZM11.8493 4.74488C11.6703 4.7448 11.5044 4.74473 11.3502 4.74497V4.74275C9.70058 4.7446 9.38415 4.75566 8.56763 4.79254C7.70463 4.83219 7.23607 4.97602 6.92407 5.09772C6.51101 5.25852 6.21597 5.4503 5.90617 5.76009C5.59638 6.06988 5.40424 6.36492 5.24381 6.77798C5.12266 7.08999 4.97846 7.55837 4.93899 8.42136C4.89658 9.35443 4.8881 9.63324 4.8881 11.9969C4.8881 14.3605 4.89658 14.6408 4.93899 15.5739C4.97827 16.4369 5.12266 16.9053 5.24381 17.2169C5.4046 17.6301 5.59638 17.9244 5.90617 18.2342C6.21597 18.544 6.51101 18.7358 6.92407 18.8962C7.23626 19.0174 7.70463 19.1616 8.56763 19.2014C9.50069 19.2438 9.7808 19.253 12.1443 19.253C14.5075 19.253 14.7878 19.2438 15.7209 19.2014C16.5839 19.162 17.0526 19.0181 17.3643 18.8964C17.7775 18.736 18.0716 18.5442 18.3814 18.2344C18.6912 17.9248 18.8834 17.6307 19.0438 17.2176C19.1649 16.906 19.3091 16.4376 19.3486 15.5746C19.391 14.6416 19.4002 14.3613 19.4002 11.9991C19.4002 9.63693 19.391 9.35664 19.3486 8.42357C19.3093 7.56058 19.1649 7.0922 19.0438 6.78056C18.883 6.36751 18.6912 6.07247 18.3814 5.76267C18.0718 5.45288 17.7773 5.2611 17.3643 5.10068C17.0523 4.97952 16.5839 4.83532 15.7209 4.79586C14.7876 4.75345 14.5075 4.74497 12.1443 4.74497C12.0421 4.74497 11.9439 4.74492 11.8493 4.74488ZM16.2788 6.39367C16.4535 6.27694 16.6589 6.21464 16.869 6.21464V6.21427C17.4554 6.21427 17.9311 6.69002 17.9311 7.27642C17.9312 7.48651 17.869 7.6919 17.7523 7.86661C17.6356 8.04133 17.4698 8.17753 17.2757 8.25798C17.0816 8.33842 16.868 8.35951 16.662 8.31857C16.4559 8.27763 16.2666 8.1765 16.1181 8.02797C15.9695 7.87944 15.8683 7.69018 15.8273 7.48414C15.7862 7.27809 15.8073 7.06451 15.8876 6.8704C15.968 6.6763 16.1042 6.51039 16.2788 6.39367ZM7.59879 12.0011C7.59879 9.49094 9.63391 7.45575 12.1441 7.45565C14.6543 7.45565 16.6892 9.49088 16.6892 12.0011C16.6892 14.5114 14.6545 16.5457 12.1443 16.5457C9.63402 16.5457 7.59879 14.5114 7.59879 12.0011ZM15.0947 12.0011C15.0947 10.3716 13.7736 9.05072 12.1443 9.05072C10.5147 9.05072 9.19385 10.3716 9.19385 12.0011C9.19385 13.6305 10.5147 14.9515 12.1443 14.9515C13.7736 14.9515 15.0947 13.6305 15.0947 12.0011Z" fill="#333333" />
                            </g>
                            <defs>
                                <clipPath id="clip0_4527_91515">
                                    <rect width="24" height="24" fill="white" transform="translate(0.145996)" />
                                </clipPath>
                            </defs>
                        </svg>
                    </a>
                    <a href="https://lin.ee/eKWaSRE" target="_blank">
                        <svg class="icon" width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M14.7228 9.225V13.0339C14.7228 13.1304 14.6478 13.2054 14.5514 13.2054H13.9406C13.8817 13.2054 13.8281 13.1732 13.8014 13.1357L12.0549 10.7786V13.0393C12.0549 13.1357 11.9799 13.2107 11.8835 13.2107H11.2728C11.1764 13.2107 11.1014 13.1357 11.1014 13.0393V9.23036C11.1014 9.13393 11.1764 9.05893 11.2728 9.05893H11.8781C11.9317 9.05893 11.9906 9.08572 12.0174 9.13393L13.7639 11.4911V9.23036C13.7639 9.13393 13.8389 9.05893 13.9353 9.05893H14.546C14.6424 9.05357 14.7228 9.13393 14.7228 9.225V9.225ZM10.3299 9.05357H9.71921C9.62278 9.05357 9.54778 9.12857 9.54778 9.225V13.0339C9.54778 13.1304 9.62278 13.2054 9.71921 13.2054H10.3299C10.4264 13.2054 10.5014 13.1304 10.5014 13.0339V9.225C10.5014 9.13393 10.4264 9.05357 10.3299 9.05357V9.05357ZM8.85671 12.2464H7.19064V9.225C7.19064 9.12857 7.11564 9.05357 7.01922 9.05357H6.4085C6.31207 9.05357 6.23707 9.12857 6.23707 9.225V13.0339C6.23707 13.0821 6.25314 13.1196 6.28529 13.1518C6.31743 13.1786 6.35493 13.2 6.40314 13.2H8.85136C8.94778 13.2 9.02278 13.125 9.02278 13.0286V12.4179C9.02278 12.3268 8.94779 12.2464 8.85671 12.2464V12.2464ZM17.9371 9.05357H15.4888C15.3978 9.05357 15.3174 9.12857 15.3174 9.225V13.0339C15.3174 13.125 15.3924 13.2054 15.4888 13.2054H17.9371C18.0335 13.2054 18.1085 13.1304 18.1085 13.0339V12.4232C18.1085 12.3268 18.0335 12.2518 17.9371 12.2518H16.271V11.6089H17.9371C18.0335 11.6089 18.1085 11.5339 18.1085 11.4375V10.8214C18.1085 10.725 18.0335 10.65 17.9371 10.65H16.271V10.0071H17.9371C18.0335 10.0071 18.1085 9.93215 18.1085 9.83572V9.225C18.1031 9.13393 18.0281 9.05357 17.9371 9.05357V9.05357ZM24.146 4.37679V19.6607C24.1406 22.0607 22.1746 24.0053 19.7692 24H4.48529C2.08529 23.9946 0.14065 22.0232 0.146007 19.6232V4.33929C0.151364 1.93929 2.12279 -0.0053461 4.52279 1.10419e-05H19.8067C22.2067 0.00536818 24.1513 1.97144 24.146 4.37679ZM20.846 10.9446C20.846 7.03393 16.9246 3.85179 12.1085 3.85179C7.29243 3.85179 3.371 7.03393 3.371 10.9446C3.371 14.4482 6.47814 17.3839 10.6781 17.9411C11.7014 18.1607 11.5835 18.5357 11.3531 19.9125C11.3156 20.1321 11.1764 20.775 12.1085 20.3839C13.0406 19.9928 17.1388 17.4214 18.9763 15.3107C20.2406 13.9179 20.846 12.5089 20.846 10.9446Z" fill="#333333" />
                        </svg>
                    </a>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
    </section>


    <section>
        <!-- 支付方式圖標 -->
        <div class="footer-payment-icons">
            <div class="container-fluid">
                <div id="aboutme" class="row justify-content-center">
                    <div class="d-flex justify-content-center align-items-center flex-wrap">
                        <img src="https://static.shoplineapp.com/web/assets/payment/visa.svg" loading="lazy" class="payment-icon" />
                        <img src="https://static.shoplineapp.com/web/assets/payment/master.svg" loading="lazy" class="payment-icon" />
                        <img src="https://static.shoplineapp.com/web/assets/payment/jcb.svg" loading="lazy" class="payment-icon" />
                        <img src="https://static.shoplineapp.com/web/assets/payment/unionpay.svg" loading="lazy" class="payment-icon" />
                        <img src="https://static.shoplineapp.com/web/assets/payment/line.svg" loading="lazy" class="payment-icon" />
                        <img src="https://static.shoplineapp.com/web/assets/payment/sl_payment.svg" loading="lazy" class="payment-icon" />
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section id="footer">
        <div class="container-fluid">
            <div id="last-data" class="row">
                <div class="col-md-12 d-flex justify-content-center align-items-end">
                    <h6>隱私權政策｜條款與細則｜Powered by SHOPLINE</h6>
                </div>
            </div>
        </div>
    </section>




</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>



</html>
