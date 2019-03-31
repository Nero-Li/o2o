package com.lym.service;

import com.lym.BaseTest;
import com.lym.dto.WechatAuthExecution;
import com.lym.entity.PersonInfo;
import com.lym.entity.WechatAuth;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * @ClassName WechatAuthServiceTest
 * @Author lyming
 * @Date 2019/3/31 23:58
 **/
public class WechatAuthServiceTest extends BaseTest {

    @Autowired
    private WechatAuthService wechatAuthService;

    @Test
    public void testRegister() {
        //新增一条微信账号
        WechatAuth wechatAuth = new WechatAuth();
        PersonInfo personInfo = new PersonInfo();
        String openId = "asedawrqad";
        //给微信账号设置好用户信息,但不设置上用户id
        //希望创建微信账号的同时自动创建用户信息
        personInfo.setCreateTime(new Date());
        personInfo.setName("测试一下");
        personInfo.setUserType(1);
        wechatAuth.setPersonInfo(personInfo);
        wechatAuth.setOpenId(openId);
        wechatAuth.setCreateTime(new Date());
        WechatAuthExecution wechatAuthExecution = wechatAuthService.register(wechatAuth);
    }
}
