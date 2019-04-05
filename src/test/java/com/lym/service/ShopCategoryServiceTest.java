package com.lym.service;

import com.lym.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName ShopCategoryServiceTest
 * @Description TODO
 * @Author lyming
 * @Date 2019/4/5 9:56 PM
 **/
public class ShopCategoryServiceTest extends BaseTest {

    @Autowired
    private ShopCategoryService shopCategoryService;

    @Test
    public void queryShopCategory() {
        shopCategoryService.getShopCategoryList(null);
    }
}
