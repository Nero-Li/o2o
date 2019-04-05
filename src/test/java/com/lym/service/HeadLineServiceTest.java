package com.lym.service;

import com.lym.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName HeadLineServiceTest
 * @Description TODO
 * @Author lyming
 * @Date 2019/4/5 9:50 PM
 **/
public class HeadLineServiceTest extends BaseTest {

    @Autowired
    private HeadLineService headLineService;

    @Test
    public void quertHeadLine() {
        try {
            headLineService.getHeadLineList(null);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
