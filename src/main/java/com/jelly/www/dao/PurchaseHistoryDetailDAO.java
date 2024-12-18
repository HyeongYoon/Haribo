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
    private StringBuffer sb = new StringBuffer();

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

    public PurchaseHistoryDetailVO getDetail(int tradeId) {
        PurchaseHistoryDetailVO vo = null;
        sb.setLength(0);
        sb.append("SELECT P.image_url, P.product_name, T.total_price, ");
        sb.append("PA.payment_method, A.address_line1, A.address_line2, A.postal_code, T.trade_status ");
        sb.append("FROM TRADE T ");
        sb.append("JOIN PRODUCT_SELLER PS ON T.product_seller_id = PS.product_seller_id ");
        sb.append("JOIN PRODUCT P ON PS.product_id = P.product_id ");
        sb.append("LEFT JOIN PAYMENT PA ON T.trade_id = PA.trade_id ");
        sb.append("LEFT JOIN ADDRESS A ON T.address_id = A.address_id ");
        sb.append("WHERE T.trade_id = ?");

        System.out.println("SQL: " + sb.toString());
        System.out.println("trade_id: " + tradeId);

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, tradeId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String imageUrl = rs.getString("image_url");
                String productName = rs.getString("product_name");
                int price = rs.getInt("total_price");
                String paymentMethod = rs.getString("payment_method");    // null 가능 테스트중이니까..
                String addressLine1 = rs.getString("address_line1");      // null 가능
                String addressLine2 = rs.getString("address_line2");      // null 가능
                String postalCode = rs.getString("postal_code");          // null 가능
                int tradeStatus = rs.getInt("trade_status");

                // 거래 상태 변환
                String tradeStatusName = convertTradeStatus(tradeStatus);

                vo = new PurchaseHistoryDetailVO(
                    imageUrl,
                    productName,
                    price,
                    paymentMethod,
                    addressLine1,
                    addressLine2,
                    postalCode,
                    tradeStatusName
                );

                System.out.println("조회된 값: " + vo.toString());
            } else {
                System.out.println("해당 trade_id에 데이터값 없엄");
            }

        } catch (SQLException e) {
            System.err.println("SQL 에러");
            e.printStackTrace();
        } finally {
            close();
        }
        return vo;
    }

    // 거래 상태 → 문자열 변환
    private String convertTradeStatus(int status) {
        switch (status) {
            case 1: return "판매 중";
            case 2: return "결제 완료";
            case 3: return "배송 중";
            case 4: return "거래 완료";
            case 5: return "취소";
            default: return "결제 완료";
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