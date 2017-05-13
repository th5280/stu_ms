package com.stums.service;
import java.util.List;

import com.stums.po.*;

public interface GradeService {
	public List<Grade> findGradeListByStu(int stu_id);
	
	
}
