package com.ss.demo.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Service
public class PayService {

	//---------------------환불, 결제 토큰생성
		private String impKey = "0830272243640038";

		private String impSecret = "BMWpjpF1BImo7FTOambSUusQAq8JjK2jWTLw5Q0JMNGSfD14w4mOcP88KRN9bAGnzLzeTb1kbENSTpi8";

		public String getToken() throws Exception {

			HttpsURLConnection conn = null;
			URL url = new URL("https://api.iamport.kr/users/getToken");

			conn = (HttpsURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setDoOutput(true);
			JsonObject json = new JsonObject();

			json.addProperty("imp_key", impKey);
			json.addProperty("imp_secret", impSecret);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
			bw.write(json.toString());
			bw.flush();
			bw.close();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

			Gson gson = new Gson();

			String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();


			String token = gson.fromJson(response, Map.class).get("access_token").toString();

			br.close();
			conn.disconnect();

			return token;
		}

		
        //결제 정보 불러오기
		public String paymentInfo(String imp_uid, String access_token) throws IOException, ParseException {
			HttpsURLConnection conn = null;

			URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);

			conn = (HttpsURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", access_token);
			conn.setDoOutput(true);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

			JsonParser parser = new JsonParser();

			JsonObject p = (JsonObject) parser.parse(br.readLine());
			
			String response = p.get("response").toString();
			
			p = (JsonObject) parser.parse(response);
			
			String amount = p.get("amount").toString();
			
			br.close();
			conn.disconnect();
			
			return amount;
		}
		
		public void paymentCancel(String access_token, String imp_uid, String amount
//				,String reason
				) throws IOException, ParseException {
			System.out.println("imp_uid = " + imp_uid);
			HttpsURLConnection conn = null;
			URL url = new URL("https://api.iamport.kr/payments/cancel");

			conn = (HttpsURLConnection) url.openConnection();

			conn.setRequestMethod("POST");

			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", access_token);

			conn.setDoOutput(true);
			
			JsonObject json = new JsonObject();

//			json.addProperty("reason", reason);
			json.addProperty("imp_uid", imp_uid);
			json.addProperty("amount", amount);
//			json.addProperty("checksum", amount);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			bw.write(json.toString());
			bw.flush();
			bw.close();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));		
			
			br.close();
			conn.disconnect();
			
		}
}