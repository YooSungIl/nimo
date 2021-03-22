$(function() {

	var id = $("#join_id");
	var idR;
	var pwd = $("#join_pwd");
	var pwdC = $("#join_pwdChk");
	var name = $("#join_name");
	var phone = $("#join_phone");
	var postcode = $("#join_addr_postcode");
	var address = $("#join_addr_detail");
	var idPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var pwdPattern = /^.*(?=^.{8,24}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]).*$/;


//	id.on('keypress', function() {
//		$('#checkMsg_id').html('');
//	});
//	pwd.on('keypress', function() {
//		$('#checkMsg_pwd').html('');
//	});
//	name.on('keypress', function() {
//		$('#checkMsg_name').html('');
//	});
//	phone.on('keypress', function() {
//		$('#checkMsg_phone').html('');
//	});
//	addr.on('keypress', function() {
//		$('#checkMsg_addr').html('');
//	});
//	address.on('keypress', function() {
//		$('#checkMsg_address').html('');
//	});

///////////////// 아이디 중복 체크 & 유효성 체크/////////////////
	
	id.on("blur", function () {
		var valId = id.val();
		
		if (valId == null || valId == undefined || valId == "") {
			$('#checkMsg_id').html('<p style="color:red">필수 입력 항목입니다.</p>');
		}
	});
	
//	input 실시간 감지
	id.on('propertychange change keyup paste input', function() {

		var valId = id.val();
		
		if(idR != id.val() || idR == null || idR == undefined || idR == "") {
			id.attr("idCheck", "N");
			console.log(id.attr("idCheck"));
			console.log(idR);
		} else {
			id.attr("idCheck", "Y");
		}
		
		
		if (!idPattern.test(valId)) {
			$('#checkMsg_id').html('<p style="color:red">이메일 형식으로 작성 필요</p>');
		} else {
			$('#checkMsg_id').html('');
		}
//		아이디 패턴 즉시변화 확인
//		console.log(idPattern.test(valId));
	});
	
//	input 실시간 감지
	id.on('propertychange change keyup paste input', function() {
		
		idR = id.val();
		
	});
	
	
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
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
							id.attr("idCheck", "Y")
							$('#checkMsg_id').html('<p style="color:blue">사용 가능한 아이디입니다.</p>');
							console.log(id.attr("idCheck"));
						} else {
							id.attr("idCheck", "N")
							$('#checkMsg_id').html('<p style="color:red">중복 된 아이디입니다.</p>');
							console.log(id.attr("idCheck"));
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
	
///////////////// 아이디 유효성 체크 /////////////////

	
	
	

///////////////// 비밀번호 확인 /////////////////
//	var pwdPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,24}$/;
	
	
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
	
	
	
	
	
	
	
///////////////////////// keydown 비밀번호 확인 실패 /////////////////////////////
//	var d = "";
//	var c = "";
//	
//	pwd.on("keydown", function(event) {
//		var x = event.keyCode;
//		var y = String.fromCharCode(x);
//		
//		d = d + y;
//		console.log(d);
//		pwd.attr('value', d);
//		if (pwd.val() != "" || pwdC.val() != "") {
//			if (c == d) {
//				$('#checkMsg_pwdC').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
//			} else {
//				$('#checkMsg_pwdC').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
//			}
//		}
//	}); // end pwdCheck
//	
//	pwdC.on("keydown", function(event) {
//		var x = event.keyCode;
//		var y = String.fromCharCode(x);
//		var a = new Array();
//		console.log(y);
//		a.push(y);
////		var c = "";
//		for(var i = 0; i<a.length; i++){
//			console.log(a[i]);
//			c = c + a[i];
//			console.log(c);
//		};
//		console.log(c);
////		pwdC.attr('value', c);
//		if (pwd.val() != "" || pwdC.val() != "") {
//			if (c == d) {
//				$('#checkMsg_pwdC').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
//			} else {
//				$('#checkMsg_pwdC').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
//			}
//		}
//	}); // end pwdCheck
	
	
	
	
///////////////// 이름 입력사항 확인 /////////////////
	name.on("blur", function () {
		var valName = name.val();
		
		if (valName == null || valName == undefined || valName == "") {
			$('#checkMsg_name').html('<p style="color:red">필수 입력사항입니다.</p>');
		}
	});
	
	name.on('keypress', function() {
		$('#checkMsg_name').html('');
	});
	
	
	
///////////////// 전화번호 입력사항 확인 /////////////////
	phone.on("blur", function () {
		var valPhone = phone.val();
		
		if (valPhone == null || valPhone == undefined || valPhone == "") {
			$('#checkMsg_phone').html('<p style="color:red">필수 입력사항입니다.</p>');
		}
	});
	
	phone.on('keypress', function() {
		$('#checkMsg_phone').html('');
	});
	
	
	
	
///////////////// 주소 검색 /////////////////

// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');

	$('#closeDaumPostcode').on("click", function() {
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
		console.log("닫기");
	});
	
	
	
///////////////// 도로명 주소 검색 /////////////////
//	$('#join_addr_btn').click(function() {
//		new daum.Postcode({
//			oncomplete: function(data) {
//				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
//
//				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
//				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
//				var addr = ''; // 주소 변수
//				var extraAddr = ''; // 참고항목 변수
//
//				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
//				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
//					addr = data.roadAddress;
//				} else { // 사용자가 지번 주소를 선택했을 경우(J)
//					addr = data.jibunAddress;
//				}
//
//				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
//				if(data.userSelectedType === 'R'){
//					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
//					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
//					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
//						extraAddr += data.bname;
//					}
//					// 건물명이 있고, 공동주택일 경우 추가한다.
//					if(data.buildingName !== '' && data.apartment === 'Y'){
//						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
//					}
//					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
//					if(extraAddr !== ''){
//	                	extraAddr = ' (' + extraAddr + ')';
//					}
//					// 조합된 참고항목을 해당 필드에 넣는다.
//					document.getElementById("join_addr_extra").value = extraAddr;
//	                
//				} else {
//					document.getElementById("join_addr_extra").value = '';
//				}
//
//				// 우편번호와 주소 정보를 해당 필드에 넣는다.
//				document.getElementById('join_addr_postcode').value = data.zonecode;
//				document.getElementById('join_addr_address').value = addr;
//	            // 커서를 상세주소 필드로 이동한다.
//				document.getElementById("join_addr_detail").focus();
//
//				// iframe을 넣은 element를 안보이게 한다.
//				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
//				element_layer.style.display = 'none';
//			},
//			width : '100%',
//			height : '100%',
//			maxSuggestItems : 5
//		}).embed(element_layer);
//
//		// iframe을 넣은 element를 보이게 한다.
//		element_layer.style.display = 'block';
//
//		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
//		initLayerPosition();
//	});
	
	
	
	
///////////////// 도로명 + 지번 주소 검색 /////////////////
	$('#join_addr_btn').click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수
				
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
//				document.getElementById('join_addr_postcode').value = data.zonecode;
//				document.getElementById('join_addr_address').value = '(' + data.zonecode + ')' + roadAddr;
//				document.getElementById("join_addr_jibun").value = '(' + data.zonecode + ')' + data.jibunAddress;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                	document.getElementById('join_addr_address').value = '(' + data.zonecode + ')' + roadAddr + extraRoadAddr;
    				document.getElementById("join_addr_jibun").value = '(' + data.zonecode + ')' + data.jibunAddress + extraRoadAddr;
//                    document.getElementById("join_addr_extra").value = extraRoadAddr;
                } else {
                	document.getElementById('join_addr_address').value = '(' + data.zonecode + ')' + roadAddr;
    				document.getElementById("join_addr_jibun").value = '(' + data.zonecode + ')' + data.jibunAddress;
//                    document.getElementById("join_addr_extra").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }

				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layer.style.display = 'none';
			},
			width : '100%',
			height : '100%',
			maxSuggestItems : 5
		}).embed(element_layer);

		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';

		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	});
	
	
	

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition(){
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 5; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	}
	//////////////// 주소검색 end ////////////////
	
	address.on('keypress', function() {
		$('#checkMsg_address').html('');
	});

	
	
////////////// 가입체크 //////////////
//	var idPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//    var pwdPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
//    var namePattern = /^[가-힣a-zA-Z]{2,8}$/;
//    var phonePattern = /(^02.{0}|^01.{1}|[0-9]{4})([0-9]+)([0-9]{4})/g;
    
	
	$('.joinAsk').on("click", function() {
		var valId = id.val();
		var idCheck = id.attr('idCheck');
		var valPwd = pwd.val();
		var valPwdC = pwdC.val();
		var valName = name.val();
		var valPhone = phone.val();
		var valPostcode = postcode.val();
		var valAddress = address.val();

		if (valId == null || valId == undefined || valId == "") {
			$('#checkMsg_id').html('<p style="color:red">필수 입력 항목입니다.</p>');
			id.focus();
			return false;
		}
		if (idCheck == "" || idCheck == "N") {
			$('#checkMsg_id').html('<p style="color:red">중복확인을 해주세요.</p>');
			id.focus();
			return false;
		}
		if (!idPattern.test(valId)) {
			$('#checkMsg_id').html('<p style="color:red">이메일 형식으로 작성 필요</p>');
			id.focus();
			return false;
		}
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
		if (valName == null || valName == undefined || valName == "") {
			$('#checkMsg_name').html('<p style="color:red">필수 입력 항목입니다.</p>');
			name.focus();
			return false;
		}
		if (valPhone == null || valPhone == undefined || valPhone == "") {
			$('#checkMsg_phone').html('<p style="color:red">필수 입력 항목입니다.</p>');
			phone.focus();
			return false;
		}
		if (valPostcode == null || valPostcode == undefined || valPostcode == "") {
			$('#checkMsg_postcode').html('<p style="color:red">주소를 검색해주세요.</p>');
			postcode.focus();
			return false;
		}
		if (valAddress == null || valAddress == undefined || valAddress == "") {
			$('#checkMsg_address').html('<p style="color:red">상세주소를 입력해주세요.</p>');
			address.focus();
			return false;
		}
		
		$('.joinAsk').submit();
	});
});