package com.lym.service;

import com.lym.entity.ShopCategory;

import java.util.List;

public interface ShopCategoryService {

	/**
	 * 根据查询条件获取店铺类型列表
	 * 
	 * @param shopCategoryCondition
	 * @return
	 */
	List<ShopCategory> getShopCategoryList(ShopCategory shopCategoryCondition);
}
