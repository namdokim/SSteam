package com.ss.demo.service;

import java.util.HashMap;

public interface kakaologin {
	String getAccessToken(String autorize_code) throws Throwable;

	public HashMap<String, Object> getUserInfo(String access_Token);
}
