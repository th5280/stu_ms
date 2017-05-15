package com.stums.mapper;

import com.stums.po.Grade;
import com.stums.po.GradeView;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GradeCustomMapper {
	public List<GradeView> findGradeViewListByStu(int stu_sid);
}