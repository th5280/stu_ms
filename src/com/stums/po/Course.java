package com.stums.po;

public class Course {
    private Integer course_id;

    private String course_name;

    private Integer course_major_id;

    private Integer course_teacher_tid;

    private Integer course_credit;

    private String course_classroom;

    private Integer course_nature;
    
    private String course_time;
    
    private int course_stu_num;
    
    private int course_selection;

	public Integer getCourse_id() {
		return course_id;
	}

	public void setCourse_id(Integer courseId) {
		course_id = courseId;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String courseName) {
		course_name = courseName;
	}

	public Integer getCourse_credit() {
		return course_credit;
	}

	public void setCourse_credit(Integer courseCredit) {
		course_credit = courseCredit;
	}

	public String getCourse_classroom() {
		return course_classroom;
	}

	public void setCourse_classroom(String courseClassroom) {
		course_classroom = courseClassroom;
	}

	public String getCourse_time() {
		return course_time;
	}

	public void setCourse_time(String courseTime) {
		course_time = courseTime;
	}

	public Integer getCourse_nature() {
		return course_nature;
	}

	public void setCourse_nature(Integer courseNature) {
		course_nature = courseNature;
	}

	public int getCourse_stu_num() {
		return course_stu_num;
	}

	public void setCourse_stu_num(int courseStuNum) {
		course_stu_num = courseStuNum;
	}

	public Integer getCourse_teacher_tid() {
		return course_teacher_tid;
	}

	public void setCourse_teacher_tid(Integer courseTeacherTid) {
		course_teacher_tid = courseTeacherTid;
	}

	public Integer getCourse_major_id() {
		return course_major_id;
	}

	public void setCourse_major_id(Integer courseMajorId) {
		course_major_id = courseMajorId;
	}

	public int getCourse_selection() {
		return course_selection;
	}

	public void setCourse_selection(int courseSelection) {
		course_selection = courseSelection;
	}

    
}