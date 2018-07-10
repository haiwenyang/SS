/**
 * 
 */
package com.sise.hibernate;

/**   
 *    
 * 项目名称：ssh_new1   
 * 类名称：User   
 * 类描述：   
 * 创建人：杨海文
 * 创建时间：2017年12月21日 下午11:49:32   
 * 修改人：Administrator   
 * 修改时间：2017年12月21日 下午11:49:32   
 * 修改备注：   
 * @version 1.0.0   
 *    
 */

public class User {
	 private Integer id;
	 private String username;
	 private String password;
	 private String kind;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	 
}
