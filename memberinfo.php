<?php
// 設定 CORS 和回應格式
header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');

// 引入資料庫連線設定
require_once('./connections/conn_dbexpstore.php');

// 檢查是否有提供 emailid 參數且不為空
if (isset($_GET['emailid']) && $_GET['emailid'] != '') {
    $emailid = $_GET['emailid'];

    // 準備 SQL 查詢語句
    $query = sprintf(
        "SELECT emailid, email, cname, tssn, birthday, imgname 
         FROM member 
         WHERE emailid=%d",
        $emailid
    );

    // 執行查詢
    $result = $link->query($query);

    if ($result) {
        // 查詢成功
        $data = $result->fetchAll(PDO::FETCH_ASSOC);
        $retcode = array(
            "c" => "1",
            "m" => "",
            "d" => $data
        );
    } else {
        // 查詢失敗
        $retcode = array(
            "c" => "0",
            "m" => "抱歉!資料無法連結後台資料庫,請連絡管理人員"
        );
    }

    // 輸出 JSON 格式回應
    echo json_encode($retcode, JSON_UNESCAPED_UNICODE);
}

return;
