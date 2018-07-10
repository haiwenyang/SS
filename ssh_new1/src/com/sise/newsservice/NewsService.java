package com.sise.newsservice;

import com.sise.page.PageBean;

public interface NewsService {
	/**
	 * 分页查询  
	 * @param pageSize  每页显示多少记录
	 * @param currentPage 当前页
	 * @return 封装了分页信息的bean
	 */
	public PageBean queryForPage(int pageSize,int page);

	
}
