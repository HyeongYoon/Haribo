package com.jelly.www.action;


import java.util.List;

import com.jelly.www.dao.UserDAO;
import com.jelly.www.dao.WishlistDAO;
import com.jelly.www.vo.UserVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginAction implements Action {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        String returnPage = (String) session.getAttribute("returnPage");
        System.out.println("recieved parameter: " + returnPage);
        


        UserDAO dao = new UserDAO();
        UserVO vo = dao.findOneByEmailAndPw(email, password);
        dao.close();

        String emailError = null;
        String passwordError = null;

        // 유효성 검
        if (email != null && password != null) {
            // 이메일 유효성 검사
            if (!email.contains("@")) {
                emailError = "정확한 이메일 주소를 입력하세요.";
            }

            // 비밀번호 유효성 검사
            if (password.length() < 8 || password.length() > 16) {
                passwordError = "비밀번호는 8자 이상, 16자 이하로 입력하세요.";
            }

            // 유효성 검사 통과 시 로그인 처리
            if (emailError == null && passwordError == null) {
                if (vo != null) {
                    // 로그인 성공
                    System.out.println("로그인 성공");
                    session.setAttribute("user", vo);
                    session.setAttribute("user_id", vo.getUserId());
                    session.setAttribute("userEmail", email); // 이메일 저장 추가 -- 형윤

                    // 관리자 계정 확인 -- 형윤
                    if ("haribojellyam@gmail.com".equals(email) && "12341234".equals(password)) {
                        session.setAttribute("isAdmin", true); 
                    } else {
                        session.setAttribute("isAdmin", false); 
                    }
                    
                    
                        
                    // 관심목록 다시 세션에 저장 -- 형윤
                    WishlistDAO wishlistDAO = new WishlistDAO();
                    List<Integer> wishlist = wishlistDAO.getWishlistByUserId(vo.getUserId());
                    session.setAttribute("wishlist", wishlist);

                    // 로그인 후 리다이렉트할 URL 처리
                    String redirectUrl = (String) session.getAttribute("redirectUrl");
                    if (redirectUrl != null && !redirectUrl.isEmpty()) {
                        // 세션에 저장된 URL로 리다이렉트
                        return "redirect:" + redirectUrl;
                    } else {
                        // 세션에 URL이 없으면 홈으로 리다이렉트
                        return "redirect:/haribo/jelly"; 
                    }
                    // 세션에 사용자 정보 저장

                } else {
                	req.setAttribute("errorMessage", "이메일 또는 비밀번호가 잘못되었습니다.");
                    return "/views/login/login.jsp";
                    // 로그인 실패 메시지를 요청 속성에 저장
                }
            }
        
        // 에러 메시지
        if (emailError != null) {
            req.setAttribute("emailError", emailError);
        }
        if (passwordError != null) {
            req.setAttribute("passwordError", passwordError);
        }

        // 로그인 페이지로 이동
        return "/views/login/login.jsp";
    }
        return "/views/login/login.jsp";
    }
}
