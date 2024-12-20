<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/home/subHeader.jsp" %> 

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
            background-color: #f9f9f9; 
            border-radius: 8px; 
        }
        .detail-row {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .detail-label {
            font-weight: bold;
            width: 150px;
        }
        .product-image {
            width: 200px;
            height: auto;
            border: 1px solid #ddd;
            border-radius: 5px; /* 상품 이미지에 둥글기 추가 */
        }
        h1 {
            text-align: center;
            margin-top: 20px;
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
                        <c:when test="${empty detailVO.productImageUrl}">
                            <span>상품 이미지가 없습니다.</span>
                        </c:when>
                        <c:otherwise>
                            <img class="product-image" src="${detailVO.productImageUrl}" alt="상품이미지">
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- 상품명 -->
                <div class="detail-row">
                    <span class="detail-label">상품명:</span>
                    <c:out value="${detailVO.productName}" default="상품명이 없습니다."/>
                </div>

                <!-- 상품가격 -->
                <div class="detail-row">
                    <span class="detail-label">상품가격:</span>
                    <c:out value="${detailVO.productPrice}원" default="가격 정보가 없습니다."/>
                </div>

                <!-- 결제수단 -->
                <div class="detail-row">
                    <span class="detail-label">결제수단:</span>
                    <c:out value="${detailVO.paymentMethod}" default="결제 수단 정보가 없습니다."/>
                </div>

                <!-- 배송지 주소1 -->
                <div class="detail-row">
                    <span class="detail-label">배송지 주소:</span>
                    <c:out value="${detailVO.addressLine1}" default="주소1 정보가 없습니다."/>
                </div>

                <!-- 배송지 주소2 -->
                <div class="detail-row">
                    <span class="detail-label">배송지 상세주소:</span>
                    <c:out value="${detailVO.addressLine2}" default="주소2 정보가 없습니다."/>
                </div>

                <!-- 우편번호 -->
                <div class="detail-row">
                    <span class="detail-label">우편번호:</span>
                    <c:out value="${detailVO.postalCode}" default="우편번호 정보가 없습니다."/>
                </div>

                <!-- 거래상태 -->
                <div class="detail-row">
                    <span class="detail-label">거래상태:</span>
                    <c:out value="${detailVO.tradeStatusName}" default="상태 정보가 없습니다."/>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

    <%@ include file="/views/home/footer.jsp" %> 

</body>
</html>