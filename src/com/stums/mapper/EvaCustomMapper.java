package com.stums.mapper;

import java.util.List;

import com.stums.po.*;

public interface EvaCustomMapper {
	public void addEva(Evaluation eva);

	public List<EvaResult> queryEvaResultByTea(int tea_tid);

	public List<CourseView> findUnEvaCourseViewList(int stu_sid);
}
