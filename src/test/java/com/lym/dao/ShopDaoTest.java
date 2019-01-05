package com.lym.dao;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lym.BaseTest;
import com.lym.entity.Area;
import com.lym.entity.PersonInfo;
import com.lym.entity.Shop;
import com.lym.entity.ShopCategory;

public class ShopDaoTest extends BaseTest{
	
	@Autowired
	private ShopDao shopDao;
	
	@Test
	public void testInsertShop() {
		Shop shop = new Shop();
		PersonInfo owner = new PersonInfo();
		Area area = new Area();
		ShopCategory shopCategory = new ShopCategory();
		owner.setUserId(1L);
		area.setAreaId(2);
		shopCategory.setShopCategoryId(1L);
		shop.setOwner(owner);
		shop.setArea(area);
		shop.setShopCategory(shopCategory);
		shop.setShopName("测试的店铺");
		shop.setShopDesc("testDesc");
		shop.setPhone("testPhone");
		shop.setShopAddr("testAddr");
		shop.setShopImg("testImg");
		shop.setPriority(1);
		shop.setCreateTime(new Date());
//		shop.setLastEditTime(new Date());
		shop.setEnableStatus(1);
		shop.setAdvice("审核中");
		shopDao.insertShop(shop);
		
	}

}
