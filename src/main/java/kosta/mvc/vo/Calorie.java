package kosta.mvc.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
public class Calorie {
	private String gender;
	private int year;
	private int month;
	private int day;
	private int height;
	private int weight;
	private int targetWeight;
	private String targetWeightDate;
	private double activity;
	
	private String bmi;	//체질량
	private String group;

	private String standardWeight;
	private String total;	//총 대사량
	private String bmr;	//기초대사량
	private String amr;	//활동대사량
	private String efd;	//Energy for digestion.
	
	private String dailyWeightTraining;	//운동으로 빼야할 칼로리
	private String dailyEatCal;	//하루에 먹어야할 칼로리
	
}
