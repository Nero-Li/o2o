package com.lym.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lym.dao.ProductCategoryDao;
import com.lym.entity.ProductCategory;
import com.lym.service.ProductCategoryService;

@Service
public class ProductCategoryServiceImpl implements ProductCategoryService{

	@Autowired
	private ProductCategoryDao  productCategoryDao;
	
	@Override
	public List<ProductCategory> getProductCategoryList(Long shopId) {
		
		return productCategoryDao.queryProductCategoryList(shopId);
	}

}
