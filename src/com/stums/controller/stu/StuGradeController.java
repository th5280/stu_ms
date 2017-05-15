package com.stums.controller.stu;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stums.po.*;
import com.stums.service.*;

@Controller
@RequestMapping("/stu_grade")
public class StuGradeController {
	
	@Resource(name="gradeServiceImpl")
	private GradeService gradeService;
	
	@RequestMapping("/queryGrade")
	public ModelAndView queryGrade(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<GradeView> list = gradeService.findGradeViewListByStu(user.getUser_id());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("gradeView_list", list);
		modelAndView.setViewName("stu/queryGrade");
		return modelAndView;
	}

}
