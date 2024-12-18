// 패키지명
package com.jelly.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data               // getter, setter, toString, equals, hashCode 생성
@NoArgsConstructor  // 기본 생성자
@AllArgsConstructor // 모든 필드를 파라미터로 받는 생성자
public class PurchaseHistoryVO {
    private String imageUrl;    // 상품이미지
    private String productName;    // 상품명
    private int purchasePrice;    // 구매가격
}