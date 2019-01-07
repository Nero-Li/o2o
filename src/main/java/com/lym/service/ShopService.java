package com.lym.service;

import com.lym.dto.ShopExcution;
import com.lym.entity.Shop;

import java.io.InputStream;

public interface ShopService {

    /**
     * 新增店铺
     * @param shop
     * @param shopImgInputStream
     * @param fileName
     * @return
     */
    ShopExcution addShop(Shop shop, InputStream shopImgInputStream, String fileName);
}
