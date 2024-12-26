package com.jelly.www.action;

import java.text.DecimalFormat;

import com.jelly.www.dao.ProductDAO;
import com.jelly.www.vo.ProductVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BuyConfirmAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 요청 객체 가져오기 & 형변환
		int productId = Integer.parseInt(request.getParameter("productId"));
		int price = Integer.parseInt(request.getParameter("price"));
		int couponId = Integer.parseInt(request.getParameter("couponId"));
		
		String formattedPrice = new DecimalFormat("#.###").format(price);
		
		ProductDAO productDAO = new ProductDAO();
		ProductVO product = productDAO.selectOne(productId);
		
		request.setAttribute("product", product);
		request.setAttribute("formattedPrice", formattedPrice);
		request.setAttribute("deliveryFee", 3000); // 배송비
		request.setAttribute("couponId", couponId); // 배송비

		return "/views/order/buyConfirm.jsp";
	}

}
