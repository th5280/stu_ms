package com.stums.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.CourseCustomMapper;
import com.stums.mapper.CourseMapper;
import com.stums.mapper.SelectionCustomMapper;
import com.stums.po.Course;
import com.stums.po.CourseView;
import com.stums.po.Student;
import com.stums.service.CourseService;

@Component
public class CourseServiceImpl implements CourseService{
	
	@Autowired
	private CourseCustomMapper courseCustomMapper;
	
	@Autowired
	private CourseMapper courseMapper;
	
	@Autowired
	private SelectionCustomMapper selectCustomMapper;
	
	public List<CourseView> findCourseViewListByTea(int tea_tid) {
		System.out.println("tea_tid"+tea_tid);
		return courseCustomMapper.findCourseViewByTea(tea_tid);
	}

	public void addCourse(Course course) {
		course.setCourse_id(courseMapper.getNewCourseId());
		courseMapper.addCourse(course);
	}

	public CourseView findCourseViewById(int courseId) {
		return courseCustomMapper.findCourseView(courseId);
	}

	public void editCourse(Course course) {
		courseMapper.editCourse(course);
	}

	public void deleteCourse(int course_id) {
		courseMapper.deleteCourse(course_id);
	}



	public List<String> getSemList(List<Integer> courseIdList) {		
		return courseMapper.getSemList(courseIdList);
	}

	public List<CourseView> findUnSelectedCourse(Student stu) {
		List<CourseView> list = courseCustomMapper.findUnSelectedCourse(stu);
		for(CourseView cv:list)
		{
			cv.setCourse_time(cv.getCourse_time().replace("$", " "));
		}
		return list;
	}
}
