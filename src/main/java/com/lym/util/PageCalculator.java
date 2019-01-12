package com.lym.util;

public class PageCalculator {

	/**
	 * 前端传来的页码pageIndex-->数据库的rowIndex行数
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public static int calculatorRowIndex(int pageIndex,int pageSize) {
		return (pageIndex>0)?(pageIndex-1)*pageSize:0;
	}
}
