package com.stums.mapper;

import com.stums.po.Teacher;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {
	
	public void deleteTea(int tea_tid);
	
	public void editTea(Teacher tea);
	
	public void addTea(Teacher tea);
	
	public Integer getNewTea_id(Teacher tea);
	
	public List<Teacher> findTeacherListByCollege(int college_id);
   
	public List<Teacher> findTeacherListByMajor(int major_id);
}