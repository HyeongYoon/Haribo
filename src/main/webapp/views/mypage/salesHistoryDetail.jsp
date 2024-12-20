<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/home/subHeader.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypageCommon.css" />
    <title>판매내역 상세</title>
    <style>
        .mypage-container {
            display: flex;
            justify-content: space-between;
            max-width: 1250px;
            margin: auto;
            padding: 20px;
        }

        .mypage-snb {
            width: 200px;
            margin-right: 20px;
            background-color: #fff;
            border-radius: 8px;
        }

        .mypage-content {
            flex: 1;
        }

        .order-info, .progress-box, .settlement-info, .shipping-info, .footer {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .order-info h3, .progress-box h3, .settlement-info h3, .shipping-info h3 {
            font-size: 16px;
            font-weight: bold;
            border-bottom: 2px solid #000;
            margin-bottom: 15px;
            padding-bottom: 5px;
        }

        .progress-bar {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            position: relative;
        }

        .progress-bar .step {
            text-align: center;
            flex: 1;
        }

        .progress-bar .step.active {
            font-weight: bold;
        }

        .progress-bar .line {
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 3px;
            background: #000;
            z-index: 1;
        }

        .settlement-info .item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .shipping-details .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
    </style>
</head>
<body>
<div class="mypage-container">
    <%@ include file="/views/mypage/mypageNavi.jsp"%>
    <div class="mypage-content">
        <!-- 주문 정보 -->
        <div class="order-info">
            <h3>주문번호</h3>
            <p>${detailVO.tradeId}</p>
        </div>

        <!-- 진행 상태 -->
        <div class="progress-box">
            <h3>진행 상태</h3>
            <div class="progress-bar">
                <span class="line"></span>
                <div class="step active">발송완료</div>
                <div class="step active">입고완료</div>
                <div class="step active">검수합격</div>
                <div class="step active">정산완료</div>
            </div>
        </div>

        <!-- 판매 정산 내역 -->
        <div class="settlement-info">
            <h3>판매 정산 내역</h3>
            <div class="item">
                <span>정산금액</span>
                <span>${detailVO.settlementPrice}원</span>
            </div>
            <div class="item">
                <span>즉시 판매가</span>
                <span>${detailVO.salePrice}원</span>
            </div>
            <div class="item">
                <span>검수비</span>
                <span>${detailVO.inspectionFee}</span>
            </div>
            <div class="item">
                <span>수수료</span>
                <span>${detailVO.fee}원</span>
            </div>
            <div class="item">
                <span>배송비</span>
                <span>${detailVO.deliveryFee}</span>
            </div>
            <div class="item">
                <span>거래 일시</span>
                <span>${detailVO.tradeDate}</span>
            </div>
            <div class="item">
                <span>정산일</span>
                <span>${detailVO.settlementDate}</span>
            </div>
        </div>

        <!-- 배송 주소 -->
        <div class="shipping-info">
            <h3>배송 주소</h3>
            <div class="shipping-details">
                <div class="detail-row">
                    <span>받는 사람</span>
                    <span>${detailVO.userName}</span>
                </div>
                <div class="detail-row">
                    <span>휴대폰 번호</span>
                    <span>${detailVO.phoneNumber}</span>
                </div>
                <div class="detail-row">
                    <span>주소</span>
                    <span>${detailVO.addressLine1} ${detailVO.addressLine2} ${detailVO.postalCode}</span>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/views/home/footer.jsp" %>
</body>
</html>