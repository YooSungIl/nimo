package kr.co.nimo.member.authentication;

import java.util.HashMap;
import java.util.Map;

public class AuthSMS {

	// Find your Account Sid and Token at twilio.com/user/account
//	public static final String ACCOUNT_SID = "AC6f196fd77625ce223ce001810c6848b3";
//	public static final String AUTH_TOKEN = "ae41575313bffb4e3e64a95ccbcbc815";
	
	private Map<String, String> authMap = new HashMap<String, String>();
	private Map<String, Long> authTime = new HashMap<String, Long>();
	// SMS 전송
	public int sendSMS(String phone) {
		long sendTime = System.currentTimeMillis();

//		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		// 휴대폰 인증번호 생성
		int authNum = (int) (Math.random() * (999999 - 100000 + 1)) + 100000;
		// 테스트번호 생성
//		int authNum = 123456;


		// 전송대상 휴대폰 번호
//		String sendTarget = "+82" + phone;

		// 전송 메세지
//		String authMsg = "[Nimo] 인증번호 [" + authNum + "]를 5분 내에 입력해주세요." ;
		if (authMap.containsKey(phone)) {
			authMap.replace(phone, String.valueOf(authNum));
		} else {
			authMap.put(phone, String.valueOf(authNum));
		}
		authTime.put(phone, sendTime);
		
//		Message message = Message.creator(
//				// to
//				new PhoneNumber(sendTarget),
//				// from
//				new PhoneNumber("+16175397953"), 
//				// message
//				authMsg)
//				.create();

		System.out.println("SMS send");
		System.out.println(authNum);
		return 0;

	}
	
	public int smsCheck(String phone, String authCode) {
		long smsCheckTime = System.currentTimeMillis();
		
		System.out.println("authsms ===> " + authCode);
		
		if (authMap.containsKey(phone)) {
			if (authMap.get(phone).equals(authCode)) {
				System.out.println("equaltest ===> " +authMap.get(phone));
				if ((smsCheckTime - authTime.get(phone))/60000 <= 5) {
					System.out.println("auth check");
					return 0;
				} else {
					System.out.println("time out");
					return 1;
				}
			} else {
				System.out.println("check fail");
				return 2;
			}
		}
		System.out.println("check fail");
		return -1;
	}
}