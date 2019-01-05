package com.lym.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lym.dao.AreaDao;
import com.lym.entity.Area;
import com.lym.service.AreaService;

@Service
public class AreaServiceImpl implements AreaService{

	@Autowired
	private AreaDao areaDao; 
	
	@Override
	public List<Area> getAreaList() {
		return areaDao.queryArea();
	}

}
