package kosta.mvc.service;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.BurnCalory;
import kosta.mvc.domain.FoodCalory;
import kosta.mvc.repository.BurnCalorieRepository;
import kosta.mvc.repository.FoodCalorieRepository;
import kosta.mvc.vo.Calorie;

@Service
public class CalorieService {
	
	@Autowired
	private FoodCalorieRepository foodCalorieRepository;
	@Autowired
	private BurnCalorieRepository burnCalorieRepository;
	
	private int getAge(int birthYear, int birthMonth, int birthDay)	{
		Calendar current = Calendar.getInstance();
		int currentYear  = current.get(Calendar.YEAR);
		int currentMonth = current.get(Calendar.MONTH) + 1;
		int currentDay   = current.get(Calendar.DAY_OF_MONTH);
	       
		int age = currentYear - birthYear;
		if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay)  
			age--;
	       
		return age;
	}

	public Calorie bmiOutput(Calorie cal) {
		double bmi = (double)cal.getWeight() / ((double)cal.getHeight()/100)/ ((double)cal.getHeight()/100);
		double bmiResult = (double)((int)(bmi*100))/100;
		String group ="";
		
		if(bmiResult<18.5) group="저체중";
		else if(bmiResult<22.9) group="정상";
		else if(bmiResult<24.9) group="과체중";
		else if(bmiResult<29.9) group="1단계 비만";
		else if(bmiResult<34.9) group="2단계 비만";
		else group="고도비만";
		
		if(bmiResult>=35.0) bmiResult=35.0;
		
		cal.setBmi(String.valueOf(bmiResult));
		cal.setGroup(group);
		
		return cal;
    }
	
	public Calorie calPreOutput(Calorie cal) {
		double bmr = 0;	//기초대사량
		double height = (double)cal.getHeight()/100;	//cm -> m
		double sw = 0;	//표준 몸무게
		int age = getAge(cal.getYear(), cal.getMonth(),cal.getDay());
		int targetDay = Integer.parseInt(cal.getTargetWeightDate())*30;	//달->일
		int targetWeight = cal.getWeight()-cal.getTargetWeight();	//현재무게-목표무게
		int dailyWeightTraining = targetWeight*7000/targetDay;	//운동으로 빼야할 칼로리
		int dailyEatCal = 3500 - dailyWeightTraining;	//하루에 먹어야할 칼로리
		
		if (dailyWeightTraining<0) dailyWeightTraining*=-1;
		
		//남여로 bmr계산식 구별
		if(cal.getGender().equals("남성")) {
			bmr = (66.47 + (13.75*cal.getWeight()) + (5*cal.getHeight()) - (6.76*age) );
			sw = height * height * 22;
		}else if(cal.getGender().equals("여성")){
			bmr = (655.1 + (9.56*cal.getWeight()) + (1.85*cal.getHeight()) - (4.68*age) );
			sw = height * height * 21;
		}
		
		//소수점 두자리로 짜르기
		double bmrResult = (double)((int)( bmr *100))/100; ;	//기초대사량 소수점 2자리
		double amr = (double)((int)( bmr*cal.getActivity() *100))/100; ;	//활동대사량
		double efd = (double)((int)( (bmr+amr)/9*100))/100;	//소화에 필요한 에너지
		double swResult = (double)((int)(sw*100))/100;	//소수점 2자리
		double totalResult = (double)((int)((bmrResult+amr+efd)*100))/100;	//소수점 2자리
		
		//output 값 저장
		cal.setStandardWeight(String.valueOf(swResult));
		cal.setBmr(String.valueOf(bmrResult));
		cal.setAmr(String.valueOf(amr));
		cal.setEfd(String.valueOf(efd));
		cal.setTotal(String.valueOf(totalResult));
		cal.setDailyWeightTraining(String.valueOf(dailyWeightTraining));
		cal.setDailyEatCal(String.valueOf(dailyEatCal));

		return cal;
    }
	
	public Page<FoodCalory> foodSelectAll(Pageable page){
		
		return foodCalorieRepository.findAll(page);
	}

	public Page<FoodCalory> foodSelectByName(String keyword, Pageable page){

		return foodCalorieRepository.findByFoodNameLike(keyword, page);
	}
	
	public Page<BurnCalory> burnSelectAll(Pageable page){
		
		return burnCalorieRepository.findAll(page);
	}

	public Page<BurnCalory> burnSelectByName(String keyword, Pageable page){
		
		return burnCalorieRepository.findByExerciseLike(keyword, page);
	}
}
