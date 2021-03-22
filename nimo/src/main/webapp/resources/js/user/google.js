//$('.customBtn').click(function(){
function init() {
	gapi.load('auth2', function() { 
		var gauth = gapi.auth2.init({
			client_id: '557243081599-c83r7c603m6te6miufs183p2entslgkb.apps.googleusercontent.com'
		});
		gauth.then(function(){
			console.log('init success');
		}, function(){
			console.error('init fail');
		});
//		attachSignin($('#customBtn'));
		gauth.signIn({prompt:'select_account'}).then(function(response){
//			alert('Logined');
//			alert(gauth.currentUser.get());
			var profile = gauth.currentUser.get().getBasicProfile();
			console.log(profile.getEmail());
			console.log(profile.getName());
			console.log(profile.getId());
			
			var userInfo = {
					email : profile.getEmail(),
					check_id : "G" + profile.getId(),
					account_type : "google",
					nickname : profile.getName(),
					phone_number : ""
			};
			
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
			
		});
	});
}	

//});

//function onSignIn(googleUser) {
//	var profile = googleUser.getBasicProfile();
//	console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
//	console.log('Name: ' + profile.getName());
//	console.log('Image URL: ' + profile.getImageUrl());
//	console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
//}




//var googleUser = {};
//var startApp = function() {
//gapi.load('auth2', function(){
//// Retrieve the singleton for the GoogleAuth library and set up the client.
//auth2 = gapi.auth2.init({
//client_id: 'YOUR_CLIENT_ID.apps.googleusercontent.com',
//cookiepolicy: 'single_host_origin',
//// Request scopes in addition to 'profile' and 'email'
////scope: 'additional_scope'
//});
//attachSignin(document.getElementById('customBtn'));
//});
//};

//function attachSignin(element) {
//console.log(element.id);
//auth2.attachClickHandler(element, {},
//function(googleUser) {
//console.log('user');
////document.getElementById('name').innerText = "Signed in: " +
////googleUser.getBasicProfile().getName();
//}, function(error) {
//alert(JSON.stringify(error, undefined, 2));
//});
//}


//gapi.auth2.authorize({
//	  client_id: '557243081599-c83r7c603m6te6miufs183p2entslgkb.apps.googleusercontent.com',
//	  scope: 'email profile openid',
//	  response_type: 'id_token permission'
//	}, function(response) {
//	  if (response.error) {
//	    // An error happened!
//	    return;
//	  }
//	  // The user authorized the application for the scopes requested.
//	  var accessToken = response.access_token;
//	  var idToken = response.id_token;
//	  console.log(response);
//	  console.log(accessToken);
//	  console.log(idToken);
//	  // You can also now use gapi.client to perform authenticated requests.
//	});
