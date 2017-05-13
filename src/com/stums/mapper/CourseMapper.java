package com.stums.mapper;

import com.stums.po.*;


import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CourseMapper {
	public void addCourse(Course course);
	
	public int getNewCourseId();
	
	public void editCourse(Course course);
	
	public void deleteCourse(int course_id);
	
	//获得学期列表
	public List<String> getSemList(List<Integer> course_id_list);
   
	public  List<CourseView> getUnSelectedCourse(Student stu);
}