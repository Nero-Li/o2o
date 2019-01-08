package com.lym.dao;

import com.lym.BaseTest;
import com.lym.entity.ShopCategory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @ClassName ShopCategoryDaoTest
 * @Author lyming
 * @Date 2019/1/8 23:49
 **/
public class ShopCategoryDaoTest extends BaseTest {

    @Autowired
    private ShopCategoryDao shopCategoryDao;

    @Test
    public void testShopCategoryDao() {
        ShopCategory shopCategory = new ShopCategory();
        ShopCategory shopCategoryParent = new ShopCategory();
        shopCategoryParent.setShopCategoryId(1L);
        shopCategory.setParent(shopCategoryParent);
        List<ShopCategory> shopCategoryList = shopCategoryDao.queryShopCategory(shopCategory);
        System.out.println(shopCategoryList);
    }
}
