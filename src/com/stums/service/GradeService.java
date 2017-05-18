package com.stums.service;
import java.util.List;

import com.stums.po.*;

public interface GradeService {
	
	public List<GradeView> findGradeViewListByStu(int stu_sid);
	
	public List<GradeView> findGradeViewListByCourse(int course_id);
	
	public void addGrade(Grade grade);
}
