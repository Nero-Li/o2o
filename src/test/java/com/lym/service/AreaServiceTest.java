package com.lym.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lym.BaseTest;
import com.lym.entity.Area;

public class AreaServiceTest extends BaseTest{

	@Autowired
	private AreaService areaService;
	
	@Test
	public void testGetAreaList() {
		List<Area> areaList  = areaService.getAreaList();
		System.out.println(areaList.get(0).getAreaName());
	}
}
