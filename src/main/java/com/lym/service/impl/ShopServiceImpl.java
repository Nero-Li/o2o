package com.lym.service.impl;

import com.lym.dao.ShopDao;
import com.lym.dto.ShopExcution;
import com.lym.entity.Shop;
import com.lym.enums.ShopStateEnum;
import com.lym.exception.ShopOperationException;
import com.lym.service.ShopService;
import com.lym.util.ImageUtil;
import com.lym.util.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.util.Date;

/**
 * @ClassName ShopServiceImpl
 * @Author lyming
 * @Date 2019/1/6 19:24
 **/
@Service
public class ShopServiceImpl implements ShopService {

    @Autowired
    private ShopDao shopDao;

    @Override
    @Transactional
    public ShopExcution addShop(Shop shop, InputStream shopImgInputStream, String fileName) {
        //空值判断
        if (shop == null) {
            return new ShopExcution(ShopStateEnum.NULL_SHOP);
        }
        try {
            shop.setEnableStatus(0);
            shop.setCreateTime(new Date());
            shop.setLastEditTime(new Date());
            int effectedNum = shopDao.insertShop(shop);
            if (effectedNum <= 0) {
                throw new ShopOperationException("店铺创建失败");
            } else {
                if (shopImgInputStream != null) {
                    try {
                        //存储图片
                        addShopImg(shop, shopImgInputStream, fileName);
                    } catch (Exception e) {
                        throw new ShopOperationException("add shopImg error:" + e.getMessage());
                    }
                    //更新店铺图片地址
                    effectedNum = shopDao.updateShop(shop);
                    if (effectedNum <= 0) {
                        throw new ShopOperationException("更新图片地址失败");
                    }
                }
            }
        } catch (Exception e) {
            /**
             * 只有抛出RuntimeException,事务才会生效,Exception不会回滚,不抛也不会回滚
             */
            throw new ShopOperationException("addShop error:" + e.getMessage());
        }
        return new ShopExcution(ShopStateEnum.CHECK, shop);
    }

    private void addShopImg(Shop shop, InputStream shopImgInputStream, String fileName) {
        //获取shop图片目录的相对路径
        String dest = PathUtil.getShopImagePath(shop.getShopId());
        String shopImgAddr = ImageUtil.generateThumbnal(shopImgInputStream, fileName, dest);
        shop.setShopAddr(shopImgAddr);
    }
}
