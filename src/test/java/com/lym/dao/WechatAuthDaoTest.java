package com.lym.dao;

import com.lym.BaseTest;
import com.lym.entity.PersonInfo;
import com.lym.entity.WechatAuth;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static org.junit.Assert.assertEquals;

/**
 * @ClassName WechatAuthDaoTest
 * @Author lyming
 * @Date 2019/3/31 23:27
 **/
public class WechatAuthDaoTest extends BaseTest {
    @Autowired
    private WechatAuthDao wechatAuthDao;

    @Test
    public void testAInsertWechatAuth() throws Exception {
        WechatAuth wechatAuth = new WechatAuth();
        PersonInfo personInfo = new PersonInfo();
        personInfo.setUserId(1L);
        wechatAuth.setPersonInfo(personInfo);
        wechatAuth.setOpenId("dafahizhfdhaih");
        wechatAuth.setCreateTime(new Date());
        int effectedNum = wechatAuthDao.insertWechatAuth(wechatAuth);
        assertEquals(1, effectedNum);
    }

    @Test
    public void testBQueryWechatAuthByOpenId() throws Exception {
        WechatAuth wechatAuth = wechatAuthDao
                .queryWechatInfoByOpenId("dafahizhfdhaih");
        assertEquals("测试", wechatAuth.getPersonInfo().getName());
    }

}
