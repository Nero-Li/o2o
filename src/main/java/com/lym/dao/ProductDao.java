package com.lym.dao;

import com.lym.entity.Product;

public interface ProductDao {

    /**
     * 插入商品
     **/
    int insertProduct(Product product);
}
