package com.lym.dao;

import com.lym.entity.Product;

public interface ProductDao {

    /**
     * 插入商品
     **/
    int insertProduct(Product product);

    /**
     * 根据productId查询商品信息
     *
     * @param productId
     * @return
     */
    Product getProductById(Long productId);

    /**
     * 根据productId删除商品信息
     *
     * @param productId
     * @return
     */
    int deleteProductById(Long productId);

    /**
     * 更新店铺信息
     *
     * @param product
     * @return
     */
    int updateProduct(Product product);
}
