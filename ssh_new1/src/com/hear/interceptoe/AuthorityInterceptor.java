package com.hear.interceptoe;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthorityInterceptor extends AbstractInterceptor{

	/**
	 * 
	 */
	private static final long serialVersionUID = -804135005769010216L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		if(session.get("user")!=null){
			return invocation.invoke();//继续向下执行
		}else{
			ctx.put("msg","您还未登录，请先登录");
			return "login1";
		}
	}
	
}
