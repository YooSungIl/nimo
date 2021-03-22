$(function() {

	var id = $("#login_id");
	var pwd = $("#login_pwd");
	var idPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var pwdPattern = /^.*(?=^.{8,24}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]).*$/;


	id.on('propertychange change keyup paste input', function() {
		$('#checkMsg_id').html('');
	});

	pwd.on('propertychange change keyup paste input', function() {
		$('#checkMsg_pwd').html('');
	});

	$('.loginAsk').on("click", function() {
		var valId = id.val();
		var valPwd = pwd.val();

		if (valId == null || valId == undefined || valId == "") {
			$('#checkMsg_id').html('<p style="color:red">아이디를 입력해주세요.</p>');
			id.focus();
			return false;
		}
		if (!idPattern.test(valId)) {
			$('#checkMsg_id').html('<p style="color:red">이메일 형식이 아닙니다.</p>');
			id.focus();
			return false;
		}
		if (valPwd == null || valPwd == undefined || valPwd == "") {
			$('#checkMsg_pwd').html('<p style="color:red">비밀번호를 입력해주세요.</p>');
			pwd.focus();
			return false;
		}
		$('.loginAsk').submit();
	});

	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');

	// 관리자 로그인 확인
	$('.kwan').click(function(){
		var valId = id.val();
		var valPwd = pwd.val();

		if (valId == null || valId == undefined || valId == "") {
			$('#checkMsg_id').html('<p style="color:red">아이디를 입력해주세요.</p>');
			id.focus();
			return false;
		} else if (!idPattern.test(valId)) {
			$('#checkMsg_id').html('<p style="color:red">이메일 형식이 아닙니다.</p>');
			id.focus();
			return false;
		} else if (valPwd == null || valPwd == undefined || valPwd == "") {
			$('#checkMsg_pwd').html('<p style="color:red">비밀번호를 입력해주세요.</p>');
			pwd.focus();
			return false;
		} else {
			$.ajax({
				type : 'POST',
				url : 'kwanLogin',
				contentType : "application/json; charset=utf-8;",
				data : JSON.stringify({
					"id" : id.val(),
					"pwd" : pwd.val()
				}),
				dataType : "json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					if (data == -1) {
						alert("정상적인 로그인 경로가 아닙니다.");
						location.href="/nimo";
						return false;
					} else {
						if (data == 1) {
							alert("환영합니다. 관리자 index로 접속합니다.");
							$('.kwan').submit();
						} else {
							alert("비밀번호가 잘못되었습니다. 다시 확인해주세요.");
							location.href="kwanLogin";
							return false;
						}
					}
				},
				error : function(request, status, error) {
					console.log("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
		}
	});

	var count=0; //1.카운트 올리기

	$('#Kwan').click(function(){
		count=count+1;
		console.log(count);
		if (count == 5) {
			location.href="/nimo/kwanLogin";
			count = 0;
		}
	});
});