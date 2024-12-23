package com.jelly.www.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductSellerVO {
	int productSellerId;
	int productId;
	int sellerId;
	String size;
	int price;
	int stock;
	Timestamp createdAt;
	Timestamp updatedAt;

	// 판매자 조회용
	public ProductSellerVO(int productSellerId) {
		this.productSellerId = productSellerId;
	}
	
	// 판매정보 추가
	public ProductSellerVO(int productId, int sellerId, String size, int price) {
		this.productId = productId;
		this.sellerId = sellerId;
		this.size = size;
		this.price = price;
	}
}
