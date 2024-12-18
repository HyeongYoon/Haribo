package com.jelly.www.action;

import java.util.List;

import com.jelly.www.dao.PurchaseHistoryDAO;
import com.jelly.www.vo.PurchaseHistoryVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PurchaseHistoryAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        // 세션에서 user_id 가져오기
        Integer buyerId = (Integer) session.getAttribute("user_id");
        System.out.println("[DEBUG] 세션에서 가져온 user_id: " + buyerId);

        if (buyerId == null) {
            System.out.println("[ERROR] 로그인되지 않은 사용자입니다.");
            return "/views/login/login.jsp"; // 로그인 페이지로 이동
        }

        PurchaseHistoryDAO dao = new PurchaseHistoryDAO();

        // 구매내역 조회
        List<PurchaseHistoryVO> purchaseList = dao.getPurchaseHistory(buyerId);

        if (purchaseList == null || purchaseList.isEmpty()) {
            System.out.println("[DEBUG] 구매내역이 없습니다.");
        } else {
            System.out.println("[DEBUG] 구매내역 조회 성공. 내역 수: " + purchaseList.size());
        }

        // 조회 결과를 request에 담기
        request.setAttribute("purchaseList", purchaseList);

        // 이동할 JSP 경로 반환
        return "/views/mypage/purchaseHistory.jsp";
    }
}