package kosta.mvc.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.mvc.domain.product.Product;
import kosta.mvc.service.CertificationService;
import kosta.mvc.service.EmailCertificationService;
import kosta.mvc.service.ProductService;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class IndexController {

	@Autowired
	ProductService productService;
	
	List<Product> readNumList;
	List<Product> dateList;
	
	
	  
	@RequestMapping("/main")
	public String main() {
		return "board/main";// /WEB-INF/views/index.jsp이동
	}
	
	@RequestMapping("/shop")
	public String shop(Model model) {
		
		if(readNumList==null) {
			readNumList =  productService.selectByReadNum();
			dateList = productService.selectByDate();
		}
		model.addAttribute("readNumList", readNumList);
		model.addAttribute("dateList", dateList);
		return "shop/main";
	}

	@RequestMapping("/tos")
	public String tos() {
		return "board/tos";
	}
	
	
		
	//회원가입 휴대전화 인증
	private final CertificationService certificationService;
	
	@GetMapping("/check/sendSMS")
    public @ResponseBody
    String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<6; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        certificationService.certifiedPhoneNumber(phoneNumber, numStr);
		
		return numStr;
    }

	//아이디 찾기 이메일 인증
	@Autowired
	EmailCertificationService emailCertificationService;
	 
	@PostMapping("/check/sendEmail")
	@ResponseBody
	public String emailConfirm(String memberEmail)throws Exception{
		//logger.info("post emailConfirm");
		System.out.println("전달 받은 이메일 : "+ memberEmail);
		String code = emailCertificationService.sendSimpleMessage(memberEmail);	
		
		return code;
	}
		
		
}
