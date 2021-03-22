
Kakao.init('09ca91ae162151e790af591f2a05d377');
		
function kakao() {
	Kakao.Auth.login({
		success : function(authObj) {

			// 로그인 성공시, API를 호출합니다.
			var access_token = authObj.access_token;
			var header = $("meta[name='_csrf_header']").attr('content');
			var token = $("meta[name='_csrf']").attr('content');
			var result;

			Kakao.API.request({
				url : '/v2/user/me',
				success : function(res) {
					var userInfo = {
							email : "",
							check_id : "K" + res.id,
							account_type : "kakao",
							nickname : "Unknown",
							phone_number : ""
					};
					console.log(userInfo);

					if (res.kakao_account && res.kakao_account.email) {
						userInfo.email = res.kakao_account.email;
					}

					if (res.properties) {
						if (res.properties.nickname) {
							userInfo.nickname = res.properties.nickname;
						}
					}
					if (res.kakao_account && res.kakao_account.phone_number) {
						userInfo.phone_number = res.kakao_account.phone_number;
					}
					
					$.ajax({
						type : 'POST',
						url : 'socialLoginNJoin',
						data : userInfo,
						dataType : "json",
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						success : function(data) {
							
							if (data.result.split('_')[0] == "success") {
								location.href="/nimo";
							} else if (data.result.split('_')[0] == "fail") {
								var account_type = data.result.split('_')[1];
								console.log('fail ==>' + account_type);
							}
						},
						error : function(request, status, error) {
							console.log("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:" + error);
						}
					});
//					vueComponent.loginCallbackSuccess(userInfo);
				},
				
//				fail : vueComponent.loginCallbackError
			});
//			
		},
//		fail : vueComponent.loginCallbackError
	});
};
