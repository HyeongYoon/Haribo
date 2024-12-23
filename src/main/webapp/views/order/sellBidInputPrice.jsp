<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/views/home/subHeader.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>판매 입찰</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/orderBid.css">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="order-container">
		<!-- 헤더 -->
		<h2>판매 입찰</h2>

		<div class="order-content">
			<!-- 상품 정보 섹션 -->
			<div class="order-info">
				<img src="../img/productimg.png" alt="상품 이미지" />
				<div class="order-details">
					<span class="span-bold">JI1881</span> <span>Adidas Stadt
						Core Black Carbon</span> <span class="span-gray">아디다스 어쩌고</span> <span
						class="span-bold">230</span>
				</div>
			</div>

			<!-- 가격 정보 섹션 -->
			<div class="price-detail">
				<div class="orderNow">
					<div>
						<span class="span-bold">즉시 구매가</span> <span>84,000원</span>
					</div>
					<div>
						<span class="span-bold">즉시 판매가</span> <span>70,000원</span>
					</div>
				</div>
			</div>
			<!-- 판매 희망가 입력 -->
			<div class="tapList">
				<div>
					<h4>판매 희망가</h4>
					<button class="registPrice">등록</button>
				</div>
				<span id="alertMessage">어쩌고 저쩌고</span><br />
				<div class="inputPriceBox">
					<input type="text" name="inputPrice" id="inputPrice"
						placeholder="금액을 입력하세요" /> <span>원</span>
				</div>
			</div>
			<!-- 배송정보 -->
			<div class="price-detail">
				<div class="delivery-info">
					<div>
						<span class="span-gray">검수비</span> <span>무료</span>
					</div>
					<div>
						<span class="span-gray">수수료</span> <span>8,500원</span>
					</div>
					<div>
						<span class="span-gray">배송비</span> <span>선불: 판매자 부담</span>
					</div>
				</div>
			</div>
			<!-- 정산 금액 -->
			<div class="total-price">
				<span>정산 금액</span> <span id="totalAmount"></span>
			</div>

			<!-- 판매 버튼 -->
			<a href="#" class="action-button">판매 입찰 계속</a>
		</div>
	</div>
	<jsp:include page="/views/home/footer.jsp" />
<script>
$(() => {
	  $(".registPrice").on("click", () => {
	    let inputPrice = $("#inputPrice").val().trim();
	    $.ajax({
	      url: '/haribo/orderBid',
	      method: 'get', 
	      data: {
	    	  bidMoney: inputPrice
	      },
	      success: function (response, status, request) {
	        console.log("입력한 가격 전송 완료");
	        if (response >= 20000) {
	        	$("#totalAmount").text(response+"원");
	        	
	        	let productId = ${product.productId};
	        	let sizeVal = ${size};
	        	let url = '${pageContext.request.contextPath}/jelly?page=sell&productId=' + productId + '&size=' + sizeVal + '&price=' + inputPrice;
	        	
	        	$(".action-button").attr("href", url);
	       	
	        } else {
	        	$("#alertMessage").text("2만원부터 천원 단위로 입력하세요");
	        }
	      }
	    });
	  });
	});

</script>
</body>
</html>
