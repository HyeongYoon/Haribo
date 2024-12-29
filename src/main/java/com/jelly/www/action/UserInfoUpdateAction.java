package com.jelly.www.action;

import com.jelly.www.dao.UserDAO;
import com.jelly.www.vo.UserVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserInfoUpdateAction implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession(true);
        Object obj = session.getAttribute("user");
        UserVO user = (UserVO) obj;
        int sessionuserid = user.getUserId();
        
        UserDAO dao = new UserDAO();
        boolean success = false;
        
        // 이메일 변경
        String useremail = req.getParameter("useremail");
        if (useremail != null && !useremail.isEmpty()) {
            dao.updateInfoUserEmail(useremail, sessionuserid);
            session.setAttribute("useremail", useremail);
            success = true;
            req.setAttribute("successMessage", "이메일이 수정되었습니다.");
            System.out.println("이메일 수정 완료");
        }
        
        // 비밀번호 변경
        String userpassword = req.getParameter("userpassword");
        if (userpassword != null && !userpassword.isEmpty()) {
            dao.updateInfoUserPw(userpassword, sessionuserid);
            session.setAttribute("userpassword", userpassword);
            success = true;
            req.setAttribute("successMessage", "비밀번호가 수정되었습니다.");
            System.out.println("비밀번호 수정 완료");
        }
        
        // 휴대폰 번호 변경
        String userphonenum = req.getParameter("userphonenum");
        if (userphonenum != null && !userphonenum.isEmpty()) {
            dao.updateInfoUserPhoneNumber(userphonenum, sessionuserid);
            session.setAttribute("userphonenum", userphonenum);
            success = true;
            req.setAttribute("successMessage", "휴대폰 번호가 수정되었습니다.");
            System.out.println("휴대폰 번호 수정 완료");
        }

        if (success) {
            return "views/mypage/userInfo.jsp";
        } else {
            req.setAttribute("errorMessage", "정보를 정확히 입력하세요.");
            return "views/mypage/userInfo.jsp";
        }
    }
}