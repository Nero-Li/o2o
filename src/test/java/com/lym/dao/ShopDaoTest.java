package com.lym.dao;

import com.lym.BaseTest;
import com.lym.entity.Area;
import com.lym.entity.PersonInfo;
import com.lym.entity.Shop;
import com.lym.entity.ShopCategory;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

public class ShopDaoTest extends BaseTest{
	
	
	private Logger logger = LoggerFactory.getLogger(ShopDaoTest.class);
	
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
		shop.setEnableStatus(1);
		shop.setAdvice("审核中");
		shopDao.insertShop(shop);

	}

	@Test
	public void testUpdateShop() {
		Shop shop = new Shop();
		PersonInfo owner = new PersonInfo();
		Area area = new Area();
		ShopCategory shopCategory = new ShopCategory();
		owner.setUserId(1L);
		area.setAreaId(2);
		shop.setShopId(1L);
		shopCategory.setShopCategoryId(1L);
		shop.setOwner(owner);
		shop.setArea(area);
		shop.setShopCategory(shopCategory);
		shop.setShopName("测试的店铺3");
		shop.setShopDesc("testDesc");
		shop.setPhone("testPhone");
		shop.setShopAddr("testAddr");
		shop.setShopImg("testImg");
		shop.setPriority(1);
		shop.setCreateTime(new Date());
		shop.setEnableStatus(1);
		shop.setAdvice("审核中");
		shopDao.updateShop(shop);
	}
	
	@Test
	public void testQueryByShopId() {
		logger.info("=========start========");
		Shop shop = shopDao.queryByShopId(17L);
		logger.info("=========end========");
		
	}

}
