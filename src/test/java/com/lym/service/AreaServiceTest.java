package com.lym.service;

import com.lym.BaseTest;
import com.lym.entity.Area;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class AreaServiceTest extends BaseTest{

	@Autowired
	private AreaService areaService;
    @Autowired
    private CacheService cacheService;
	
	@Test
	public void testGetAreaList() {
		List<Area> areaList  = areaService.getAreaList();
		System.out.println(areaList.get(0).getAreaName());
        cacheService.removeFromCache(AreaService.AREALISYKEY);
        List<Area> areaList2 = areaService.getAreaList();
        System.out.println(areaList2.get(0).getAreaName());

	}
}
