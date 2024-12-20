package com.jelly.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesHistoryDetailVO {
    private int tradeId;          // 주문번호 (거래 ID)
    private String productImage;  // 상품 이미지 URL
    private String productName;   // 상품명
    private int salePrice;        // 판매 금액
    private String accountName;   // 계좌 이름
    private String accountNumber; // 계좌 번호
    private String accountHolder; // 계좌주
    private String address;       // 배송 주소
    private String phoneNumber;   // 구매자 휴대폰 번호
    private String userName;      // 구매자 이름
    private String saleDate;      // 판매 일자
    private String settlementDate; // 정산 완료일
}