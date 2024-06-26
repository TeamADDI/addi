<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
 
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
    var naverLogin = new naver.LoginWithNaverId({
        clientId: "5ZqsGoNlOMm5yfw03Pgr",
        callbackUrl: "http://localhost:8080/test", // 콤마 추가
        isPopup: false, // 콤마 다음에 공백 추가
        callbackHandle: true
    });
    naverLogin.init();

    window.addEventListener('load', function () {
        naverLogin.getLoginStatus(function (status) {
            if (status) {
                var age = naverLogin.user.getAge();
                var birthday = naverLogin.user.getBirthday();
                var email = naverLogin.user.getEmail();
                var gender = naverLogin.user.getGender();
                var id = naverLogin.user.getId();
                var name = naverLogin.user.getName();
                var nickName = naverLogin.user.getNickName();

                $.ajax({
                    type: 'post',
                    url: 'naverSave',
                    data: {'n_age':age, 'n_birthday':birthday, 'n_email':email, 'n_gender':gender, 'n_id':id, 'n_name':name, 'n_nickName':nickName},
                    dataType: 'text',
                    success: function(result) {
                        if(result == 'ok') {
                            console.log('성공');
                            
                            location.replace("cjoin");
                        } else if(result == 'no') {
                            console.log('실패');
                            location.replace("clogin");
                        }
                    },
                    error: function(error) { // 'error'로 수정
                        console.log('오류 발생');
                    }
                });

            } else {
                console.log("callback 처리에 실패하였습니다.");
            }
        });
    }); // 괄호 추가
</script>
</body>
</html>