package com.me.utils;

import com.me.domain.Mymail;

public class SendEmailUtils {
	private static final String SENDTEMP="smtp.qq.com";
	private static final String SENDFROM="695978952@qq.com";
	private static final String PASSWORD="psveqwlifayibchg";
	public static int sendEmails(String body,String addr) {

		Mymail mymail=new Mymail(SENDTEMP);
		mymail.setNeedAuth(true);
		if(mymail.setSubject("the Bank")==false) {
			return 0;
		}
		if(mymail.setBody(body)==false) {
			return 0;
		}
		if(mymail.setTo(addr)==false) {
			return 0;
		}
		if(mymail.setFrom(SENDFROM)==false) {
			return 0;
		}
		mymail.setNamePass("695978952", PASSWORD);
		
		if(mymail.sendout()==false) {
			return 0;
		}
		return 1;
	}
}
