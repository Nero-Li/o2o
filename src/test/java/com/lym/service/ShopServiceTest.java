package com.lym.service;

import com.lym.BaseTest;
import com.lym.dto.ShopExcution;
import com.lym.entity.Area;
import com.lym.entity.PersonInfo;
import com.lym.entity.Shop;
import com.lym.entity.ShopCategory;
import com.lym.enums.ShopStateEnum;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.util.Date;

/**
 * @ClassName ShopServiceTest
 * @Author lyming
 * @Date 2019/1/6 23:15
 **/
public class ShopServiceTest extends BaseTest {

    @Autowired
    private ShopService shopService;

    @Test
    public void addShopTest() {
        Shop shop = new Shop();
        PersonInfo owner = new PersonInfo();
        Area area = new Area();
        ShopCategory shopCategory = new ShopCategory();
        owner.setUserId(1L);
        area.setAreaId(2);
        shopCategory.setShopCategoryId(1L);
        shop.setOwner(owner);
        shop.setArea(area);
        shop.setShopCategory(shopCategory);
        shop.setShopName("测试的店铺1");
        shop.setShopDesc("testDesc");
        shop.setPhone("testPhone");
        shop.setShopAddr("testAddr");
        shop.setShopImg("testImg");
        shop.setPriority(1);
        shop.setCreateTime(new Date());
        shop.setEnableStatus(ShopStateEnum.CHECK.getState());
        shop.setAdvice("审核中");
        File file = new File("C:\\Users\\lym\\Pictures\\thumb-1920-641968.jpg");
        ShopExcution shopExcution = shopService.addShop(shop, file);
        System.out.println(shopExcution.getState());
    }
}