package com.jelly.www.action;

import com.jelly.www.dao.PurchaseHistoryDetailDAO;
import com.jelly.www.vo.PurchaseHistoryDetailVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PurchaseHistoryDetailAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Action: PurchaseHistoryDetailAction");

        // 로그인 여부 확인
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");
        
        if (userId == null) {  // 로그인하지 않았으면 로그인 페이지로 이동
            System.out.println("로그인되지 않음");
            return "/views/login/login.jsp"; 
        }

        // trade_id
        String tradeIdParam = request.getParameter("trade_id");
        int tradeId = 0;
        
        // trade_id 숫자인지 확인
        if (tradeIdParam != null && !tradeIdParam.isEmpty()) {
            try {
                tradeId = Integer.parseInt(tradeIdParam);
            } catch (NumberFormatException e) {
                System.out.println("trade_id가 숫자가 아님");
                return "/views/error/400.jsp";  
            }
        }
        
        // trade_id가 유효한지 다시 한번 체크
        if (tradeId == 0) {
            System.out.println("trade_id가 잘못됨");
            return "/views/error/400.jsp";  
        }

        // DAO 호출 및 데이터 조회
        PurchaseHistoryDetailDAO dao = new PurchaseHistoryDetailDAO();
        PurchaseHistoryDetailVO detailVO = dao.getPurchaseHistoryDetail(tradeId);

        // 조회 결과 확인
        if (detailVO != null) {
            System.out.println("조회된 데이터: " + detailVO);
        } else {
            System.out.println("trade_id에 해당하는 데이터 없음");
        }

        // request에 데이터 저장
        request.setAttribute("detailVO", detailVO);

        // 구매내역 상세 페이지로 이동
        return "/views/mypage/purchaseHistoryDetail.jsp";
    }
}