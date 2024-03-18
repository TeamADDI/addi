package com.anim.clinic.admin.user.biz;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendSMSTwilio {

	// Find your Account Sid and Token at twilio.com/user/account
	public static final String ACCOUNT_SID = "AC2bb90f785cf3480e1abd04be01fd419e";
	public static final String AUTH_TOKEN = "f4243dcd17bea3b7eae63e19473735fe";

	// SMS 전송
	public static int sendSMS(String country, String u_tel) {

		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		// 휴대폰 인증번호 생성
		int authNum = randomRange(100000, 999999);

		// 전송대상 휴대폰 번호
		String sendTarget = "+" + country + u_tel;

		// 전송 메세지
		String authMsg = "The authentication number is [" + authNum + "]";

		Message message = Message.creator(
				// to
				new PhoneNumber(sendTarget),
				// from
				new PhoneNumber("+8201037397667"),
				// message
				authMsg).create();

		return authNum;

	}

	// 인증번호 범위 지정
	public static int randomRange(int n1, int n2) {
		return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	}

}