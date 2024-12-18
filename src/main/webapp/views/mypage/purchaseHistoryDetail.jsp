<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매내역 상세</title>
<style>
.detail-box {
    width: 80%;
    margin: 20px auto;
    border: 1px solid #ccc;
    padding: 20px;
}
.detail-row {
    margin-bottom: 10px;
    display: flex;
    align-items: center;
}
.detail-label {
    font-weight: bold;
    width: 120px;
}
.product-image {
    width: 200px;
    height: auto;
    border: 1px solid #ddd;
}
</style>
</head>
<body>
<h1>구매내역 상세</h1>

<c:choose>
    <c:when test="${detailVO == null}">
        <p>해당 거래 내역이 없습니다.</p>
    </c:when>
    <c:otherwise>
        <div class="detail-box">
            <!-- 상품이미지 -->
            <div class="detail-row">
                <span class="detail-label">상품이미지:</span>
                <c:choose>
                    <c:when test="${empty detailVO.imageUrl}">
                        <span>null</span>
                    </c:when>
                    <c:otherwise>
                        <img class="product-image" src="${detailVO.imageUrl}" alt="상품이미지">
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 상품명 -->
            <div class="detail-row">
                <span class="detail-label">상품명:</span>
                <c:out value="${detailVO.productName}" default="null"/>
            </div>

            <!-- 상품가격 -->
            <div class="detail-row">
                <span class="detail-label">상품가격:</span>
                <c:out value="${detailVO.productPrice}원" default="null"/>
            </div>

            <!-- 결제수단 -->
            <div class="detail-row">
                <span class="detail-label">결제수단:</span>
                <c:out value="${detailVO.paymentMethod}" default="null"/>
            </div>

            <!-- 배송지 주소1 -->
            <div class="detail-row">
                <span class="detail-label">배송지 주소:</span>
                <c:out value="${detailVO.addressLine1}" default="null"/>
            </div>

            <!-- 배송지 주소2 -->
            <div class="detail-row">
                <span class="detail-label">배송지 상세주소:</span>
                <c:out value="${detailVO.addressLine2}" default="null"/>
            </div>

            <!-- 우편번호 -->
            <div class="detail-row">
                <span class="detail-label">우편번호:</span>
                <c:out value="${detailVO.postalCode}" default="null"/>
            </div>

            <!-- 거래상태 -->
            <div class="detail-row">
                <span class="detail-label">거래상태:</span>
                <c:out value="${detailVO.tradeStatusName}" default="null"/>
            </div>
        </div>
    </c:otherwise>
</c:choose>
</body>
</html>