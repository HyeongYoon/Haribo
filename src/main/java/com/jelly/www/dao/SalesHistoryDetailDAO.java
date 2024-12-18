package com.jelly.www.dao;

import java.sql.*;
import com.jelly.www.vo.SalesHistoryDetailVO;
import com.jelly.www.vo.UserAccountVO;

public class SalesHistoryDetailDAO {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/jelly";
    private String user = "scott";
    private String password = "tiger";

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private StringBuilder sb = new StringBuilder();

    public SalesHistoryDetailDAO() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("[DEBUG] MySQL DB 연결 성공");
        } catch (ClassNotFoundException e) {
            System.err.println("[ERROR] MySQL 드라이버 로드 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("[ERROR] MySQL DB 연결 실패");
            e.printStackTrace();
        }
    }

    public SalesHistoryDetailVO getDetail(int tradeId, int sellerId) {
        SalesHistoryDetailVO vo = null;
        sb.setLength(0);
        sb.append("SELECT P.image_url, P.product_name, T.total_price, ");
        sb.append("U.user_name AS buyer_name, U.email AS buyer_email, ");
        sb.append("UA.bank_name, UA.account_number, UA.account_holder, ");
        sb.append("T.trade_status ");
        sb.append("FROM TRADE T ");
        sb.append("JOIN PRODUCT_SELLER PS ON T.product_seller_id = PS.product_seller_id ");
        sb.append("JOIN PRODUCT P ON PS.product_id = P.product_id ");
        sb.append("JOIN USER U ON T.buyer_id = U.user_id ");
        sb.append("LEFT JOIN USER_ACCOUNT UA ON PS.seller_id = UA.user_id ");
        sb.append("WHERE T.trade_id = ? AND PS.seller_id = ?");

        System.out.println("[DEBUG] 실행할 SQL: " + sb.toString());
        System.out.println("[DEBUG] 요청 trade_id: " + tradeId + ", seller_id: " + sellerId);

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, tradeId);
            pstmt.setInt(2, sellerId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                vo = new SalesHistoryDetailVO(
                    rs.getString("image_url"),
                    rs.getString("product_name"),
                    rs.getInt("total_price"),
                    rs.getString("buyer_name"),
                    rs.getString("buyer_email"),
                    rs.getString("bank_name"),
                    rs.getString("account_number"),
                    rs.getString("account_holder"),
                    convertTradeStatus(rs.getInt("trade_status"))
                );
                System.out.println("[DEBUG] 조회된 데이터: " + vo.toString());
            } else {
                System.out.println("[DEBUG] 해당 거래 내역이 없음");
            }
        } catch (SQLException e) {
            System.err.println("[ERROR] SQL 실행 중 에러 발생");
            e.printStackTrace();
        } finally {
            close();
        }

        return vo;
    }

    private String convertTradeStatus(int status) {
        switch (status) {
            case 1: return "판매 중";
            case 2: return "결제 완료";
            case 3: return "배송 중";
            case 4: return "거래 완료";
            case 5: return "취소";
            default: return "알 수 없음";
        }
    }

    private void close() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}