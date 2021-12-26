package kosta.mvc.service;

import java.util.HashMap;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class CertificationService {

	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
		
		//System.out.println("service 호출");
        String api_key = "NCSWPI3FRDREWXRN";
        String api_secret = "2YBYMVYQ8ULZ3SU4CVHIHORNHO6IPCW6";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNumber);    // 수신전화번호
        params.put("from", "01041843714");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "EGYM 인증 메시지 : 인증번호는 " + "["+cerNum+"]" + " 입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
        	//System.out.println("성공");
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
        	//System.out.println("실패");
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }
}
