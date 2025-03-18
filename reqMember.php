<?php
// 設定 CORS 和回應格式
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');

// 引入資料庫連線設定
require_once('./connections/conn_dbexpstore.php');

// 檢查是否有提供 emailid 參數且不為空
if (isset($_GET['emailid']) && $_GET['emailid'] != '') {
    // 獲取所有 GET 參數
    $emailid = $_GET['emailid'];
    $birthday = $_GET['birthday'];
    $cname = $_GET['cname'];
    $imgname = $_GET['imgname'];
    $tssn = $_GET['tssn'];

    // 準備 UPDATE SQL 語句
    $query = sprintf(
        "UPDATE member SET cname='%s', birthday='%s', imgname='%s', tssn='%s' 
        WHERE member.emailid='%d'",
        $cname,
        $birthday,
        $imgname,
        $tssn,
        $emailid
    );

    // 執行更新查詢
    $result = $link->query($query);

    if ($result) {
        // 更新成功
        // 檢查並啟動 session
        (!isset($_SESSION)) ? session_start() : "";

        // 更新 session 資料
        $_SESSION['cname'] = $cname;
        $_SESSION['imgname'] = $imgname;

        // 設定成功回應
        $retcode = array(
            "c" => "1",
            "m" => "謝謝您!會員資料已經更新。"
        );
    } else {
        // 更新失敗
        $retcode = array(
            "c" => "0",
            "m" => "抱歉!資料無法寫入後台資料庫,請連絡管理人員"
        );
    }

    // 輸出 JSON 格式回應
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}

return;
?>
