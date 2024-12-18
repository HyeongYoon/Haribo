package com.jelly.www.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.jelly.www.vo.PurchaseHistoryVO;

public class PurchaseHistoryDAO {
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/jelly";
    String user = "scott";
    String password = "tiger";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sb = new StringBuffer();

    public PurchaseHistoryDAO() {
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

    public List<PurchaseHistoryVO> getPurchaseHistory(int buyerId) {
        List<PurchaseHistoryVO> list = new ArrayList<>();
        sb.setLength(0);
        sb.append("SELECT P.image_url, P.product_name, T.total_price ");
        sb.append("FROM TRADE T ");
        sb.append("JOIN PRODUCT_SELLER PS ON T.product_seller_id = PS.product_seller_id ");
        sb.append("JOIN PRODUCT P ON PS.product_id = P.product_id ");
        sb.append("WHERE T.buyer_id = ?");

        System.out.println("SQL: " + sb.toString());
        System.out.println("buyer_id: " + buyerId);

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, buyerId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String imageUrl = rs.getString("image_url");
                String productName = rs.getString("product_name");
                int purchasePrice = rs.getInt("total_price");

                PurchaseHistoryVO vo = new PurchaseHistoryVO(imageUrl, productName, purchasePrice);
                list.add(vo);

                System.out.println("이미지 URL: " + imageUrl + ", 상품명: " + productName + ", 가격: " + purchasePrice);
            }

            if (list.isEmpty()) {
                System.out.println("구매내역이 없음");
            }
        } catch (SQLException e) {
            System.err.println("SQL 에러");
            e.printStackTrace();
        } finally {
            close();
        }

        return list;
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}