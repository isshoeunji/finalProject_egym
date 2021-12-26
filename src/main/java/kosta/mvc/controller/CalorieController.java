package kosta.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.BurnCalory;
import kosta.mvc.domain.FoodCalory;
import kosta.mvc.service.CalorieService;
import kosta.mvc.vo.Calorie;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CalorieController {

	@Autowired
	private CalorieService calorieService;

	@RequestMapping("/bmiInput")
	public String bmiInput() {
		return "board/bmiInput";
	}

	@RequestMapping("/bmiOutput")
	public ModelAndView bmiOutput(Calorie cal) {
		System.out.println(cal);
		Calorie result = calorieService.bmiOutput(cal);

		return new ModelAndView("board/bmiOutput", "cal", result);
	}

	@RequestMapping("/calPreInput")
	public String calPreInput() {
		return "board/calPrescriptionInput";
	}

	@RequestMapping("/calPreOutput")
	public ModelAndView calPreOutput(Calorie cal) {
		Calorie result = calorieService.calPreOutput(cal);
		return new ModelAndView("board/calPrescriptionOutput", "cal", result);
	}

	@RequestMapping("/foodCal")
	public ModelAndView foodCal(@RequestParam(defaultValue = "1") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage-1,10, Direction.ASC, "foodNo" );
		ModelAndView mv = new ModelAndView();
		Page<FoodCalory> foodList = calorieService.foodSelectAll(pageable);
		
		int blockCount = 5;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;

		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);

		mv.addObject("pageList", foodList);
		mv.setViewName("board/foodCalList");
		return mv;
	}
	
	@RequestMapping("/selectFoodName")
	public ModelAndView selectFoodName(@RequestParam(defaultValue = "1") int nowPage, String keyword) {
		Pageable pageable = PageRequest.of(nowPage-1,10, Direction.ASC, "foodNo" );
		ModelAndView mv = new ModelAndView();
		keyword = "%"+keyword+"%";
		System.out.println(keyword);
		Page<FoodCalory> foodList = calorieService.foodSelectByName(keyword, pageable);
		
		int blockCount = 5;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		
		mv.addObject("keyword", keyword.replace("%", ""));
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		mv.addObject("status", true);
		mv.addObject("pageList", foodList);
		mv.setViewName("board/foodCalList");
		return mv;
	}

	@RequestMapping("/burnCal")
	public ModelAndView burnCal(@RequestParam(defaultValue = "1") int nowPage) {
		Pageable pageable = PageRequest.of(nowPage-1,10, Direction.ASC, "burncaloryNo" );
		ModelAndView mv = new ModelAndView();
		Page<BurnCalory> burnList = calorieService.burnSelectAll(pageable);
		
		int blockCount = 5;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;

		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);

		mv.addObject("pageList", burnList);
		mv.setViewName("board/burnCalList");
		return mv;
	}
	
	@RequestMapping("/selectExersize")
	public ModelAndView selectExersize(@RequestParam(defaultValue = "1") int nowPage, String keyword) {
		Pageable pageable = PageRequest.of(nowPage-1,10, Direction.ASC, "burncaloryNo" );
		ModelAndView mv = new ModelAndView();
		keyword = "%"+keyword+"%";
		System.out.println(keyword);
		Page<BurnCalory> burnList = calorieService.burnSelectByName(keyword, pageable);
		
		int blockCount = 5;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		
		mv.addObject("keyword", keyword.replace("%", ""));
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		mv.addObject("status", true);
		mv.addObject("pageList", burnList);
		mv.setViewName("board/burnCalList");
		return mv;
	}
}
