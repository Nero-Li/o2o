package com.lym.service;

import com.lym.dto.ShopExcution;
import com.lym.entity.Shop;

import java.io.File;

public interface ShopService {
    /**
     * 新增店铺
     *
     * @param shop
     * @param shopImg
     * @return
     */
    ShopExcution addShop(Shop shop, File shopImg);
}
