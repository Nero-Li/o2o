package com.lym.dao;

import com.lym.entity.Shop;

/**
  * 店铺Dao
 * @author lyming
 *
 */
public interface ShopDao {
	
	/**
	  * 新增店铺
	 * @param shop
	 */
	public int insertShop(Shop shop);
	
}
