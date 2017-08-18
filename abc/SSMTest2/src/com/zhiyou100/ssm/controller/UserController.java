package com.zhiyou100.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou100.ssm.model.User;
import com.zhiyou100.ssm.model.UserVO;
import com.zhiyou100.ssm.service.UserService;
import com.zhiyou100.ssm.util.Page;

@Controller
public class UserController {

	@Autowired
	UserService us;
	
	@RequestMapping("/userList")
	public ModelAndView UserList(String userKeyWord, String userSearchField, Integer page ){
		ModelAndView mv= new ModelAndView();
		System.out.println(page+"...................................");
		if(userKeyWord==null||userSearchField==null){
			userKeyWord="";
			userSearchField="u_name";
		}
		if(page==null){
			page=1;
		}
		mv.addObject("userSearchField",userSearchField);
		mv.addObject("userKeyWord", userKeyWord);
		System.out.println(userSearchField+"0000000000000000000"+userKeyWord+"00000000000000"+page);
		Page page1 = us.findUserList(userKeyWord, userSearchField, page);
		mv.addObject("page",page1);
		mv.setViewName("user/userList");
		return mv;
	}
	@RequestMapping(value="/updateUser",method=RequestMethod.GET)
	public String findUserById(Model md,@RequestParam(value="id",required=true,defaultValue="1") Integer uId){
		User user = us.findUserById(uId);
		md.addAttribute(user);
		System.out.println("进来了");
		return "user/updateUser";
	}
	
	@RequestMapping(value="/updateUser",method=RequestMethod.POST)
	public String updateUser(UserVO uv,MultipartFile pic) throws IllegalStateException, IOException{
		String Name = UUID.randomUUID().toString().replaceAll("-","");
		String extension = FilenameUtils.getExtension(pic.getOriginalFilename());
		String picName=Name+"."+extension;
		System.out.println(picName);
		pic.transferTo(new File("D:\\upload\\"+picName));
		uv.getUser().setuPicname(picName);
		
		//System.out.println(uv);
		us.updateUser(uv.getUser());
		//return "forward:/userList.action";  // 显示userlist
		//return "redirect:/userList.action";
		return "forward:/findUserByName.action";
	}
	@RequestMapping("/findUserByName.action")
	public String findUserByName(HttpServletRequest req, Model md){
		User user = us.findUserByName(String.valueOf(req.getSession().getAttribute("name")));
		md.addAttribute(user);
		return "forward:/WEB-INF/view/user/personalInfo.jsp";
	}
	
	
}
