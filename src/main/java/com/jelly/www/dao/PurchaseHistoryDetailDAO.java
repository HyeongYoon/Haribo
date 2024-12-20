package com.jelly.www.dao;

import java.sql.*;

import com.jelly.www.vo.PurchaseHistoryDetailVO;

public class PurchaseHistoryDetailDAO {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/jelly";
    private String user = "scott";
    private String password = "tiger";

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public PurchaseHistoryDetailDAO() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("MySQL DB 연결 성공");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL 드라이버 로드 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("MySQL DB 연결 실패");
            e.printStackTrace();
        }
    }

    // 거래 상태 값을 문자열로 변환하는 메서드
    private String getTradeStatusName(int tradeStatus) {
        switch (tradeStatus) {
            case 1: return "판매중";
            case 2: return "결제완료"; // 디폴트값
            case 3: return "배송중";
            case 4: return "거래완료";
            case 5: return "취소";
            default: return "알 수 없음";
        }
    }

    public PurchaseHistoryDetailVO getPurchaseHistoryDetail(int tradeId) {
        String sql = "SELECT "
                     + "T.trade_id, P.product_name, P.image_url AS product_image_url, "
                     + "P.initial_price AS product_price, U.user_name AS buyer_name, "
                     + "U.phone_number AS buyer_phone_number, PM.payment_method, "
                     + "T.total_price, T.trade_status, A.address_line1, A.address_line2, "
                     + "A.postal_code, T.trade_date, PM.payment_status "
                     + "FROM TRADE T "
                     + "JOIN PRODUCT_SELLER PS ON T.product_seller_id = PS.product_seller_id "
                     + "JOIN PRODUCT P ON PS.product_id = P.product_id "
                     + "JOIN USER U ON T.buyer_id = U.user_id "
                     + "JOIN PAYMENT PM ON T.trade_id = PM.trade_id "
                     + "JOIN ADDRESS A ON T.address_id = A.address_id "
                     + "WHERE T.trade_id = ?";

        try {            
        	pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, tradeId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                PurchaseHistoryDetailVO detailVO = new PurchaseHistoryDetailVO();
                detailVO.setTradeId(rs.getInt("trade_id"));
                detailVO.setProductName(rs.getString("product_name"));
                detailVO.setProductImageUrl(rs.getString("product_image_url"));
                detailVO.setProductPrice(rs.getInt("product_price"));
                detailVO.setBuyerName(rs.getString("buyer_name"));
                detailVO.setBuyerPhoneNumber(rs.getString("buyer_phone_number"));
                detailVO.setPaymentMethod(rs.getString("payment_method"));
                detailVO.setTotalPrice(rs.getInt("total_price"));

                // 거래 상태 변환
                int tradeStatus = rs.getInt("trade_status");
                detailVO.setTradeStatusName(getTradeStatusName(tradeStatus));

                detailVO.setAddressLine1(rs.getString("address_line1"));
                detailVO.setAddressLine2(rs.getString("address_line2"));
                detailVO.setPostalCode(rs.getString("postal_code"));
                detailVO.setTradeDate(rs.getString("trade_date"));
                detailVO.setPaymentStatus(rs.getString("payment_status"));

                return detailVO;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(); // DB 자원 해제
        }

        return null; // 거래 내역이 없을 경우 null 반환
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