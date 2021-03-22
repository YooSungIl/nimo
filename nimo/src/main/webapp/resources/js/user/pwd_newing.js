$(function() {

	var pwd = $("#new_pwd");
	var pwdC = $("#new_pwdChk");
	
	var pwdPattern = /^.*(?=^.{8,24}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]).*$/;


///////////////// 비밀번호 확인 /////////////////

	
	
///////////////// 비밀번호 입력사항 확인 /////////////////
	pwd.on("blur", function() {
		var valPwd = pwd.val();
		
		if (valPwd == null || valPwd == undefined || valPwd == "") {
			$('#checkMsg_pwd').html('<p style="color:red">필수 입력 항목입니다.</p>');
		}
	});
	
	pwdC.on("blur", function() {
		var valPwdC = pwdC.val();
		
		if (valPwdC == null || valPwdC == undefined || valPwdC == "") {
			$('#checkMsg_pwdC').html('<p style="color:red">비밀번호를 한 번 더 입력해주세요.</p>');
		}
	});
	
	
	
///////////////// 비밀번호 확인체크 & 유효성 체크/////////////////
	
//	input 실시간 감지
	pwd.on("propertychange change keyup paste input", function() {
		
		var valPwd = pwd.val();
		
		
		if (pwd.val() != "" || pwdC.val() != "") {
			if (pwd.val() == pwdC.val()) {
				$('#checkMsg_pwdC').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
			} else {
				if (pwdC.val() != "") {
					$('#checkMsg_pwdC').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
				}
			}
			
			if (valPwd.length < 8 || valPwd.length > 24) {
				$('#checkMsg_pwd').html('<p style="color:red">8-24자 영문 대,소문자,숫자,특수문자 !@#$%^*+=-</p>');
			} else {
				if (!pwdPattern.test(valPwd)) {
					if (valPwd.search(/[0-9]/g) < 0) {
						$('#checkMsg_pwd').html('<p style="color:red">최소 1개의 숫자 필요</p>');
					} else if (valPwd.search(/[!@#$%^*+=-]/gi) < 0) {
						$('#checkMsg_pwd').html('<p style="color:red">최소 1개의 특수문자 !@#$%^*+=- 필요</p>');
					} else if (valPwd.search(/[a-zA-Z]/ig) < 0){
						$('#checkMsg_pwd').html('<p style="color:red">최소 1개의 영문 대, 소문자 필요</p>');
					} 
				} else {
					$('#checkMsg_pwd').html('');
				}
			}
		}
	});
	
//	input 실시간 감지
	pwdC.on("propertychange change keyup paste input", function() {
		
		
		if (pwd.val() != "" || pwdC.val() != "") {
			if (pwd.val() == pwdC.val()) {
				$('#checkMsg_pwdC').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
			} else {
				$('#checkMsg_pwdC').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
			}
		}
	});
	
///////////////// 비밀번호 유효성 체크 /////////////////
//	pwd.bind("keypress", function() {
//		
//	});
//	pwdC.on("keydown", function() {
//		if (pwd.val() != "" || pwdC.val() != "") {
//			$('#checkMsg_pwd').html('');
//			if (pwd.val() == pwdC.val()) {
//				$('#checkMsg_pwdC').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
//			} else {
//				$('#checkMsg_pwdC').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
//			}
//		}
//	});
	
	

////////////// 변경체크 //////////////

	$('.newPwdAsk').on("click", function() {
		var valPwd = pwd.val();
		var valPwdC = pwdC.val();
		
		if (valPwd == null || valPwd == undefined || valPwd == "") {
			$('#checkMsg_pwd').html('<p style="color:red">필수 입력 항목입니다.</p>');
			pwd.focus();
			return false;
		}
		if (valPwd.length < 8 || valPwd.length > 24) {
			$('#checkMsg_pwd').html('<p style="color:red">8-24자 영문 대,소문자,숫자,특수문자(!, @, #, $, %, ^, *, +, =, -)</p>');
			pwd.focus();
			return false;
		} else {
			if (!pwdPattern.test(valPwd)) {
				if (valPwd.search(/[0-9]/g) < 0) {
					$('#checkMsg_pwd').html('<p style="color:red">최소 1개의 숫자 필요</p>');
					pwd.focus();
					return false;
				} else if (valPwd.search(/[!@#$%^*+=-]/gi) < 0) {
					$('#checkMsg_pwd').html('<p style="color:red">최소 1개의 특수문자(!, @, #, $, %, ^, *, +, =, -) 필요</p>');
					pwd.focus();
					return false;
				} else if (valPwd.search(/[a-zA-Z]/ig) < 0){
					$('#checkMsg_pwd').html('<p style="color:red">최소 1개의 영문 대, 소문자 필요</p>');
					pwd.focus();
					return false;
				}
			}
		}
		if (valPwdC == null || valPwdC == undefined || valPwdC == "") {
			$('#checkMsg_pwdC').html('<p style="color:red">비밀번호 확인을 입력해주세요.</p>');
			pwdC.focus();
			return false;
		}
		if (valPwdC != valPwd) {
			$('#checkMsg_pwdC').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
			pwdC.focus();
			return false;
		}
		$('.joinAsk').submit();
	});
});