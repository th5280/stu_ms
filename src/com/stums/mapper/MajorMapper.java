package com.stums.mapper;

import com.stums.po.Major;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MajorMapper {
	//查找专业列表
	public List<Major> findMajorList();
	
	//根据学院查询专业
	public List<Major> findMajorListByCollegeId(Integer college_id);

	public void editMajor(Major major);
	
	public void deleteMajor(int major_id);
	
	public Integer getNewMajor_id();
	
	public void addMajor(Major major);
	
}