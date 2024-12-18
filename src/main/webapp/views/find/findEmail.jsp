<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findEmail</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/findemail.css" />
</head>
<body>
<body>
	<div class="header">
		<!-- 헤더 TOP -->
		<div class="header-top">
			<ul class="header-menu">
				<li><a href="/notice">고객센터</a></li>
				<li><a href="/mypage">마이페이지</a></li>
				<li><a href="/saved">관심</a></li>
				<li><a href="/login">로그인</a></li>
			</ul>
		</div>

		<!-- 헤더 MAIN -->
		<div class="header-main">
			<a href="/" class="logo"> <img src="<%= request.getContextPath() %>/img/jellyLogo.png"
				alt="jellyLogo" />
			</a>
			<!-- 헤더 BOTTOM -->
			<!-- <div class="header-bottom"> -->
			<form class="form">
				<button>
					<svg width="17" height="16" fill="none"
						xmlns="http://www.w3.org/2000/svg" role="img"
						aria-labelledby="search">
              <path
							d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9"
							stroke="currentColor" stroke-width="1.333" stroke-linecap="round"
							stroke-linejoin="round"></path>
            </svg>
				</button>
				<input class="input" placeholder="검색어를 입력해주세요" required=""
					type="text" />
				<button class="reset" type="reset">
					<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
						viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round"
							d="M6 18L18 6M6 6l12 12"></path>
            </svg>
				</button>
			</form>
			<!-- </div> -->
		</div>
	</div>
	<div class="container">
		<br />
		<br />
		<br />
		<form action="<%= request.getContextPath() %>/jelly?page=findoutEmail" method="post">
			<div class="form-group">
				<label for="email" class="pw">이메일 찾기</label> <br />
				<br />
				<p class="p-content">가입 시 등록한 휴대폰 번호를 입력하면</p>
				<p class="p-content">이메일 주소의 일부를 알려드립니다.</p>
				<br /> <label for="phone_number" class="phone_number">휴대폰 번호</label>
				<input type="text" name="phone_number" id="phone_number" placeholder="가입하신 휴대폰 번호" />
				<br>
				<c:if test="${not empty errorMessage }">
				 ${errorMessage }
				</c:if>
			</div>
			<br />
			<button type="submit" class="login-btn">이메일 찾기</button>
		</form>
	</div>

</body>
</html>