package com.jelly.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/*
	trade_status
	
	1,판매 중
	2,결제 완료
	3,배송 중
	4,거래 완료
	5,취소
*/

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseHistoryDetailVO {
    private String imageUrl;       // 상품 이미지
    private String productName;    // 상품명
    private int productPrice;      // 상품 가격(거래 금액)
    private String paymentMethod;  // 결제수단 (null 가능)
    private String addressLine1;   // 배송지 주소 1 (null 가능)
    private String addressLine2;   // 배송지 주소 2 (null 가능)
    private String postalCode;     // 배송지 우편번호 (null 가능)
    private String tradeStatusName; // 거래 상태명 (1~5 숫자를 문자열로)
}

