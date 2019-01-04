package com.lym.dao;

import java.util.List;

import com.lym.entity.Area;

public interface AreaDao {
	
	/**
	  *  查询区域列表
	 * @return areaList
	 */
	List<Area> queryArea();
}
