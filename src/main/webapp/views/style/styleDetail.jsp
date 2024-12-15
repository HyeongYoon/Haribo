<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/home/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Style Detail</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleDetail.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
  <div class="container">
    <!-- 작성자 정보 표시 -->
    <div class="author-info">
      <img src="${userVo.profileImage}" alt="프로필 이미지" />
      <p><a href="<%= request.getContextPath() %>/profile?userId=${userVo.userId}">${userVo.nickname}</a></p>
      <button>팔로우</button>
    </div>

    <!-- 게시물 이미지 표시 -->
    <c:if test="${not empty postImageList}">
      <div class="post-images">
        <c:forEach var="postImage" items="${postImageList}">
          <img src="${postImage.postImageUrl}" alt="게시물 이미지">
        </c:forEach>
      </div>
    </c:if>

    <!-- 게시물 정보 표시 -->
    <div class="post-info">
      <h1>${postVo.title}</h1>
      <p>작성일: ${postVo.createdAt}</p>
      <p>${postVo.content}</p>
      <div class="stats">
        <span>조회수 ${postVo.viewsCount}</span>
        <span>좋아요 ${postVo.likesCount}</span>
        <span>댓글 ${postVo.commentsCount}</span>
        <span>저장 </span>
      </div>
    </div>

    <!-- 태그된 상품 표시 -->
    <div class="tagged-products">
      <c:choose>
        <c:when test="${not empty productList}">
          <h2>상품태그 ${productList.size()}개</h2>
          <c:forEach var="product" items="${productList}">
            <div class="product">
              <img src="${product.imageUrl}" alt="${product.name}">
              <p><a href="${pageContext.request.contextPath}/jelly?page=productDetail&productId=${product.productId}">${product.name}</a></p>
              <p>${product.initialPrice}</p>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <h2>상품태그 0개</h2>
        </c:otherwise>
      </c:choose>
    </div>

    <!-- 작성자의 다른 게시물 표시 -->
    <div class="other-posts">
      <h2>${userVo.nickname}님의 다른 스타일</h2>
      <p><a href="${pageContext.request.contextPath}/jelly?page=profile&userId=${userVo.userId}">더보기</a></p>
      <c:forEach var="post" items="${postList}">
        <c:if test="${post.postId != postVo.postId}">
          <div class="post">
            <img src="${post.postImageUrl}" alt="" />
            <p>좋아요: ${post.likesCount}</p>
          </div>
        </c:if>
      </c:forEach>
    </div>
  </div>

  <%@ include file="/views/home/footer.jsp" %>
</body>
</html>
