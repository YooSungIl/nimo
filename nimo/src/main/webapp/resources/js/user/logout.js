
Kakao.init('09ca91ae162151e790af591f2a05d377');

function logout() {
	if (Kakao.Auth.getAccessToken()) {
		Kakao.Auth.logout(function() {
			alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
	    });
		$('#logout').submit();
	} else if (gapi.auth2.getAuthInstance()) {
		alert('logout ok\naccess token -> ');
		gapi.auth2.getAuthInstance().signOut();
		gapi.auth2.getAuthInstance().disconnect();
		$('#logout').submit();
	} else {
		$('#logout').submit();
	}
}