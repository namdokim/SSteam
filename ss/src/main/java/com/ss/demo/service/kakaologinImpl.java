package com.ss.demo.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class kakaologinImpl implements kakaologin{
	String access_Token ="";
	String refresh_Token ="";
	String reqURL = "https://kauth.kakao.com/oauth/token";
	
	@Override
	public String getAccessToken(String autorize_code) throws Throwable {
		// TODO Auto-generated method stub
		try {
			URL url = new URL(reqURL);
			System.out.println("autorize_code="+autorize_code);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			//post 요청을 위해 기본값 setDoOutput true
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			
			//post요청에 필요로 요구하는 파라미터 스트림을 통해 전송 
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			//발급 받은 rest_api 키 넣기 
			sb.append("&client_id=5315428a54e0f5a6062ed76926689b70");
			// 설정한 리다이렉트 url 넣기
			sb.append("&http://localhost:8085/ss/User/kakaologin.do");
			// 코드 ???
			sb.append("&code="+autorize_code);
			System.out.println("sb=="+sb);
			System.out.println("sb.toString()="+sb.toString());
			bw.write(sb.toString());
			bw.flush();
			
			//성공시
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode="+responseCode);
			//요청을 통해 JSON타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body="+result);
			//잭슨 오브젝트 맵퍼 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String 를 map으로 변환 
			Map<String,Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>(){
			});
			
			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return access_Token;
	}
	//노란색 경고문을 없애는거 
	//컴파일러가 쓰지말라는거 제외 시킬떄 
	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		System.out.println("access_Token2="+access_Token);

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			String response ="";
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			System.out.println("conn="+conn.toString());
			
			InputStream stream = conn.getErrorStream();
		    if (stream != null) {
			    try (Scanner scanner = new Scanner(stream)) {
			        scanner.useDelimiter("\\Z");
			        response = scanner.next();
			    }			
			    System.out.println("error response : " + response);
		    }
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			System.out.println("result type" + result.getClass().getName()); // java.lang.String

			try {
				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				System.out.println(jsonMap.get("properties"));

				Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
				Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

				// System.out.println(properties.get("nickname"));
				// System.out.println(kakao_account.get("email"));

				String nickname = properties.get("nickname").toString();
				String email = kakao_account.get("email").toString();

				userInfo.put("nickname", nickname);
				userInfo.put("email", email);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

}
