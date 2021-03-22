$(function() {

	var id = $("#search_id");
	var idPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var phone = $('#search_phone');
	var authCode = $('#authCode');
	var authNum;
	var authChkInput = document.getElementById('authChk');
	var authChkBtn = document.getElementById('authChkBtn');
	

	id.on('propertychange change keyup paste input', function() {
		$('#checkMsg_id').html('');
	});
	
	

//////////////////////// 인증 토큰  ////////////////////////
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	
//////////////////////// 이메일 존재여부 확인  ////////////////////////
	id.on('blur', function() {
		$.ajax({
			type : 'POST',
			url : 'checkJoin',
			data : {
				"id" : id.val()
			},
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				if (id.val() != "") {
					if (!idPattern.test(id.val())) {
						
						$('#checkMsg_id').html('<p style="color:red">이메일 형식으로 작성 필요</p>');
						
					} else {
						if ($.trim(data) == 0) {
							$('#checkMsg_id').html('<p style="color:red">존재하지 않는 아이디입니다.</p>');
							
						} 
					}
				}
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	});
	
	
//////////////////////// 인증번호 받기 ////////////////////////

	
	authChkInput.style.display = 'none';
	authChkBtn.style.display = 'none';
	
////////////////////////인증번호 신청 ////////////////////////
	$('.authSMS').on("click", function() {
		
		if (id.val() == null || id.val() == undefined || id.val() == "") {
			$('#checkMsg_id').html('<p style="color:red">아이디를 입력해주세요.</p>');
			id.focus();
			return false;
		} else if (!idPattern.test(id.val())) {
			$('#checkMsg_id').html('<p style="color:red">이메일 형식으로 작성 필요</p>');
			id.focus();
			return false;
		} else if (phone.val() == null || phone.val() == undefined || phone.val() == "") {
			$('#checkMsg_id').html('<p style="color:red">전화번호를 입력해주세요.</p>');
			phone.focus();
			return false;
		} else {
			$('#checkMsg_id').html('');
			
			$.ajax({ 
				type : 'POST',
				url : 'authSMS',
				data : {
					"id" : id.val(),
					"phone" : phone.val()
				},
				dataType :'json',
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				}
			})
			.done (function(data) {
				if (data == -1) {
					$('#checkMsg_id').html('<p style="color:red">가입 시 등록 된 전화번호가 아닙니다.</p>');
				} else {

					authChkInput.style.display = 'block';
					authChkBtn.style.display = 'block';
					
					
	//				phone.attr('readonly', true);
					$('#checkMsg_id').html('<p style="color:blue">인증 번호가 발송되었습니다.&nbsp;&nbsp;'+ store + '</p>');
				}
				console.log("smsSend");
				console.log(data);
				
			})
			.fail (function(request, status, error) {
				// 통신 실패하였을 때
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				// 안내 메시지를 보여준다.
				console.log('fail');
				
			})
			.always (function (data, status, responseObj) {
					
				// 성공 실패와 상관 없이 항상 처리를 하는 내용을 담습니다. 
				console.log('always');
				
			});
		}
	});
	

	
////////////////////////인증번호 확인 ////////////////////////
	$('.authSMSChk').on('click', function(){
		
		$.ajax({ 
			type : 'POST',
			url : 'authSMS',
			data : {
				"id" : id.val(),
				"phone" : phone.val(),
				"authCode" : authCode.val()
			},
			dataType :'json',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			}
		})
		.done (function(data) {
			if (data == 0) {
				$('.pwdSearchAsk').attr('disabled',false);
				$('#checkMsg_id').html('<p style="color:blue">인증 완료!</p>');
				console.log("smsChk ok");
				console.log(data);
			} else if (data == 1) {
				$('#checkMsg_id').html('<p style="color:red">인증 시간이 초과되었습니다.</p>');
			} else if (data == 2) {
				$('#checkMsg_id').html('<p style="color:red">인증번호가 올바르지 않습니다.</p>');
			} else if (data == -1) {
				$('#checkMsg_id').html('<p style="color:red">인증에 실패하였습니다.<br>고객센터로 문의해주세요.</p>');
			}
				
		})
		.fail (function(request, status, error) { 
			// 통신 실패하였을 때
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			// 안내 메시지를 보여준다.
			console.log('fail');
		})
		.always (function (data, status, responseObj) {
			
			// 성공 실패와 상관 없이 항상 처리를 하는 내용을 담습니다. 
			console.log('always');
		});
	});
	
});