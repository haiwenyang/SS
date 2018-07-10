package com.sise.categoryDao;

import java.util.List;

import com.sise.hibernate.Category;
import com.sise.hibernate.News;
import com.sise.hibernate.User;
import com.sise.page.PageBean;

public interface CategoryDao {
	
	/**
	 * 分页查询
	 * @param hql  查询条件
	 * @param offset  开始记录
	 * @param length  一次查询几条记录
	 * @return 查询的记录集合
	 */
	public List<News> queryForPage(final String hql,final int offset,final int length);
	/**
	 * 查询所有的记录数
	 * @param hql 查询条件
	 * @return 总记录数
	 */
	public int getAllRowCount(String hql);
	
	public void addCategory(Category category);
    public void updateCategory(Category category);
    public void deleteCategory(Integer id);
    public Category getCategoryById(Integer id);
    public void removeCategory(Category category);
    public List findAllCategory();
    public void removeNewsAll(int[] ids); 
    public void addNews(News news);
    public void updateNews(News news);
    public void removeNews(News news);
    public void deleteNews(Integer id);
    public News findNewsById(Integer id);
    public List<News> getAllNews();
    public List<News> findTitleByName(String title);
    public List<News> findCategoryByName(Integer category_id);
    public void addUser(User user);
    public User check(User user);
    public PageBean queryForPage(int pageSize,int page);
    public PageBean queryForPage1(int pageSize,int page);
	public List<Category> queryByPage1(String hql, int offset, int pageSize);
	public List<News> queryByPage2(String hql, int offset, int pageSize);
    
    
}
