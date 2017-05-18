package com.stums.po;

public class EvaResult {
	private int eva_course_id;
	private int eva_id;
	private String course_name;
	private int tea_tid;
	private String tea_name;
	private int avg_point;
	
	public int getEva_course_id() {
		return eva_course_id;
	}
	public void setEva_course_id(int evaCourseId) {
		eva_course_id = evaCourseId;
	}

	public int getEva_id() {
		return eva_id;
	}
	public void setEva_id(int evaId) {
		eva_id = evaId;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String courseName) {
		course_name = courseName;
	}
	public int getTea_tid() {
		return tea_tid;
	}
	public void setTea_tid(int teaTid) {
		tea_tid = teaTid;
	}
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String teaName) {
		tea_name = teaName;
	}
	public int getAvg_point() {
		return avg_point;
	}
	public void setAvg_point(int avgPoint) {
		avg_point = avgPoint;
	}
	
	
}
