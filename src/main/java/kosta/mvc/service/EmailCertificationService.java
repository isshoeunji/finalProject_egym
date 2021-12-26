package kosta.mvc.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class EmailCertificationService {
	
	@Autowired
	JavaMailSender emailSender;
	public static final String ePw = createKey(); //이후 DB에 저장해야함
	
	private MimeMessage createMessage(String to) throws Exception{
		System.out.println("보내는 대상 : "+ to);
		System.out.println("인증 번호 : "+ ePw);
		
		
		MimeMessage  message = emailSender.createMimeMessage();
		 	
		message.addRecipients(RecipientType.TO, to);//보내는 대상
		message.setSubject("EGYM 인증번호가 도착했습니다.");//제목
		
		String msgg="";
		msgg+= "<div style='margin:100px;'>";
		msgg+= "<h1> 안녕하세요  EGYM입니다. </h1>";
		msgg+= "<br>";
		msgg+= "<p>아래 코드를 이메일 인증창으로 돌아가 입력해주세요<p>";
		msgg+= "<br>";
		msgg+= "<p>감사합니다!<p>";
		msgg+= "<br>";
		msgg+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
		msgg+= "<h3 style='color:blue;'>이메일 인증 코드입니다.</h3>";
		msgg+= "<div style='font-size:130%'>";
		msgg+= "CODE : <strong>";
		msgg+= ePw+"</strong><div><br/> ";
		msgg+= "</div>";
		message.setText(msgg, "utf-8", "html");//내용
		//message.setFrom(new InternetAddress("properties에 작성한 이메일","BZshop"));//보내는 사람
		
		//System.out.println("테스트" + message);
		return message;
	}
	
//	인증코드 만들기
	public static String createKey() {
		StringBuffer key = new StringBuffer();
        Random rnd = new Random();

        for (int i = 0; i < 6; i++) { // 인증코드 6자리
            key.append((rnd.nextInt(10)));
        }
        return key.toString();
	}
	
	public String sendSimpleMessage(String to) throws Exception {
		// TODO Auto-generated method stub
		MimeMessage message = createMessage(to);
		System.out.println(message);
    	emailSender.send(message);
    	
    	return ePw;
    	
//	        try{//예외처리
//	        	System.out.println("성공");
//	        	emailSender.send(message);
//	        }catch(MailException es){
//	        	System.out.println("실패");
//	        	//es.printStackTrace();
//	            throw new IllegalArgumentException();
//	        }
		
	}
}
