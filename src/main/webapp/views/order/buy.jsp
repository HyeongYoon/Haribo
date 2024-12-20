<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/views/home/subHeader.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>buyModify.html</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/buy.css">
<script src="https://cdn.portone.io/v2/browser-sdk.js" async defer></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(()=> {
	$(".payment-submit-btn").on("click", async function requestPayment(){
 		const now = new Date(); 
 		const year = now.getFullYear() % 100;
 		const month = ("0" + (now.getMonth() + 1)).slice(-2); // 월 앞자리에 0을 추가 (예: 01, 02)
 		const date = ("0" + now.getDate()).slice(-2); // 일 앞자리에 0을 추가 (예: 01, 02)
 		const rnd = Math.floor(Math.random()*100);
 		const response = await PortOne.requestPayment({
			// 상점 ID
			storeId : "store-95142755-e5cd-4125-b376-f7a90f93248b",
			// 채널 key
			channelKey : "channel-key-6b669b9c-926d-448b-bc47-4c8cdce14767",
			// 결제 승인 ID = 주문 번호
			paymentId : year + month + date + rnd + "0",
			orderName : "${formattedPrice}",
			totalAmount : ${product.initialPrice},
			currency : "CURRENCY_KRW",
			payMethod : "CARD"
			});
		console.log(response.paymentId);
		$.ajax({
		    url: '/haribo/buyConfirm', // 결제 정보를 dao에 넣는 서블릿으로 이
		    method: "get",
		    data: {
		        paymentId: response.paymentId,
		        txId: response.txId,
		        orderName: "${product.productName}",
		        totalAmount: ${product.initialPrice},
		       	productId : ${product.productId},
		       	size : ${size}
		    },
		    success: function(response) {
		        console.log("결제 성공");
		        window.location.href = "${pageContext.request.contextPath}/jelly?page=buyConfirm&productId=${product.productId}";  // 결제 완료 페이지로 이동
		    },
		    error: function(xhr, status, error) { // 함수 형태로 수정
		        console.log("결제 실패:", error);
		        console.log("응답 상태:", status);
		        console.log("서버 응답:", xhr.responseText);
		    }
		});
	});
})
</script>
</head>
<body>
	<div class="order-container">
		<h2>배송/결제</h2>
		<!-- 배송 주소 -->
		<div class="order-content">
			<div class="order-title">
				배송 주소
				<button class="modalOpen">주소 변경</button>
			</div>
			<div class="order-info">
				<div class="order-subInfo">
					<div class="fontGray">
						<span>받는 분</span><br /> <span>연락처</span><br /> <span>주소</span>
					</div>
					<div>
						<span>${user.userName }</span><br /> <span>${user.phoneNumber }</span><br />
						<span>[${address.postalCode }] ${address.addressLine1 }
							${address.addressLine2 }</span>
					</div>
				</div>
			</div>
			<select name="요청사항" id="" class="order-selection">
				<option value="op1">요청사항 없음</option>
				<option value="op2">문 앞에 놓아주세요</option>
				<option value="op3">경비실에 맡겨 주세요</option>
				<option value="op4">파손 위험 상품입니다. 배송 시 주의해주세요</option>
				<option value="op5">직접 입력</option>
			</select>
		</div>

		<!-- 주문 상품 -->
		<div class="order-content">
			<div class="order-title">
				<span>주문 상품</span> <span>총 1건</span>
			</div>
			<div class="order-info">
				<img src="${product.imageUrl }" alt="" />
				<div class="order-subInfo">
					<div class="productSubInfo">
						<span>${product.productName }</span>
						<div class="fontGray">
							<span>${product.description }</span>
						</div>
						<span>${size }</span>
					</div>
				</div>
			</div>
		</div>

		<!-- 쿠폰 -->
		<div class="order-content">
			<div class="order-title">
				<span>쿠폰</span>
			</div>
			<div class="order-info">
				<select class="order-selection">
					<option value="none">사용 가능한 쿠폰 없음</option>
					<option value="coupon1">10% 할인 쿠폰</option>
					<option value="coupon2">무료배송 쿠폰</option>
				</select>
			</div>
		</div>
		<!-- 결제 방법 -->
		<div class="order-content">
			<div class="order-title">
				<span>결제방법</span>
			</div>
			<div class="order-info">
				<div class="paymentSubinfo">
					<span>계좌 간편결제</span><br />
					<button class="account-btn">계좌를 등록하세요</button>
					<span>일반 결제</span><br />
					<div class="payment-method">
						<button class="payment-btn">신용카드</button>
						<button class="payment-btn" style="color: #00c73c">NPay</button>
						<button class="payment-btn" style="color: #ffcc00">
							KakaoPay</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 결제 금액 -->
		<div class="order-content">
			<div class="order-title">
				<span>결제금액</span>
			</div>
			<div class="order-info">
				<div class="order-price">
					<div class="price-detail">
						<div>
							<span>상품금액</span> <span>${formattedPrice }원</span>
						</div>
						<div>
							<span>배송비</span> <span>5,000원</span>
						</div>
						<div>
							<span>쿠폰</span> <span>-10,000원</span>
						</div>
					</div>
					<div class="total-price">
						<span>총 결제금액</span> <span>${formattedPrice }원</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 결제 푸터 -->
	<div class="payment-footer">
		<input type="submit" value="${formattedPrice }원 결제하기"
			class="payment-submit-btn" />
	</div>
	<jsp:include page="/views/home/footer.jsp" />
</body>
</html>