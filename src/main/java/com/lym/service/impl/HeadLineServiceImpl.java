package com.lym.service.impl;

import com.lym.dao.HeadLineDao;
import com.lym.entity.HeadLine;
import com.lym.service.HeadLineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

/**
 * @ClassName HeadLineServiceImpl
 * @Description TODO
 * @Author lyming
 * @Date 2019/3/14 10:05 PM
 **/
@Service
public class HeadLineServiceImpl implements HeadLineService {

    @Autowired
    private HeadLineDao headLineDao;

    @Override
    public List<HeadLine> getHeadLineList(HeadLine headLineCondition) throws IOException {
        return headLineDao.queryHeadLine(headLineCondition);
    }
}
