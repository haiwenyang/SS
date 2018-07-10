package com.sise.categoryDao.impl;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sise.categoryDao.CategoryDao;
import com.sise.hibernate.Category;
import com.sise.hibernate.News;
import com.sise.hibernate.User;
import com.sise.page.PageBean;
@Transactional
public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao {
	 @Resource private CategoryDao categoryDao;
	public void addCategory(Category category) {
		getHibernateTemplate().saveOrUpdate(category);

	}
	
	public  void updateCategory(Category category) {
		//Session session=HibernateUtil.getSession();
		//Transaction tx=session.beginTransaction();
		Set<News> sets=new HashSet<News>();
Category category_old=(Category)this.getHibernateTemplate().getSessionFactory().getCurrentSession().get(Category.class,category.getId());
			Set<News> set=category_old.getNewses();
			 Iterator<News> it=set.iterator();
			   while(it.hasNext()){
				   News news=it.next();
				   news.setCategory(category);
				   sets.add(news);
			   }
			   category.setNewses(sets);
			   this.getHibernateTemplate().getSessionFactory().getCurrentSession().clear();
			   this.getHibernateTemplate().getSessionFactory().getCurrentSession().update(category);
	}

	public void deleteCategory(Integer id) {
		
	   Category category=categoryDao.getCategoryById(id);
	   categoryDao.removeCategory(category);	
		}

	public Category getCategoryById(Integer id) {
		return getHibernateTemplate().get(Category.class,id);
	}
     
	public List findAllCategory() {
		List<Category> lists=(List<Category>) getHibernateTemplate().find("from Category");
		return lists;
	}
	public void removeCategory(Category category) {
		getHibernateTemplate().delete(category);
		
	}
	
	
	public void addNews(News news) {
		getHibernateTemplate().saveOrUpdate(news);
		
	}

	public void updateNews(News news) {
		getHibernateTemplate().saveOrUpdate(news);
		
	}

	public void deleteNews(Integer id) {
		   News news=categoryDao.findNewsById(id);
		   categoryDao.removeNews(news);	
	}

	public News findNewsById(Integer id) {
		return getHibernateTemplate().get(News.class,id);
	}
	public List<News> getAllNews() {
		List<News> news=(List<News>) getHibernateTemplate().find("from News");
		return news;
	}

	public List<News> findTitleByName(String title) {
		//"%"+title+"%"，非常重要，模糊匹配的时候，需要传百分号进去，用字符串组合的方式和参数组成新的参数
		List<News> news1=(List<News>) this.getHibernateTemplate().find("from News where title like ?", "%"+title+"%");
		return news1;
		}

	public void removeNews(News news) {
		getHibernateTemplate().delete(news);
		
	}
	
	public void addUser(User user) {
		getHibernateTemplate().saveOrUpdate(user);
		
	}

	public User check(User user) {
		//String hql="from User  where User.username=? and User.password=?";
		//List<User> list=(List<User>) this.getHibernateTemplate().find(hql, new String[]{user.getUsername(), user.getPassword()}); 
		String str[]={user.getUsername(),user.getPassword(),user.getKind()};
		List<User> list=(List<User>) this.getHibernateTemplate().find("from User where username=? and password=? and kind=?",str);
		if(list.size()>0)
			return list.get(0);
			else
			    return null;// TODO Auto-generated method stub
			}

	public List<News> findCategoryByName(Integer category_id) {
		List<News> news1=(List<News>) this.getHibernateTemplate().find("from News where category_id like ?", category_id);
		return news1;
	}
	
	
	/**
	 * 分页查询
	 * @param hql  查询条件
	 * @param offset  开始记录
	 * @param length  一次查询几条记录
	 * @return 查询的记录集合
	 */
	public List<News> queryForPage(String hql, int offset, int length) {
		Session session =  this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(offset);
		q.setMaxResults(length);
		List<News> list = q.list();
		System.out.println(list.size());
		session.close();
		return list;
	}
	/**
	 * 查询所有的记录数
	 * @param hql 查询条件
	 * @return 总记录数
	 */
	public int getAllRowCount(String hql) {
		 int allRows = 0;
		Session session =  this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = session.createQuery(hql);
		allRows = q.list().size();
		//session.close();
		System.out.println(allRows);
		return allRows;
	}
	public PageBean queryForPage(int pageSize, int page) {
		PageBean PageBean = new PageBean();
        String hql = "from Category";
        int allRows = categoryDao.getAllRowCount(hql);//personDAO.getAllRowCount(hql);
        int totalPage = PageBean.getTotalPages(pageSize, allRows);
        int currentPage = PageBean.getCurPage(page);
        int offset = PageBean.getCurrentPageOffset(pageSize, currentPage); //当前从第几个开始显示  
        List list = categoryDao.queryByPage1(hql, offset, pageSize);
        
        PageBean.setList(list);
        PageBean.setAllRows(allRows);
        PageBean.setCurrentPage(currentPage);
        PageBean.setTotalPage(totalPage);
        PageBean.setList(list);
        return PageBean;
		}
	
	public PageBean queryForPage1(int pageSize, int page) {
		PageBean PageBean = new PageBean();
        String hql = "from News";
        int allRows = categoryDao.getAllRowCount(hql);//personDAO.getAllRowCount(hql);
        int totalPage = PageBean.getTotalPages(pageSize, allRows);
        int currentPage = PageBean.getCurPage(page);
        int offset = PageBean.getCurrentPageOffset(pageSize, currentPage); //当前从第几个开始显示  
        List list = categoryDao.queryByPage1(hql, offset, pageSize);
        
        PageBean.setList(list);
        PageBean.setAllRows(allRows);
        PageBean.setCurrentPage(currentPage);
        PageBean.setTotalPage(totalPage);
        PageBean.setList(list);
        return PageBean;
		}
	/**
	 * 分页查询
	 * @param hql  查询条件
	 * @param offset  开始记录
	 * @param pageSize  一次查询几条记录
	 * @return 查询的记录集合
	 */
    @SuppressWarnings("unchecked")  //offset为当前页，pageSize指每页显示多少条记录
    public List<Category> queryByPage1(String hql, int offset, int pageSize)
    {   
    Session session =  this.getHibernateTemplate().getSessionFactory().getCurrentSession();
	Query q = session.createQuery(hql);
	q.setFirstResult(offset);
	q.setMaxResults(pageSize);
	List<Category> list = q.list();
	System.out.println(list.size());
	//session.close();
	return list;
    }

	public List<News> queryByPage2(String hql, int offset, int pageSize) {
		Session session =  this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(offset);
		q.setMaxResults(pageSize);
		List<News> list = q.list();
		System.out.println(list.size());
		//session.close();
		return list;
	}

	public void removeNewsAll(int[] ids) {
		// TODO Auto-generated method stub
		for(int i=0;i<ids.length;i++){ 
			//this.getHibernateTemplate().delete((this.getHibernateTemplate().load(News.class, ids[i]))); 
			  News news=categoryDao.findNewsById(ids[i]);
			  categoryDao.removeNews(news);	
	}
	
	}
	}
	
