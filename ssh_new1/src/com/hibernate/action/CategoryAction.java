package com.hibernate.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sise.categoryDao.CategoryDao;
import com.sise.categoryDao.impl.CategoryDaoImpl;
import com.sise.hibernate.Category;
import com.sise.hibernate.News;
import com.sise.hibernate.User;
import com.sise.newsservice.NewsService;
import com.sise.page.PageBean;

@SuppressWarnings("rawtypes")
public class CategoryAction extends ActionSupport implements ModelDriven{
   /**
	 * 
	 */
   private static final long serialVersionUID = 3808486229824486199L;
   private static final String CategoryDao = null;
   private int cid;
   private Category category1;
   
   private NewsService service;//通过Spring创建业务层对象  使用set方法依赖注入
   private PageBean pageBean; //封装了分页信息和数据内容的pageBean
   private List<News> listNews;//用于储存pageBean当中被封装的User信息
   private int page = 0; //表示从网页中返回的当前页的值  默认为1 表示默认显示第一页内容
   public int getPage() {
   return page;
   }
   public void setPage(int page) {
   this.page = page;
   }
  
   public List<News> getListNews() {
	return listNews;
}
public void setListNews(List<News> listNews) {
	this.listNews = listNews;
}
public NewsService getService() {
	return service;
}
public PageBean getPageBean() {
   return pageBean;
   }
   public void setPageBean(PageBean pageBean) {
   this.pageBean = pageBean;
   }
   public void setService(NewsService service) {
   this.service = service;
   }
   public String listpage(){
   this.pageBean = service.queryForPage(5, page);//获取封装了分页信息和数据的pageBean
   this.listNews = this.pageBean.getList(); //获取数据
   return "listpage";
   }
   
   public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}

private List<Category> categories;
   private CategoryDao categoryDao;
   
   
   private News news;//属性驱动的域对象取值传输数据
   private List<News> newss=new ArrayList<News>();
	private String category_name;
	private List<String> cateMap=new ArrayList<String>();
	private Map<String,Integer> cateMap2=new HashMap<String,Integer>();
    private int id1;
    private String title;
    private String starttime;
    private String endtime;
    private Date starttime1;
    private Date starttime2;
 
	public Date getStarttime1() {
		return starttime1;
	}
	public void setStarttime1(Date starttime1) {
		this.starttime1 = starttime1;
	}
	public Date getStarttime2() {
		return starttime2;
	}
	public void setStarttime2(Date starttime2) {
		this.starttime2 = starttime2;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	private User user;
    private String username;
    private String password;
   public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
@SuppressWarnings("unchecked")
public CategoryAction(){
	   //news=new News();
	  // category1=new Category();
	 categoryDao=new CategoryDaoImpl();
	
   }
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public Category getCategory1() {
	return category1;
}
public void setCategory1(Category category1) {
	this.category1 = category1;
}
@SuppressWarnings("unchecked")
public List<Category> getCategories() {
	/*categories=categoryDao.findAllCategory();
	for(Category cate:categories)
	{
		System.out.println(cate.getCategoryName());
		cateMap.add(cate.getCategoryName());
		cateMap2.put(cate.getCategoryName(),cate.getId());
	}*/
	return categories;
}
public void setCategories(List<Category> categories) {
	this.categories = categories;
}


public String addInput(){
	   getALLCategorys();
	   return "add_input";
	}

   public String addCategory(){
	   categoryDao.addCategory(category1);
	   return SUCCESS;
   }
   public String updateCategory(){
	   category1=categoryDao.getCategoryById(cid);
	   //categoryDao.updateCategory(category1);
	   return "update";
   }
	
   public String updatedCategory(){
	   ActionContext ctx=ActionContext.getContext();
	   int id=(Integer)ctx.getSession().get("update_category");
	   category1.setId(id);
	   categoryDao.updateCategory(category1);
	   return SUCCESS;
    }
   public String deleteCategory(){
	  // category1=categoryDao.getCategoryById(cid);
	   categoryDao.deleteCategory(cid);
	   return SUCCESS;
   }
   
   public String listCategory(){
	   ActionContext ctx=ActionContext.getContext();
	   HttpServletRequest request=ServletActionContext.getRequest();
	   System.out.println("94           "+page);
		//表示每页显示2条记录，page表示当前网页
		PageBean pageBeanCategory=categoryDao.queryForPage(2, page);
		//将PageBean对象存在request中，在jsp页面访问
       request.setAttribute("pageBeanCategory", pageBeanCategory);
       //通过PageBean的实例化对象拿到具体某一次查询到的categories对象
       categories=pageBeanCategory.getList();
	   //categories=categoryDao.findAllCategory();
	   
	   return "list";
   }
   
   public String listCategory1(){
	   categories=categoryDao.findAllCategory();
	   return "list2";
   }
public Category getModel() {
	
	return category1;
}
public CategoryDao getCategoryDao() {
	return categoryDao;
}
public void setCategoryDao(CategoryDao categoryDao) {
	this.categoryDao = categoryDao;
}



public News getNews() {
	return news;
}
public void setNews(News news) {
	this.news = news;
}
public List<News> getNewss() {
	return newss;
}
public void setNewss(List<News> newss) {
	this.newss = newss;
}
public String getCategory_name() {
	return category_name;
}
public void setCategory_name(String category_name) {
	this.category_name = category_name;
}
public List<String> getCateMap() {
	return cateMap;
}
public void setCateMap(List<String> cateMap) {
	this.cateMap = cateMap;
}
public Map<String, Integer> getCateMap2() {
	return cateMap2;
}
public void setCateMap2(Map<String, Integer> cateMap2) {
	this.cateMap2 = cateMap2;
}
public int getId1() {
	return id1;
}
public void setId1(int id1) {
	this.id1 = id1;
}
public static long getSerialversionuid() {
	return serialVersionUID;
}

public String addNews(){
	   Date now=new Date();
	   news.setIssueTime(now);
	   //categorys=categoryDao.findAllCategory();
	   //this.setCategorys(categorys);
	    getALLCategorys();
	    //this.setCateMap(cateMap);
		System.out.println("------------------"+category_name+"=======------id:"+cateMap2.get(category_name));
		category1=categoryDao.getCategoryById(cateMap2.get(category_name));
	    news.setCategory(category1);
	    categoryDao.addNews(news);
	   return "add";
}
public String listNews(){
	ActionContext ctx=ActionContext.getContext();
	 HttpServletRequest request=ServletActionContext.getRequest();
	   System.out.println("94           "+page);
		//表示每页显示6条记录，page表示当前网页
		PageBean pageBeanCategory=categoryDao.queryForPage1(6, page);
		//将PageBean对象存在request中，在jsp页面访问
    request.setAttribute("pageBeanCategory", pageBeanCategory);
    //通过PageBean的实例化对象拿到具体某一次查询到的categories对象
    newss=pageBeanCategory.getList();
	   //newss=categoryDao.getAllNews();
	   return "list1";
}
public String listNews1(){
	   getALLCategorys();
	   newss=categoryDao.getAllNews();
	   return "user";
}
public String showNews(){
	   news=categoryDao.findNewsById(id1);
	   return "show";
}
public String showNews1(){
	   news=categoryDao.findNewsById(id1);
	   return "show1";
}
public String updateInput(){
	  
	   news=categoryDao.findNewsById(id1);
	   getALLCategorys();
	   return "update_input";
}
public String updateNews(){
	getALLCategorys();
	category1=categoryDao.getCategoryById(cateMap2.get(category_name));
	news.setCategory(category1);
	//categoryDao.updateNews(news);
	//return "update_news";
	   categoryDao.updateNews(news);
	   return "update_news";
}
public String deleteNews(){
	categoryDao.deleteNews(id1);
	   return "delete_news";
}
public void getALLCategorys(){
	categories=categoryDao.findAllCategory();
	for(Category cate:categories)
	{
		System.out.println(cate.getCategoryName());
		cateMap.add(cate.getCategoryName());
		cateMap2.put(cate.getCategoryName(),cate.getId());
	}
}

public String addUser(){
	   categoryDao.addUser(user);
	   return "success1";
}
public String login(){
  User login1=categoryDao.check(user);
    if(login1!=null){
//取出login1权限字段，然后判断
   String kind=login1.getKind();
    if(kind.equals("admin")){
    	Map session=ActionContext.getContext().getSession();
    	session.put("user", login1);
   return "login";
   }else if(kind.equals("user")){
	   Map session=ActionContext.getContext().getSession();
	   session.put("user", login1);
   return "user";
      }
   }
	return "error";
  }

  public String addCategorys(){
	  return "addCategorys";
  }
  public String selectTitle(){
	  getALLCategorys();
	  newss=categoryDao.findTitleByName(title);
	  return "select";
  }
  public String findTime() throws ParseException{
	  getALLCategorys();
	  List<News> news1=categoryDao.getAllNews();
	  SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
	  starttime1=formatter.parse(starttime);
	  starttime2=formatter.parse(endtime);
	  for(News newss1:news1){
		 if(newss1.getIssueTime().getTime()>=starttime1.getTime()&&newss1.getIssueTime().getTime()<=starttime2.getTime()){
			 newss.add(newss1);//非常重要，将查询到的新闻重新放到newss中，不然会出错
			System.out.println(newss1.getIssueTime().getTime());
			
		 }
		 //System.out.println(starttime1);
		// System.out.println(starttime2);
	  }
	  return "findTime";
	  
  }
  
  public String findNewsByCategoryname(){
	  getALLCategorys();
	  //System.out.println("------------------"+category_name+"=======------id:"+cateMap2.get(category_name));
	  newss=categoryDao.findCategoryByName(cateMap2.get(category_name));
	  return "select";
	  
  }
  //批量删除
  public String delSelectUsers() { 
		HttpServletRequest request = ServletActionContext.getRequest(); 
		String sd[] = request.getParameterValues("checkname"); 
		int ids[] =new int[sd.length]; 
		for(int i=0;i<sd.length;i++){ 
		ids[i]=Integer.valueOf(sd[i]);
		System.out.println(ids[i]);
		} 
		categoryDao.removeNewsAll(ids); 
		
		return this.listNews();
		
		} 
 /* public void deleteUserAll(int[] ids) { 
	   this.categoryDao.removeNewsAll(ids); 
	} */
}
