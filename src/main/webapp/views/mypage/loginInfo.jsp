<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/home/subHeader.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인 정보</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypageCommon.css" />
   <link rel="stylesheet" href="<%=request.getContextPath()%>/css/loginInfo.css" />
  <style type="text/css">

.mypage-container {
	margin: auto;
	display: flex;
	justify-content: space-between;
	max-width: 1250px;
	width: 90%;
	height: 1000px;
}

.mypage-content {
	max-width: 1000px;
	width: 90%;
	margin: 24px 0 0 50px;
	display: flex;
	flex-direction: column; /* 세로(열 형태)로 정렬 */
}

/* mypage subtitle과 그 옆에 버튼  */
.mypageSubtitle {
	font-size: 24px;
	font-weight: bold;
	max-width: inherit;
	width: 100%;
	height: 30px;
	border-bottom: 3px black solid;
	padding-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.insert-btn {
	display: flex;
	float: right;
	padding: 10px;
	justify-content: center;
	margin: 10px 0;
	height: 40px;
	align-items: center;
	border: 1px black solid;
	border-radius: 10px;
	color: gray;
}

.loginInfo-box {
	margin: 20px 0 20px 0;
	max-width: int;
	max-width: inherit;
	padding: 20px 0 0 0;
}

.unit {
	width: 450px;
	padding-bottom: 20px;
	margin-top: 30px;
	border: none;
}

.unit-title {
	margin-bottom: 5px;
	display: inline-block;
	color: gray;
	font-size: 13px;
}

.inputBox {
	display: flex;
	justify-content: space-between;
	margin-top: 5px;
}

.detailInfo {
	width: 70%;
	height: 35px;
	border: none;
	display: flex;
	align-items: center;
}

.modifybtn {
	width: 60px;
	border: lightgray 1px solid;
	border-radius: 10px;
	color: gray;
	font-size: 14px;
	height: 40px;
	margin-top: 10px;
	margin-left: 10px;
}

.profile-box {
	border-bottom: lightgray 1px solid;
	height: 100px;
	margin: 10px 0 30px 0;
	padding: 20px 40px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.profile-info {
	max-width: 700px;
	width: 70%;
	padding-left: 20px;
}

.profile-image {
	width: 80px;
	height: 80px;
	border-radius: 100%;
}

.profile-btns {
	display: flex;
	justify-content: space-between;
	margin: auto 0;
	max-width: 220px;
	width: 90%;
}

.profile-info-btn {
	width: 100px;
	height: 43px;
	font-size: 14px;
	background-color: white;
	border: lightgray 1px solid;
	border-radius: 10px;
}

.profile-user-nickname {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	margin-bottom: 4px;
}

.profile-user-email {
	color: gray;
	font-size: 14px;
}

.mypage-container input {
	width: calc(100% - 10px);
	padding: 0.8rem;
	font-size: 1rem;
	border: none;
	border-radius: 0;
	box-sizing: border-box;
	margin-top: 0.5rem;
	background-color: #fff;
	box-shadow: inset 0 -2px 0 0 #dcdcdc;
	transition: box-shadow 0.3s ease;
}

.mypage-container input:focus {
	outline: none;
	box-shadow: inset 0 -2.5px 0 0 #000;
}

.submit-btn {
	width: 12%;
	padding: 1rem;
	background-color: #000;
	color: #fff;
	border: none;
	border-radius: 15px;
	font-size: 0.9rem;
	cursor: pointer;
	text-align: center;
	font-weight: bolder;
	text-align: center;
}

.submit-btn:hover {
	background-color: #333;
}

.mypage-sbn a {
	text-decoration: none;
	color: gray; /*  a태그 글씨 푸른색 제거  */
}

  
  </style>
  </head>
  <body>
    <div class="mypage-container">
      <!-- 마이페이지 네비바 시작 -->
		<%@ include file="/views/mypage/mypageNavi.jsp"%>
      <!-- 마이페이지 컨텐츠 시작 -->
      <div class="mypage-content">
        <div class="mypageSubtitle">로그인 정보</div>
        <!-- 관심페이지 공통부분 끝 -->
        <div class="loginInfo-content">
          <h3>내 계정</h3>
          <div class="unit">
          <span class="unit-title">이메일</span>
            <div class="inputBox">
				<input type="text" name="useremail" id="useremail" />
              <button class="modifybtn">변경</button>
            </div>
          </div>
          <div class="unit">
            <span class="unit-title">비밀번호</span>
            <div class="inputBox">
            <input type="text" name="userpassword" id="userpassword" />
              <button class="modifybtn">변경</button>
            </div>
          </div>
          <br />
          <br />
          <h3>개인 정보</h3>
          <div class="unit">
            <span class="unit-title">휴대폰 번호</span>
            <div class="inputBox">
            <input type="text" name="userphonenum" id="userphonenum" />
              <button class="modifybtn">변경</button>
            </div>
          </div>
          <!-- <div class="unit">
            <span class="unit-title">신발 사이즈</span>
            <div class="inputBox">
            <input type="text" name="accountnum" id="accountnum" />
              <button class="modifybtn">변경</button>
            </div>
          </div> -->
        </div>
      </div>
    </div>
  </body>
</html>
