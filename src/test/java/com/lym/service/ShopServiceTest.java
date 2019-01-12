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
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

/**
 * @ClassName ShopServiceTest
 * @Author lyming
 * @Date 2019/1/6 23:15
 **/
public class ShopServiceTest extends BaseTest {

    @Autowired
    private ShopService shopService;

    @Test
    public void addShopTest() throws FileNotFoundException {
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
        shop.setShopName("测试的店铺0");
        shop.setShopDesc("testDesc");
        shop.setPhone("testPhone");
        shop.setShopAddr("testAddr");
        shop.setShopImg("testImg");
        shop.setPriority(1);
        shop.setCreateTime(new Date());
        shop.setEnableStatus(ShopStateEnum.CHECK.getState());
        shop.setAdvice("审核中");
        File file = new File("C:\\Users\\lym\\Pictures\\thumb-1920-641968.jpg");
        InputStream is = new FileInputStream(file);
        ShopExcution shopExcution = shopService.addShop(shop, is, file.getName());
        System.out.println(shopExcution.getState());
    }

    @Test
    public void testUpdateShop() {
        try {
            Shop shop = shopService.getByShopId(17L);
            shop.setShopName("修改后的店铺");
            File file = new File("C:\\Users\\lym\\Desktop\\dabai.jpg");
            FileInputStream inputStream = new FileInputStream(file);
            ShopExcution shopExcution = shopService.updateShop(shop, inputStream, "dabai.jpg");
            System.out.println("新的图片地址为:" + shopExcution.getShop().getShopImg());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Test
    public void testQueryShopListCount() {
    	Shop shopCondition = new Shop();
    	ShopCategory shopCategory = new ShopCategory();
    	shopCategory.setShopCategoryId(1L);
    	shopCondition.setShopCategory(shopCategory);
    	ShopExcution se = shopService.getShopList(shopCondition, 0, 2);
    	System.out.println("========="+se.getShopList().size());
    	System.out.println("========="+se.getCount());
    	System.out.println("测试断点");
    }
}
