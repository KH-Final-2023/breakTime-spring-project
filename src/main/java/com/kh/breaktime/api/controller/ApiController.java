package com.kh.breaktime.api.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Properties;

/**
 * Servlet implementation class WeatherCheckController
 */

@WebServlet("/Api.ap")
public class ApiController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApiController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String apiUrl = "https://apis.data.go.kr/B551011/KorService1/searchStay1";
			String serviceKey = "I2atMlAeZkfGfgZwpxb1Dl4m3bKK2DDbwZ1wArS7l%2FTOc4PG27oXEWANpkCjSNvMc88yUg%2BW7VF1HeKA0nqcrw%3D%3D";

			String numOfRows = "500";
			String pageNo = "1";
			String mobileOS = "ETC";
			String mobileApp = "BreakTime";
			String type = "json";

			StringBuilder urlBuilder = new StringBuilder(apiUrl);
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
			urlBuilder.append(
					"&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"));
			urlBuilder
					.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode(mobileOS, "UTF-8"));
			urlBuilder.append(
					"&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode(mobileApp, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader bf;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				bf = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				bf = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			String line;
			StringBuilder sb = new StringBuilder();
			while ((line = bf.readLine()) != null) {
				sb.append(line);
			}
			bf.close();
			conn.disconnect();

			String result = sb.toString();

			try {
				// JSON 파서 생성
				JSONParser parser = new JSONParser();

				// JSON 데이터 파싱
				JSONObject jsonObject = (JSONObject) parser.parse(result);

				// "item" 배열 추출
				JSONObject items = (JSONObject) ((JSONObject) jsonObject.get("response")).get("body");
				JSONArray itemArray = (JSONArray) ((JSONObject) items.get("items")).get("item");

				// 데이터베이스 연결
				String jdbcUrl = "jdbc:oracle:thin:@//localhost:1521/orcl";
				String username = "BREAKTIME";
				String password = "BREAKTIME";

				// JDBC 드라이버 로드
	            Class.forName("oracle.jdbc.driver.OracleDriver");

	            // 연결 속성 설정
	            Properties props = new Properties();
	            props.setProperty("user", username);
	            props.setProperty("password", password);

	            // 데이터베이스 연결
	            Connection connection = DriverManager.getConnection(jdbcUrl, props);

	            // DB에 저장할 SQL 쿼리 작성
	            String insertSql = "INSERT INTO HOUSE (BU_TITLE, BU_ADDRESS, AREA_NO, BU_CATEGORY, MAIN_IMG, BU_TEL) VALUES (?, ?, ?, ?, ?, ?)";
	            String updateSql = "UPDATE HOUSE SET BU_ADDRESS = ?, AREA_NO = ?, BU_CATEGORY = ?, MAIN_IMG = ?, BU_TEL = ? WHERE BU_TITLE = ?";

	            // SQL 쿼리를 실행할 PreparedStatement 생성
	            PreparedStatement insertStatement = connection.prepareStatement(insertSql);
	            PreparedStatement updateStatement = connection.prepareStatement(updateSql);
	            int result0 =0;

	            // "item" 배열의 각 요소를 순회하며 값을 DB에 저장 또는 업데이트
	            for (Object itemObj : itemArray) {
	                JSONObject item = (JSONObject) itemObj;
	                String cat3 = (String) item.get("cat3");

	                // cat3 값이 "B02010100", "B02010500", "B02010700", "B02010900"인 경우에만 처리
	                if (cat3.equals("B02010100") || cat3.equals("B02010500") || cat3.equals("B02010700") || cat3.equals("B02010900")) {
	                    String title = (String) item.get("title");
	                    String addr1 = (String) item.get("addr1");
	                    int areacode = Integer.parseInt((String) item.get("areacode"));
	                    String firstimage = (String) item.get("firstimage");
	                    String tel = (String) item.get("tel");

	                    // "[한국관광 품질인증/Korea Quality]"를 ""로 대체
	                    title = title.replace("[한국관광 품질인증/Korea Quality]", "");
	                    // "<br />"를 ", "로 대체
	                    tel = tel.replace("<br />", ", ");

	                    // 값을 바인딩하여 SQL 쿼리 실행
	                    insertStatement.setString(1, title);
	                    insertStatement.setString(2, addr1);
	                    insertStatement.setInt(3, areacode);
	                    insertStatement.setString(4, cat3); 
	                    insertStatement.setString(5, firstimage);
	                    insertStatement.setString(6, tel);
	                    try {
	                        result0 = insertStatement.executeUpdate();
	                        
	                    } catch (SQLIntegrityConstraintViolationException e) {
	                         e.printStackTrace();
	                         
	                        // PRIMARY KEY 제약 조건에 위배되어 INSERT가 실패한 경우, UPDATE 실행
	                        updateStatement.setString(1, addr1);
	                        updateStatement.setInt(2, areacode);
	                        updateStatement.setString(3, cat3); 
	                        updateStatement.setString(4, firstimage);
	                        updateStatement.setString(5, tel);
	                        updateStatement.setString(6, title);

	                        updateStatement.executeUpdate();
	                    }
	                }
	            }

	            // DB 저장 완료
	            System.out.println("DB에 데이터 저장 및 업데이트 완료");

	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
