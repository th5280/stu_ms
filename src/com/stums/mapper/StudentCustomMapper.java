package com.stums.mapper;

import java.util.List;

import com.stums.po.*;
import com.stums.po.Class;


public interface StudentCustomMapper {
	//查找用于显示的学生列表
	public List<StudentView> findStudentViewList(StuQueryVo sqv);

	//查找学院专业班级目录
	public Integer findClassNum(Class Class);
	
	public List<Integer> findGradeList(Integer major_id);
	
	public StudentView findStudentView(Integer stu_id);

	
}
