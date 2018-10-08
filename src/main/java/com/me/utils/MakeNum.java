package com.me.utils;

import java.util.Random;

public class MakeNum {

	public static String makeNum() {
		Random r = new Random();

		String num = r.nextInt(999999) + ""; 
		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < 6 - num.length(); i++) {
			sb.append("0");
		}
		num = sb.toString() + num;
		return num;
	}
}
