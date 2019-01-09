package com.lym.service;

import java.util.List;

import com.lym.entity.ShopCategory;

public interface ShopCategoryService {

	/**
	 * 获取店铺类型列表
	 * 
	 * @param shopCategoryCondition
	 * @return
	 */
	List<ShopCategory> getShopCategoryList(ShopCategory shopCategoryCondition);
}
