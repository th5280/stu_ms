package com.stums.po;

public class Grade {
    private Integer stu_id;

    private Integer course_id;

    private Integer usual_grade;

    private Integer test_grade;

    private Integer final_grade;

    private Integer status;

    private Integer semester;

	public Integer getStu_id() {
		return stu_id;
	}

	public void setStu_id(Integer stuId) {
		stu_id = stuId;
	}

	public Integer getCourse_id() {
		return course_id;
	}

	public void setCourse_id(Integer courseId) {
		course_id = courseId;
	}

	public Integer getUsual_grade() {
		return usual_grade;
	}

	public void setUsual_grade(Integer usualGrade) {
		usual_grade = usualGrade;
	}

	public Integer getTest_grade() {
		return test_grade;
	}

	public void setTest_grade(Integer testGrade) {
		test_grade = testGrade;
	}

	public Integer getFinal_grade() {
		return final_grade;
	}

	public void setFinal_grade(Integer finalGrade) {
		final_grade = finalGrade;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSemester() {
		return semester;
	}

	public void setSemester(Integer semester) {
		this.semester = semester;
	}

    
}