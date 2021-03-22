$(function() {

	// google signin API
	var googleUser = {};
	function onSignIn(googleUser) {
		 gapi.load('auth2', function() {
		  console.log("init()시작");
		  auth2 = gapi.auth2.init({
		        client_id: '557243081599-c83r7c603m6te6miufs183p2entslgkb.apps.googleusercontent.com'
//		        cookiepolicy: 'single_host_origin',
		      });
		      attachSignin(document.getElementById('google_login'));
		 });
	}

	//google signin API2
	function attachSignin(element) {
	    auth2.attachClickHandler(element, {},
	        function(googleUser) {
	    	var profile = googleUser.getBasicProfile();
	    	var id_token = googleUser.getAuthResponse().id_token;
		  	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  	  console.log('ID토큰: ' + id_token);
		  	  console.log('Name: ' + profile.getName());
		  	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
//				$(function() {
//					$.ajax({
//					    url: '/googleLogin',
//					    type: 'post',
//					    data: {
//							"id" : id_token,
//							"pw" : "1234",
//					        "username": profile.getName(),
//							"email": profile.getEmail()
//						    },
//					    success: function (data) {
//					            alert("구글아이디로 로그인 되었습니다");
//					            location.href="/member/main";
//					        }
//					});
//				})
//	        }, function(error) {
//	          alert(JSON.stringify(error, undefined, 2));
	        });
	    console.log("구글API 끝");
	  }
});