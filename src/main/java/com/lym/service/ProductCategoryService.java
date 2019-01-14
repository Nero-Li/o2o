package com.lym.service;

import java.util.List;

import com.lym.entity.ProductCategory;

/**
 * 商品类别Service
 * @author Administrator
 *
 */
public interface ProductCategoryService {

	/**
	 * 查询指定店铺下所有商品类别信息
	 * @param shopId
	 * @return
	 */
	List<ProductCategory> getProductCategoryList(Long shopId);
}
