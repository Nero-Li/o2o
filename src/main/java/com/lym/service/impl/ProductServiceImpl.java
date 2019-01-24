package com.lym.service.impl;

import com.lym.dao.ProductDao;
import com.lym.dao.ProductImgDao;
import com.lym.dto.ImageHolder;
import com.lym.dto.ProductExecution;
import com.lym.entity.Product;
import com.lym.entity.ProductImg;
import com.lym.enums.ProductStateEnum;
import com.lym.exception.ProductOperationException;
import com.lym.service.ProductService;
import com.lym.util.ImageUtil;
import com.lym.util.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName ProductServiceImpl
 * @Description TODO
 * @Author lyming
 * @Date 2019/1/24 2:54 PM
 **/
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    @Autowired
    private ProductImgDao productImgDao;


    @Override
    @Transactional
    /**
     * 1.处理缩略图,获取缩略图相对路径并赋值给product
     * 2.向tb_product中写入商品信息,获取product_id
     * 3.结合product_id批量处理商品详情图
     * 4.将商品详情图批量插入tb_product_img中
     */
    public ProductExecution addProduct(Product product, ImageHolder imageHolder, List<ImageHolder> imageHolderList) throws ProductOperationException {
        //空值判断
        if (product != null && product.getShop() != null && product.getShop().getShopId() != null) {
            //给商品设置上默认属性
            product.setCreateTime(new Date());
            product.setLastEditTime(new Date());
            //默认上架状态
            product.setEnableStatus(1);
            //如果商品缩略图不为null,则添加
            if (imageHolder != null && null != imageHolder.getImage()) {
                addThumbnail(product, imageHolder);
            }
            try {
                //创建商品信息
                int effectiveNum = productDao.insertProduct(product);
                if (effectiveNum <= 0) {
                    throw new ProductOperationException("添加商品失败");
                }
            } catch (Exception e) {
                throw new ProductOperationException("创建商品失败:" + e.getMessage());
            }
            //如果商品详情图不为null,则添加
            if (imageHolderList != null && imageHolderList.size() > 0) {
                addProductImgs(product, imageHolderList);
            }

            return new ProductExecution(ProductStateEnum.SUCCESS, product);
        } else {
            return new ProductExecution(ProductStateEnum.EMPTY);
        }
    }

    /**
     * 生成缩略图
     *
     * @param product     商品实体类
     * @param imageHolder 图片处理的封装类
     */
    private void addThumbnail(Product product, ImageHolder imageHolder) {
        String dest = PathUtil.getShopImagePath(product.getShop().getShopId());
        String thumbnailAddr = ImageUtil.generateThumbnal(imageHolder, dest);
        product.setImgAddr(thumbnailAddr);
    }

    /**
     * 添加详情图
     *
     * @param product         商品实体类
     * @param imageHolderList 图片处理的封装类集合
     */
    private void addProductImgs(Product product, List<ImageHolder> imageHolderList) {
        /** 获取图片存储路径,这里放在对应的shopId目录下 */
        String dest = PathUtil.getShopImagePath(product.getShop().getShopId());
        List<ProductImg> productImgList = new ArrayList<>();
        for (ImageHolder imageHolder : imageHolderList) {
            String imgAddr = ImageUtil.generateNomalImg(imageHolder, dest);
            ProductImg productImg = new ProductImg();
            productImg.setImgAddr(imgAddr);
            productImg.setProductId(product.getProductId());
            productImg.setCreateTime(new Date());
            productImgList.add(productImg);
        }
        if (productImgList != null && productImgList.size() > 0) {
            try {
                int effectedNum = productImgDao.batchInsertProductImg(productImgList);
                if (effectedNum <= 0) {
                    throw new ProductOperationException("创建商品详情图片失败");
                }
            } catch (Exception e) {
                throw new ProductOperationException("创建商品详情图片失败:" + e.toString());
            }
        }
    }
}
