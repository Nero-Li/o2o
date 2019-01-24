package com.lym.service;

import com.lym.BaseTest;
import com.lym.dto.ImageHolder;
import com.lym.entity.Product;
import com.lym.entity.ProductCategory;
import com.lym.entity.Shop;
import com.lym.enums.ProductStateEnum;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName ProductServiceTest
 * @Description TODO
 * @Author lyming
 * @Date 2019/1/24 11:36 PM
 **/
public class ProductServiceTest extends BaseTest {

    @Autowired
    private ProductService productService;

    @Test
    public void testAddProduct() throws FileNotFoundException {
        Product product = new Product();
        Shop shop = new Shop();
        shop.setShopId(1L);
        ProductCategory productCategory = new ProductCategory();
        productCategory.setProductCategoryId(3L);
        product.setShop(shop);
        product.setProductCategory(productCategory);
        product.setProductName("测试商品0001");
        product.setProductDesc("testProduct00001");
        product.setPriority(20);
        product.setCreateTime(new Date());
        product.setLastEditTime(new Date());
        product.setEnableStatus(ProductStateEnum.SUCCESS.getState());
        //创建缩略图文件流
        File thumbnail = new File("/Users/lym/Pictures/demo1.png");
        InputStream is = new FileInputStream(thumbnail);
        ImageHolder imageHolder = new ImageHolder(thumbnail.getName(), is);
        //创建两个详情图片文件流
        File productImg1 = new File("/Users/lym/Pictures/demo2.jpg");
        File productImg2 = new File("/Users/lym/Pictures/demo3.jpg");
        InputStream is1 = new FileInputStream(productImg1);
        InputStream is2 = new FileInputStream(productImg2);
        List<ImageHolder> productImgList = new ArrayList<>();
        productImgList.add(new ImageHolder(productImg1.getName(), is1));
        productImgList.add(new ImageHolder(productImg2.getName(), is2));
        //添加商品
        productService.addProduct(product, imageHolder, productImgList);
    }
}
