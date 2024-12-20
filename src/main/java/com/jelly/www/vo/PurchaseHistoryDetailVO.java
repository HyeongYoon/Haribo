package com.jelly.www.vo;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseHistoryDetailVO {
    private int tradeId; // 거래 ID
    private String productName; // 상품명
    private String productImageUrl; // 상품 이미지 URL
    private int productPrice; // 상품 가격
    private String buyerName; // 구매자 이름
    private String buyerPhoneNumber; // 구매자 전화번호
    private String paymentMethod; // 결제 수단
    private int totalPrice; // 거래 총 금액
    private String tradeStatus; // 거래 상태 (숫자 -> 문자열 변환)
    private String tradeStatusName; // 거래 상태 이름
    private String addressLine1; // 배송지 주소 1
    private String addressLine2; // 배송지 주소 2
    private String postalCode; // 우편번호
    private String tradeDate; // 거래 날짜
    private String paymentStatus; // 결제 상태
}