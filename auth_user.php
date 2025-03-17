<?PHP

header('Access-Control-Allow-Origin:*');
header('Content-Type:application/json;charset=utf-8');

// 檢查是否啟動 session
if (!isset($_SESSION)) session_start();

require_once('Connections/conn_dbexpstore.php');

// 檢查 POST 請求是否包含帳號和密碼
if (isset($_POST['inputAccount']) && isset($_POST['inputPassword'])) {
    $inputAccount = $_POST['inputAccount'];
    $inputPassword = $_POST['inputPassword'];

    // 防止 SQL 注入，使用 sprintf 格式化查詢
    $query = sprintf(
        "SELECT * FROM member WHERE email='%s' AND pw1='%s'",
        $inputAccount,
        $inputPassword
    );

    $result = $link->query($query);

    if ($result) {
        // 檢查是否有符合的資料筆數
        if ($result->rowCount() == 1) {
            $data = $result->fetch();

            // 檢查會員是否已啟用
            if ($data['active']) {
                $_SESSION['login'] = true;
                $_SESSION['emailid'] = $data['emailid'];
                $_SESSION['email'] = $data['email'];
                $_SESSION['cname'] = $data['cname'];
                $_SESSION['imgname'] = $data['imgname'];//加入頭像

                $retcode=array("c" => "1", "m" => '會員驗證成功。');
            } else {
                $retcode=array("c" => "2", "m" => '會員帳號被鎖定！請連絡管理人員。');
            }
        } else {
            $retcode=array("c" => "2", "m" => '帳號或密碼錯誤！需要重新輸入。');
        }
    } else {
        $retcode=array("c" => "0", "m" => '抱歉！會員驗證失敗，請連絡管理人員。');
    }

    // 回傳 JSON 格式的結果
    echo json_encode($retcode);
}
return;
?>
