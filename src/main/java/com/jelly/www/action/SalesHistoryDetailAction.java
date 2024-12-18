package com.jelly.www.action;

import com.jelly.www.dao.SalesHistoryDetailDAO;
import com.jelly.www.vo.SalesHistoryDetailVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SalesHistoryDetailAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Action: SalesHistoryDetailAction");
        
        HttpSession session = request.getSession();
        Integer sellerId = (Integer) session.getAttribute("user_id");
        if (sellerId == null) {
            System.out.println("로그인되지 않은 사용자");
            return "/views/login/login.jsp";
        }

        String tradeIdParam = request.getParameter("trade_id");
        int tradeId = 0;
        if (tradeIdParam != null && !tradeIdParam.isEmpty()) {
            try {
                tradeId = Integer.parseInt(tradeIdParam);
            } catch (NumberFormatException e) {
                System.out.println("trade_id가 숫자가 아님");
            }
        }

        
        SalesHistoryDetailDAO dao = new SalesHistoryDetailDAO();
        SalesHistoryDetailVO detailVO = dao.getDetail(tradeId, sellerId);

        request.setAttribute("detailVO", detailVO);

        return "/views/mypage/salesHistoryDetail.jsp";
    }
}