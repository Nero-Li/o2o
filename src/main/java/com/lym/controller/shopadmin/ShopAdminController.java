package com.lym.controller.shopadmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 因为html放在WEB-INF里,不能直接访问,需要通过SpringMVC路由
 */
@Controller
@RequestMapping(value = "shopadmin", method = RequestMethod.GET)
public class ShopAdminController {

    @RequestMapping("/shopoperation")
    public String shopOperation() {
        return "shop/shopoperation";
    }

    @RequestMapping("/shoplist")
    public String shopList() {
        return "shop/shoplist";
    }

    @RequestMapping("/shopmanagement")
    public String shopManagement() {
        return "shop/shopmanagement";
    }

    @RequestMapping("/productcategorymanagement")
    public String productCategoryManagement() {
        return "shop/productcategorymanagement";
    }

}
