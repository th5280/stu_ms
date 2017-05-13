package com.stums.mapper;

import java.util.List;

import com.stums.po.*;

public interface CourseCustomMapper {
	public List<CourseView> findCourseViewByTea(int tea_tid);
	
	public CourseView findCourseView(int course_id);
		
	public List<CourseView> findUnSelectedCourse(Student stu);

}
