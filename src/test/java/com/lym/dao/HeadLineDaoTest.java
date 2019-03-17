package com.lym.dao;

import com.lym.BaseTest;
import com.lym.entity.HeadLine;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * @ClassName HeadLineDaoTest
 * @Author lyming
 * @Date 2019/2/15 17:00
 **/
public class HeadLineDaoTest extends BaseTest {

    @Autowired
    private HeadLineDao headLineDao;

    @Test
    public void testQueryHeadLine(){
        List<HeadLine> headLineList = headLineDao.queryHeadLine(new HeadLine());
        assertEquals(1, headLineList.size());
    }
}
