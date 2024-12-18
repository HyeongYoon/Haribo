package com.jelly.www.action;

import java.util.List;

import com.jelly.www.dao.SalesHistoryDAO;
import com.jelly.www.vo.SalesHistoryVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SalesHistoryAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        // 세션에서 seller_id 가져오기
        Integer sellerId = (Integer) session.getAttribute("user_id");
        System.out.println("[DEBUG] seller_id: " + sellerId);

        if (sellerId == null) {
            System.out.println("[ERROR] 로그인되지 않은 사용자");
            return "/views/login/login.jsp";
        }

        SalesHistoryDAO dao = new SalesHistoryDAO();

        // 판매내역 조회
        List<SalesHistoryVO> salesList = dao.getSalesHistory(sellerId);

        if (salesList == null || salesList.isEmpty()) {
            System.out.println("[DEBUG] 판매내역이 없음");
        } else {
            System.out.println("[DEBUG] 판매내역 조회 성공, 내역 수: " + salesList.size());
            for (SalesHistoryVO vo : salesList) {
                System.out.println("[DEBUG] 조회된 데이터: " + vo);
            }
        }

        // 조회 결과를 request에 담음
        request.setAttribute("salesList", salesList);

        return "/views/mypage/salesHistory.jsp";
    }
}