<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>판매내역 상세</title>
<style>
.detail-box {
    width: 80%;
    margin: 20px auto;
    border: 1px solid #ccc;
    padding: 20px;
}
.detail-row {
    margin-bottom: 10px;
}
.detail-label {
    font-weight: bold;
    display: inline-block;
    width: 120px;
}
.product-image {
    width: 200px;
    height: auto;
}
</style>
</head>
<body>
<h1>판매내역 상세</h1>

<c:choose>
    <c:when test="${detailVO == null}">
        <p>해당 판매 내역이 없습니다.</p>
    </c:when>
    <c:otherwise>
        <div class="detail-box">
            <div class="detail-row">
                <span class="detail-label">상품이미지:</span>
                <img class="product-image" src="${detailVO.imageUrl}" alt="상품이미지">
            </div>
            <div class="detail-row">
                <span class="detail-label">상품명:</span>
                <c:out value="${detailVO.productName}" default="null"/>
            </div>
            <div class="detail-row">
                <span class="detail-label">상품가격:</span>
                ${detailVO.productPrice}원
            </div>
            <div class="detail-row">
                <span class="detail-label">정산 계좌 은행:</span>
                <c:out value="${detailVO.bankName}" default="null"/>
            </div>
            <div class="detail-row">
                <span class="detail-label">정산 계좌 번호:</span>
                <c:out value="${detailVO.accountNumber}" default="null"/>
            </div>
            <div class="detail-row">
                <span class="detail-label">정산 계좌 주명:</span>
                <c:out value="${detailVO.accountHolder}" default="null"/>
            </div>
            <div class="detail-row">
                <span class="detail-label">거래상태:</span>
                <c:out value="${detailVO.tradeStatusName}" default="null"/>
            </div>
        </div>
    </c:otherwise>
</c:choose>
</body>
</html>