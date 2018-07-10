package com.sise.hibernate;

import java.util.HashSet;
import java.util.Set;

public class Category {
	private Integer id;
    private String categoryName;
    private Set<News> newses=new HashSet<News>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Set<News> getNewses() {
		return newses;
	}
	public void setNewses(Set<News> newses) {
		this.newses = newses;
	}
    
}
