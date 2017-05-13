package com.stums.mapper;

import com.stums.po.StuQueryVo;
import com.stums.po.Student;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
	//update student
	public void editStu(Student stu);
   
	//delete student
	public void deleteStu(Integer stu_sid);
	
	//generate new stu_id
	public Integer getNewStu_id(Student stu);
	
	//add student
	public void addStu(Student stu);

	public Student findStudentBySid(int userId);
}