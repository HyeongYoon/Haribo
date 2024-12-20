package com.jelly.www.dao;

import java.sql.*;
import com.jelly.www.vo.SalesHistoryDetailVO;

public class SalesHistoryDetailDAO {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/jelly";
    private String user = "scott";
    private String password = "tiger";

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private StringBuffer sb = new StringBuffer();

    public SalesHistoryDetailDAO() {
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

    public SalesHistoryDetailVO getDetail(int tradeId) {
        SalesHistoryDetailVO vo = null;
        sb.setLength(0);
        sb.append("SELECT T.trade_id, P.image_url AS product_image, P.product_name, ");
        sb.append("T.total_price AS sale_price, ");
        sb.append("A.bank_name AS account_name, A.account_number, A.account_holder, ");
        sb.append("U.user_name, U.phone_number, ");
        sb.append("AD.address_line1, AD.address_line2, AD.postal_code, ");
        sb.append("T.sale_date, T.settlement_date ");
        sb.append("FROM TRADE T ");
        sb.append("JOIN PRODUCT P ON T.product_id = P.product_id ");
        sb.append("JOIN ACCOUNT A ON T.account_id = A.account_id ");
        sb.append("JOIN USER U ON T.buyer_id = U.user_id ");
        sb.append("LEFT JOIN ADDRESS AD ON T.address_id = AD.address_id ");
        sb.append("WHERE T.trade_id = ?");

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, tradeId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                vo = new SalesHistoryDetailVO();
                vo.setTradeId(rs.getInt("trade_id"));
                vo.setProductImage(rs.getString("product_image"));
                vo.setProductName(rs.getString("product_name"));
                vo.setSalePrice(rs.getInt("sale_price"));
                vo.setAccountName(rs.getString("account_name"));
                vo.setAccountNumber(rs.getString("account_number"));
                vo.setAccountHolder(rs.getString("account_holder"));
                vo.setAddress(String.format("%s %s (%s)", rs.getString("address_line1"), rs.getString("address_line2"), rs.getString("postal_code")));
                vo.setPhoneNumber(rs.getString("phone_number"));
                vo.setUserName(rs.getString("user_name"));
                vo.setSaleDate(rs.getString("sale_date"));
                vo.setSettlementDate(rs.getString("settlement_date"));

                System.out.println("조회된 데이터: " + vo);
            } else {
                System.out.println("해당 trade_id에 데이터 없음");
            }
        } catch (SQLException e) {
            System.err.println("SQL 에러");
            e.printStackTrace();
        } finally {
            close();
        }
        return vo;
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