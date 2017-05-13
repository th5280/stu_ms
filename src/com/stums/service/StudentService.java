package com.stums.service;

import java.util.List;

import com.stums.po.*;
import com.stums.po.Class;

public interface StudentService {
	
	/**
	 * @param sqv(query condition)
	 * @return list of student_view record
	 */
	public List<StudentView> findStudentListView(StuQueryVo sqv);
	
	/**
	 * @param Class
	 * @return the number of class meeting the condition(college,major,enter year)
	 */
	public Integer findClassNum(Class Class);
	
	/**
	 * @param major_id
	 * @return the grade in this major_id
	 */
	public List<Integer> findGradeList(Integer major_id);
	
	/**
	 * @param stu_id
	 * @return student_view record
	 */
	public StudentView findStudentView(Integer stu_id);

	/**
	 * update the student with stu_id(in param)
	 * @param stu
	 */
	public void editStu(Student stu);
	
	/**
	 * delete the student
	 * @param stu_id(the student deleted)
	 */
	public void deleteStu(Integer stu_id);
	/**
	 * add student
	 * @param stu(lack in stu_id which should be created in this method
	 * which )
	 */
	public void addStu(Student stu);

	
	public Student findStudentBySid(int userId);
	
	
}
