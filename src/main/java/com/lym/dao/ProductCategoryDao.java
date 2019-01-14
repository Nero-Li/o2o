package com.lym.dao;

import java.util.List;

import com.lym.entity.ProductCategory;

/**
 * 店铺商品类别Dao
 * @author Administrator
 *
 */
public interface ProductCategoryDao {

	/**
	 * 通过shopId查询店铺商品类别
	 * @param shopId
	 * @return
	 */
	List<ProductCategory> queryProductCategoryList(Long shopId);
}
