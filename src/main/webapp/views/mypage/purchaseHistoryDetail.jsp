<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/home/subHeader.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypageCommon.css" />
    <title>거래 상세</title>
    <style>
.mypage-container {
    display: flex;
    justify-content: space-between;
    max-width: 1250px;
    margin: auto;
    padding: 20px;
}

/* 네비게이션 바 */
.mypage-snb {
    width: 200px;
    margin-right: 20px;
    background-color: #fff;
    border-radius: 8px;
}

/* 콘텐츠 영역 */
.mypage-content {
    flex: 1;
}

/* 주문 정보 */
.order-info {
    font-size: 14px;
    margin-bottom: 20px;
}

/* 상품 정보 */
.product-box {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.product-box img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 8px;
    margin-right: 20px;
}

.product-info h3 {
    font-size: 18px;
    margin: 0;
}

.product-info p {
    font-size: 14px;
    color: #666;
    margin: 5px 0;
}
.product-buttons {
    display: flex;
    gap: 10px;
    justify-content: flex-end; /* 버튼을 오른쪽으로 정렬 */
    width: 100%; /* 가로 크기를 늘림 */
    margin-top: 10px; /* 버튼과 위 요소 간 여백 */
}

.product-buttons button {
    padding: 10px 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    background-color: #fff;
    cursor: pointer;
    font-size: 14px;
}

.product-buttons button:hover {
    background-color: #f0f0f0;
}

/* 진행 상태 */
.status-box {
    margin-bottom: 20px;
}

.status-progress {
    display: flex;
    justify-content: space-between;
    border-top: 2px solid #000;
    margin: 20px 0;
    position: relative;
    height: 5px;
}

.status-progress div {
    text-align: center;
    font-size: 14px;
    margin-top: 10px;
    color: #666;
}

.status-progress div.active {
    color: #000;
    font-weight: bold;
}

.status-progress div::before {
    content: '';
    position: absolute;
    top: -2px;
    left: 0;
    height: 5px;
    background-color: #000;
    z-index: 1;
    width: 100%;
}

/* 결제 내역 */
.payment-box h3 {
    font-weight: bold;
    font-size: 16px;
    border-bottom: 2px solid #000;
    margin-bottom: 10px;
    padding-bottom: 5px;
}

.payment-box .payment-item {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
    border-bottom: 1px solid #eee;
}

.payment-box .payment-item:last-child {
    border-bottom: none;
}

/* 배송 주소 */
.shipping-info h3 {
    font-size: 16px;
    font-weight: bold;
    border-bottom: 2px solid #000;
    margin-bottom: 10px;
    padding-bottom: 5px;
}

.shipping-details .detail-row {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
    border-bottom: 1px solid #eee;
}

.shipping-details .detail-row:last-child {
    border-bottom: none;
}
    </style>
</head>
<body>
<div class="mypage-container">
        <%@ include file="/views/mypage/mypageNavi.jsp"%>


    <!-- 콘텐츠 영역 -->
    <div class="mypage-content">
        <!-- 주문 정보 -->
        <div class="order-info">
            <p>주문번호: B-${detailVO.tradeId}</p>
        </div>

        <!-- 상품 정보 -->
        <div class="product-box">
            <img src="${detailVO.imageUrl}" alt="상품 이미지">
            <div class="product-info">
                <h3>${detailVO.productName}</h3>
                <p>${detailVO.productDescription}</p>
                <p>${detailVO.productSize} / 일반배송</p>
            </div>
            <div class="product-buttons">
                <button onclick="location.href='${pageContext.request.contextPath}/jelly?page=productDetail&productId=${detailVO.productId}'">상품 상세</button>
                <button onclick="location.href='http://localhost:8080/haribo/upload?page=stylePost'">스타일올리기</button>
            </div>
        </div>

        <!-- 진행 상태 -->
        <div class="status-box">
            <div class="status-progress">
                <div class="active">발송완료</div>
                <div class="active">입고완료</div>
                <div class="active">검수합격</div>
                <div class="active">배송완료</div>
            </div>
        </div>

        <!-- 결제 내역 -->
        <div class="payment-box">
            <h3>결제 내역</h3>
            <div class="payment-item">
                <span>즉시 구매가</span>
                <span>${detailVO.productPrice}원</span>
            </div>
            <div class="payment-item">
                <span>검수비</span>
                <span>무료</span>
            </div>
            <div class="payment-item">
                <span>수수료</span>
                <span>-</span>
            </div>
            <div class="payment-item">
                <span>배송비</span>
                <span>-</span>
            </div>
            <div class="payment-item">
                <span>쿠폰 사용</span>
                <span>-</span>
            </div>
        </div>

        <!-- 배송 주소 -->
        <div class="shipping-info">
            <h3>배송 주소</h3>
            <div class="shipping-details">
                <div class="detail-row">
                    <span class="detail-label">받는 사람</span>
                    <span>${detailVO.userName}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">휴대폰 번호</span>
                    <span>${detailVO.phoneNumber}</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">주소</span>
                    <span>${detailVO.addressLine1} ${detailVO.addressLine2} ${detailVO.postalCode}</span>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/views/home/footer.jsp" %>
</body>
</html>