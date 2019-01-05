package com.lym.service;

import java.util.List;

import com.lym.entity.Area;

/**
  * 区域相关Service层
 * @author lyming
 *
 */
public interface AreaService {
	
	/**
	  * 查询区域列表
	 * @return areaList
	 */
	List<Area> getAreaList();
}
