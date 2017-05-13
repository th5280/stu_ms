package com.stums.service;

import java.util.HashMap;
import java.util.List;

import com.stums.po.Course;
import com.stums.po.CourseView;
import com.stums.po.Student;

public interface CourseService {
	public List<CourseView> findCourseViewListByTea(int tea_tid);

	
	public void addCourse(Course course);
		
	public CourseView findCourseViewById(int course_id);

	public void editCourse(Course course);
	
	public void deleteCourse(int course_id);
	
	public List<String> getSemList(List<Integer> course_id_list);
	
	public List<CourseView> findUnSelectedCourse(Student stu);
}
