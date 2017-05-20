package com.stums.controller.stu;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stums.po.CourseView;
import com.stums.po.Evaluation;
import com.stums.po.User;
import com.stums.service.EvaService;
import com.stums.service.SelectionService;

@Controller
@RequestMapping("/stu_eva")
public class StuEvaController {
	

	@Resource(name="selectionServiceImpl")
	private SelectionService selectionService;
	
	@Resource(name="evaServiceImpl")
	private EvaService evaService;
	
	@RequestMapping("/evaCourse")
	public ModelAndView evaCourse(HttpServletRequest request)
	{
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		List<String> sem_list = new ArrayList();
		List<CourseView> courseView_list = evaService.findUnEvaCourseViewList(user.getUser_id());
		modelAndView.addObject("courseView_list",courseView_list);
		modelAndView.setViewName("stu/evaCourse");
		return modelAndView;
		
	}
	
	@RequestMapping("/evaCourseSubmit")
	public ModelAndView evaCourseSubmit(String[] course_id,String[] point,HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		for(int i=0;i<course_id.length;i++)
		{
			Evaluation eva = new Evaluation();
			eva.setEva_course_id(Integer.valueOf(course_id[i]));
			eva.setEva_point(Integer.valueOf(point[i]));
			eva.setEva_stu_sid(user.getUser_id());
			evaService.addEva(eva);
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/stu_course/querySelectingCourse.action");
		return modelAndView;
	}
}
