<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>판매내역 페이지</title>
<style>
.table {
    width: 80%;
    border-collapse: collapse;
    margin: 20px auto;
}
.table th, .table td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
}
.table th {
    background: #eee;
}
img.product-image {
    width: 100px;
    height: auto;
}
</style>
</head>
<body>
<h1>판매내역</h1>

<c:choose>
    <c:when test="${empty salesList}">
        <p>판매내역이 없습니다.</p>
    </c:when>
    <c:otherwise>
        <table class="table">
            <thead>
                <tr>
                    <th>상품이미지</th>
                    <th>상품명</th>
                    <th>판매가격</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${salesList}">
                    <tr>
                        <td>
                            <img class="product-image" src="${vo.imageUrl}" alt="상품이미지">
                        </td>
                        <td>${vo.productName}</td>
                        <td>${vo.salePrice}원</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>