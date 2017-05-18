package com.stums.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.*;
import com.stums.po.*;
import com.stums.po.Class;

import com.stums.service.StudentService;

@Component
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentCustomMapper studentCustomMapper;
	
	@Autowired
	private StudentMapper studentMapper;
	
	public List<StudentView> findStudentViewList(StuQueryVo sqv) {
		return  studentCustomMapper.findStudentViewList(sqv);
	}

	public Integer findClassNum(Class Class) {
		return studentCustomMapper.findClassNum(Class);
	}

	public List<Integer> findGradeList(Integer majorId) {
		return studentCustomMapper.findGradeList(majorId);
	}

	public StudentView findStudentView(Integer stu_id) {
		return studentCustomMapper.findStudentView(stu_id);
	}

	public void editStu(Student stu) {
		studentMapper.editStu(stu);
	}

	
	public void deleteStu(Integer stuId) {
		studentMapper.deleteStu(stuId);
	}

	public void addStu(Student stu) {		
		//generate stu_id(find the max stu_id with the same college ,major,class and +1)
		int stu_id = studentMapper.getNewStu_id(stu);
		stu.setStu_sid(stu_id);
		studentMapper.addStu(stu);
		
			
	}

	public Student findStudentBySid(int userId) {
		return studentMapper.findStudentBySid(userId);
	}

	

}
