package com.zhiyou100.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou100.ssm.service.UserService;

@Controller
public class LoginController {
	@Autowired
	UserService us;
	
	@RequestMapping("/Login")
	public String login(String name,String pwd,HttpServletRequest req,HttpServletResponse rep){
		System.out.println(name+"......"+pwd);
		if(us.login(name, pwd)){
			System.out.println("匹配");
			req.getSession().setAttribute("name", name);
			return "forward:/userList.action";
		}else{
			return "redirect:/index.jsp";
		}
	}
}
