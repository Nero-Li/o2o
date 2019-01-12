package com.lym.service;

import com.lym.dto.ShopExcution;
import com.lym.entity.Shop;
import com.lym.exception.ShopOperationException;

import java.io.InputStream;

public interface ShopService {
	
	/**
	 *  获取店铺列表
	 * @param shopCondition
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public ShopExcution getShopList(Shop shopCondition,int pageIndex,int pageSize);

	/**
	 * 新增店铺
	 * 
	 * @param shop
	 * @param shopImgInputStream
	 * @param fileName
	 * @return
	 */
	ShopExcution addShop(Shop shop, InputStream shopImgInputStream, String fileName) throws ShopOperationException;

	/**
	 * 根据shopId获取店铺信息
	 * @param shopId
	 * @return
	 */
	Shop getByShopId(Long shopId);

	/**
	 * 更新店铺
	 * 
	 * @param shop
	 * @param shopImgInputStream
	 * @param fileName
	 * @return
	 */
	ShopExcution updateShop(Shop shop, InputStream shopImgInputStream, String fileName)throws ShopOperationException;
}
