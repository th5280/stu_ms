package com.stums.po;

public class CourseView extends Course{
	private	String tea_name;
	private String major_name;
	private int major_college_id;
	
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String teaName) {
		tea_name = teaName;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String majorName) {
		major_name = majorName;
	}
	public int getMajor_college_id() {
		return major_college_id;
	}
	public void setMajor_college_id(int majorCollegeId) {
		major_college_id = majorCollegeId;
	}
	
	
}
