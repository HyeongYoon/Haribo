package com.jelly.www.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.jelly.www.vo.SalesHistoryVO;

public class SalesHistoryDAO {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/jelly";
    private String user = "scott";
    private String password = "tiger";

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private StringBuffer sb = new StringBuffer();

    public SalesHistoryDAO() {
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

    public List<SalesHistoryVO> getSalesHistory(int sellerId) {
        List<SalesHistoryVO> list = new ArrayList<>();
        sb.setLength(0);
        sb.append("SELECT T.trade_id, P.image_url, P.product_name, T.total_price ");
        sb.append("FROM TRADE T ");
        sb.append("JOIN PRODUCT_SELLER PS ON T.product_seller_id = PS.product_seller_id ");
        sb.append("JOIN PRODUCT P ON PS.product_id = P.product_id ");
        sb.append("WHERE PS.seller_id = ?");

        System.out.println("[DEBUG] 실행할 SQL: " + sb.toString());
        System.out.println("[DEBUG] seller_id: " + sellerId);

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, sellerId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int tradeId = rs.getInt("trade_id");
                String imageUrl = rs.getString("image_url");
                String productName = rs.getString("product_name");
                int salePrice = rs.getInt("total_price");

                SalesHistoryVO vo = new SalesHistoryVO(tradeId, imageUrl, productName, salePrice);
                list.add(vo);

                System.out.println("[DEBUG] 조회된 데이터 - 거래 ID: " + tradeId + ", 이미지 URL: " + imageUrl + ", 상품명: " + productName + ", 가격: " + salePrice);
            }

            if (list.isEmpty()) {
                System.out.println("[DEBUG] 판매내역이 없음");
            }
        } catch (SQLException e) {
            System.err.println("[ERROR] SQL 에러 발생");
            e.printStackTrace();
        } finally {
            close();
        }

        return list;
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