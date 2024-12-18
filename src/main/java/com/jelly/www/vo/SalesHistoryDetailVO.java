package com.jelly.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesHistoryDetailVO {
    private String imageUrl;         // 상품 이미지
    private String productName;      // 상품명
    private int productPrice;        // 상품 가격
    private String buyerName;        // 구매자 이름
    private String buyerEmail;       // 구매자 이메일
    private String bankName;         // 정산 계좌 은행 이름
    private String accountNumber;    // 정산 계좌 번호
    private String accountHolder;    // 정산 계좌 주명
    private String tradeStatusName;  // 거래 상태
}