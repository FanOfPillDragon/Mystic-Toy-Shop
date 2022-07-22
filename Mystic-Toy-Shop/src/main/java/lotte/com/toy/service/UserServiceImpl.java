package lotte.com.toy.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lotte.com.toy.dao.UserDao;
import lotte.com.toy.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userdao;

    @Override
    public String getUserId(String user_id) {
        int count = userdao.getUserId(user_id);
        return count>0?"NO":"YES";
    }

    @Override
    public boolean addUser(UserDto dto) {
        if(dto.getUser_kakao_identifier().length() == 4){
            dto.setUser_kakao_identifier("0");
        }
        int n = userdao.addUser(dto);
        return n>0?true:false;
    }

    @Override
    public UserDto userLogin(UserDto dto) {
        return userdao.userLogin(dto);
    }

    @Override
    public String getSellerId(String seller_id) {
        int count = userdao.getSellerId(seller_id);
        return count>0?"NO":"YES";
    }

    @Override
    public boolean addSeller(SellerDto dto) {
        int n = userdao.addSeller(dto);
        return n>0?true:false;
    }

    @Override
    public SellerDto sellerLogin(SellerDto dto) {
        return userdao.sellerLogin(dto);
    }

    @Override
    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");

            sb.append("&client_id=a7b71fe2e271db4868dd5a0203d15d30"); //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8091/login_callback.do"); // 본인이 설정한 주소

            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
    }

    @Override
    public HashMap<String, Object> getUserInfo(String access_Token) {

        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            String id = element.getAsJsonObject().get("id").getAsString();

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            if(kakao_account.getAsJsonObject().get("email") != null){
                String email = kakao_account.getAsJsonObject().get("email").getAsString();
                userInfo.put("email", email);
            }

            userInfo.put("nickname", nickname);
            userInfo.put("id", id);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return userInfo;
    }

    @Override
    public int getKakaoId(String user_kakao_identifier) {

        System.out.println(user_kakao_identifier + " service");
        int count = userdao.getKakaoId(user_kakao_identifier);
        System.out.println(count + " service");
        return count;
    }

    @Override
    public UserDto kakaoUserLogin(String user_kakao_identifier) {
        return userdao.kakaoUserLogin(user_kakao_identifier);
    }

    @Override
    public String findNameByUserId(int userId) {
        return userdao.findNameByUserId(userId);
    }

}
