package com.jelly.www.action;

import com.jelly.www.dao.UserDAO;
import com.jelly.www.vo.UserVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserInfoSAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("user");
		int userId = user.getUserId();
		
		UserDAO dao = new UserDAO();
		UserVO user2 = dao.selectOne(userId);
		
		
		if (user2 != null) {
			// 비밀번호 암호화
			String password = user2.getPassword();
			String maskedPassword = "*".repeat(password.length());
			
			// 전화번호 암호화
			String phonenumber = user2.getPhoneNumber();
			String maskedPhoneNumber = phonenumber.substring(0, 3) + "-" + phonenumber.charAt(5) + "***" + "-" + "*" + phonenumber.substring(8, 11);
			
			session.setAttribute("email", user2.getEmail());
			session.setAttribute("password", user2.getPassword());
			session.setAttribute("phonenumber", user2.getPhoneNumber());
			
			req.setAttribute("email", user2.getEmail());
			req.setAttribute("password", maskedPassword);
			req.setAttribute("phonenumber", maskedPhoneNumber);
		}
		System.out.println("조회 성공");
		return "/views/mypage/userInfo.jsp";
	}

}
