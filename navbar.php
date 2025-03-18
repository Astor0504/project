<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
        <!-- 導航列左側logo -->
        <a class="navbar-brand" href="./index.php"><img src="./images/OSEWAYAtitie.webp" class="img-fluid rounded-circle" alt="流行飾品"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <?php
        //讀取後台購物車內產品數量
        $SQLstring = "SELECT * FROM cart WHERE orderid is NULL AND ip='" . $_SERVER['REMOTE_ADDR'] . "'";
        $cart_rs = $link->query($SQLstring);
        ?>

        <?php
        //列出產品類別第一層
        $SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER BY sort";
        $pyclass01 = $link->query($SQLstring);
        ?>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" aria-expanded="false">
                        全部商品 ALL
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
                                        <li><a class="dropdown-item" href="drugstore.php?classid=<?php echo $pyclass02_Rows['classid']; ?>"><em class="fas <?php echo $pyclass02_Rows['fonticon']; ?> fa-fw "></em><?php echo $pyclass02_Rows['cname']; ?></a></li>

                                    <?php } ?>
                                </ul>
                            </li>
                        <?php } ?>
                    </ul>
                </li>

                <li class="nav-item"><a class="nav-link" href="#">秋冬出清｜單件65折
                    </a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        熱銷必買
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">熱銷單品</a></li>
                        <hr class="dropdown-divider">
                        <li><a class="dropdown-item" href="#">經典和風</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">早秋登場</a></li>
                        <hr class="dropdown-divider">
                        <li><a class="dropdown-item" href="#">預約心動</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        質感推薦
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">品牌專屬</a></li>
                        <hr class="dropdown-divider">
                        <li><a class="dropdown-item" href="#">純銀飾品</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">抗敏耐腐</a></li>
                        <hr class="dropdown-divider">
                        <li><a class="dropdown-item" href="#">上班族推薦</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        BLOG
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">【專欄】快速出門！利用鯊魚夾輕鬆打造日系風格髮型</a></li>
                        <hr class="dropdown-divider">
                        <li><a class="dropdown-item" href="#">【專欄】「招財貓」的專屬節日！9/29招き猫の日😺</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">【專欄】開學穿搭：用飾品輕鬆駕馭不同風格！</a></li>
                        <hr class="dropdown-divider">
                        <li><a class="dropdown-item" href="#">【專欄】2024 春夏持續流行：甜美芭蕾緞帶風🎀</a></li>
                    </ul>
                </li>

                <li class="nav-item"><a class="nav-link" href="./cart.php">購物車<span class="badge text-bg-info"><?php echo ($cart_rs) ? $cart_rs->rowCount() : ''; ?></span></a></li>
                <!-- <li class="nav-item"><a class="nav-link" href="./orderlist.php">查訂單</a></li> -->
                <?php if (isset($_SESSION['login'])) { ?>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);" onclick="btn_confirmLink('是否確定登出?','logout.php')">會員登出</a>
                    </li>
                <?php } else { ?>
                    <li class="nav-item">
                        <a class="nav-link" href="login.php">會員登入</a>
                    </li>
                <?php } ?>
                <li class="nav-item"><a class="nav-link" href="./register.php">會員註冊</a></li>
                <?php if (isset($_SESSION['login'])) { ?>
                    <ul class="navbar-nav ms-auto me-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="uploads/<?php echo ($_SESSION['imgname'] != '') ? $_SESSION['imgname'] : 'avatar.svg'; ?>"
                                    width="40" height="40" class="rounded-circle">
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="./orderlist.php">查訂單</a>
                                <a class="dropdown-item" href="profile.php">基本資料</a>
                                <a class="dropdown-item" href="./logout.php" onclick="btn_confirmLink('請確定是否要登出', 'logout.php');">登出</a>
                            </div>
                        </li>
                    </ul>
                <?php } ?>


        </div>

        <!-- 右上方圖示按鈕 -->
        <div class="d-flex align-items-center">
            <!-- 幣別選擇 -->
            <div class="dropdown me-3">
                <button class="btn btn-light dropdown-toggle" type="button" id="currencyDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-currency-dollar"></i>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="currencyDropdown">
                    <li><a class="dropdown-item" href="#">USD</a></li>
                    <li><a class="dropdown-item" href="#">TWD</a></li>
                    <li><a class="dropdown-item" href="#">JPY</a></li>
                </ul>
            </div>

            <!-- 語言選擇 -->
            <div class="dropdown me-3">
                <button class="btn btn-light dropdown-toggle" type="button" id="languageDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-globe"></i>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="languageDropdown">
                    <li><a class="dropdown-item" href="#">English</a></li>
                    <li><a class="dropdown-item" href="#">繁體中文</a></li>
                    <li><a class="dropdown-item" href="#">日本語</a></li>
                </ul>
            </div>

            <!-- 搜尋按鈕 -->
            <a href="#" class="btn btn-light me-3">
                <i class="bi bi-search"></i>
            </a>

            <!-- 用戶按鈕 -->
            <a href="#" class="btn btn-light me-3">
                <i class="bi bi-person"></i>
            </a>

            <!-- 購物車按鈕 -->
            <a href="#" class="btn btn-light">
                <i class="bi bi-cart"></i>
                <span class="badge bg-danger rounded-pill position-absolute translate-middle">3</span>
            </a>
        </div>






        <!-- 使用php函數外加類別功能 -->
        <!--                
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
                    <li><a class="dropdown-item" href="drugstore.php?classid=<?php echo $pyclass02_Rows['classid']; ?>"><em class="fas <?php echo $pyclass02_Rows['fonticon']; ?> fa-fw "></em><?php echo $pyclass02_Rows['cname']; ?></a></li>
                <?php } ?>
            </ul>
        </li>

        
    <?php } ?>

<?php } ?>


-->