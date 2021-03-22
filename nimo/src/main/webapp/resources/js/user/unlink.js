
Kakao.init('09ca91ae162151e790af591f2a05d377');

function unlinkApp() {
	Kakao.API.request({
		url: '/v1/user/unlink',
		success: function(res) {
			alert('success: ' + JSON.stringify(res))
		},
		fail: function(err) {
			alert('fail: ' + JSON.stringify(err))
		},
	});
}