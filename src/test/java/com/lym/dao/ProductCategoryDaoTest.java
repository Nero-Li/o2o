package com.lym.dao;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
import com.lym.BaseTest;
import com.lym.entity.ProductCategory;

public class ProductCategoryDaoTest extends BaseTest{
	
	Logger logger = LoggerFactory.getLogger(ProductCategoryDaoTest.class);
	
	@Autowired
	private ProductCategoryDao productCategoryDao;
	
	@Test
	public void testProductCategoryList() {
		List<ProductCategory> list = productCategoryDao.queryProductCategoryList(1L);
		logger.debug("测试断点");
	}

}
