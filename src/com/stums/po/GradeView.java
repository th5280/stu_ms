package com.stums.po;

public class GradeView extends Grade{
	
	private String course_name;
	private String stu_name;
	private int stu_class;
	private String major_name;
	private String college_name;
	
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String courseName) {
		course_name = courseName;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stuName) {
		stu_name = stuName;
	}
	public int getStu_class() {
		return stu_class;
	}
	public void setStu_class(int stuClass) {
		stu_class = stuClass;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String majorName) {
		major_name = majorName;
	}
	public String getCollege_name() {
		return college_name;
	}
	public void setCollege_name(String collegeName) {
		college_name = collegeName;
	}
	
	
}
