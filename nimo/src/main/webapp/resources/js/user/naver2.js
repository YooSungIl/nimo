
//	var naver_id_login = new naver_id_login("S4rirWOf3dCBNgOCJopF", "http://localhost:8088/nimo/login");
//	var state = naver_id_login.getUniqState();
//	naver_id_login.setDomain(".service.com");
//	naver_id_login.setState(state);
//	naver_id_login.setPopup();
//	naver_id_login.init_naver_id_login();
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId : "S4rirWOf3dCBNgOCJopF",
				callbackUrl : "http://localhost:8088/nimo/login",
				isPopup : true, /* 팝업을 통한 연동처리 여부 */
				callbackHandle : false,
				loginButton : { color : "green", type : 1, height : 50 } /* 로그인 버튼의 타입을 지정 */
			}
	);
//	function naver() {
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();


	/* 프로필 정보 받아오기 */
	naverLogin.getLoginStatus(function(status) {
		if (status) {

			/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
			window.opener.console.log(naverLogin.user);

			var naver_email = naverLogin.user.getEmail();
			var naver_name = naverLogin.user.getName();
			var naver_check_id = naverLogin.user.getId();
			var naver_phone = naverLogin.user.getMobile().replace(/\-/g,'');


			if(naver_name == 'undefined' || naver_name == null || naver_name == '') {
				alert('이름은 필수 정보입니다. 정보제공을 동의해주세요.');
				naverLogin.reprompt(); // 필수정보를 얻지 못 했을 때 다시 정보제공 동의 화면으로 이동
				return;	
			} else if(naver_email == 'undefined' || naver_email == null || naver_email == '') {
				alert('이메일은 필수 정보입니다. 정보제공을 동의해주세요.');
				naverLogin.reprompt(); // 필수정보를 얻지 못 했을 때 다시 정보제공 동의 화면으로 이동
				return;	
			} else if(naver_phone == 'undefined' || naver_phone == null || naver_phone == '') {
				alert('전화번호는 필수 정보입니다. 정보제공을 동의해주세요.');
				naverLogin.reprompt(); // 필수정보를 얻지 못 했을 때 다시 정보제공 동의 화면으로 이동
				return;	
			} else {
				var userInfo = {
						email : naver_email,
						check_id : "N" + naver_check_id,
						account_type : "naver",
						nickname : naver_name,
						phone_number : naver_phone
				};
				window.opener.console.log(naver_phone);

				var header = $("meta[name='_csrf_header']").attr('content');
				var token = $("meta[name='_csrf']").attr('content');

				// ajax
				$.ajax({
					type : 'POST',
					url : 'socialLoginNJoin',
					data : userInfo,
					dataType : "json",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(header, token);
					},
					success : function(data) {
						window.opener.console.log(data);

						if (data.result.split('_')[0] == "success") {
							window.close();
							window.opener.location.href="/nimo";
						} else if (data.result.split('_')[0] == "fail") {
							window.close();
							var account_type = data.result.split('_')[1];
							window.opener.console.log('fail ==>' + account_type);

						}
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:" + error);
					}
				});
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
//}

//window.addEventListener('load', function() {
//naverLogin.getLoginStatus(function(status) {
//if (status) {
///* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
//// var email = naverLogin.user.getEmail();
//// if( email == undefined || email == null) {
//// alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
//// /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
//// naverLogin.reprompt();
//// return;
//// }
//console.log(status);
//var email = naverLogin.user.getEmail();
//var name = naverLogin.user.getNickName();
//var uniqId = naverLogin.user.getId();

//window.location.replace("http://"
//+ window.location.hostname
//+ ((location.port == "" || location.port == undefined) ? ""
//: ":" + location.port) + "/nimo");
//} else {
//console.log("callback 처리에 실패하였습니다.");
//}
//});
//});
