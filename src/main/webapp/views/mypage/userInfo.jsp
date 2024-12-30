<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/home/subHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인 정보 관리</title>
  <%--  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypageCommon.css" />
   <link rel="stylesheet" href="<%=request.getContextPath()%>/css/userInfo.css" /> --%>
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

/* .mypage-container input {
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
} */

.submit-btn {
	width: 12%;
	padding: 1rem;
	background-color: #000;
	color: #fff;
	border: none;
	border-radius: 15px;
	font-size: 0.8rem;
	cursor: pointer;
	text-align: center;
	font-weight: bolder;
	text-align: center;
	min-width: 70px; /* 버튼의 최소 너비 설정 */
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}

.submit-btn:hover {
	background-color: #333;
}

.mypage-sbn a {
	text-decoration: none;
	color: gray; /*  a태그 글씨 푸른색 제거  */
}
   .mypage-container {
    display: flex;
    flex-direction: row;
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.mypage-container .mypage-navi {
    flex: 1;
    margin-right: 20px;
}

.mypage-content {
    flex: 3;
}

.unit {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    border-bottom: 1px solid #ddd;
}

.unit-title {
    font-weight: bold;
    flex: 1;
}

.inputBox {
    flex: 2;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.nickname-edit-btn {
   /*  background-color: white;
    color: black;
    padding: 5px 10px;
    border: 1px solid black;
    cursor: pointer;
    border-radius: 10px; */
  width: 70px;
  height: 43px;
  font-size: 14px;
  background-color: white;
  border: lightgray 1px solid;
  border-radius: 10px;
}
   </style>
</head>
<body>
    <!-- 마이페이지 공통 -->
    <div class="mypage-container">
        <%@ include file="/views/mypage/mypageNavi.jsp"%>
        <!-- 마이페이지 -->
        <div class="mypage-content">
            <div class="mypageSubtitle">로그인 정보 관리</div>
            <div class="loginInfo-content">
                <h3>내 계정</h3>
                <!-- 이메일 -->
                <form action="<%=request.getContextPath()%>/jelly?page=userInfo" method="POST" id="userInfoFormEmail">
                <h5>이메일</h5>
                <div class="unit">
                    <div class="inputBox">
                        <span class="detailInfo" id="emailDisplay"><c:out value="${email}" /></span>
                        <input type="email" name="useremail" id="emailInput" value="<c:out value='${email}' />" style="display: none;" />
                        <div class="button-group">
                            <button type="button" id="editEmailBtn" class="nickname-edit-btn">변경</button>
                            <button type="submit" id="saveEmailBtn" class="nickname-edit-btn" style="display: none;">저장</button>
                            <button type="button" id="cancelEmailBtn" class="nickname-edit-btn" style="display: none;">취소</button>
                        </div>
                    </div>
                </div>
              </form>
                <!-- 비밀번호 -->
                <form action="<%=request.getContextPath()%>/jelly?page=userInfo" method="POST" id="userInfoFormPassword">
                <h5>비밀번호</h5>
                <div class="unit">
                    <div class="inputBox">
                   	    <span class="detailInfo" id="passwordDisplay"><c:out value="${password}" /></span>
                        <input type="password" name="userpassword" id="passwordInput" value="<c:out value='${password}' />" style="display: none;" />
                            <button type="button" id="togglePasswordBtn" style="display: none; margin-left: -120px;">👀</button>
                        <div class="button-group">
                            <button type="button" id="editPasswordBtn" class="nickname-edit-btn">변경</button>
                            <button type="submit" id="savePasswordBtn" class="nickname-edit-btn" style="display: none;">저장</button>
                            <button type="button" id="cancelPasswordBtn" class="nickname-edit-btn" style="display: none;">취소</button>
                        </div>
                    </div>
                </div>
                </form>
                <br><br>
                <h3>개인 정보</h3>
                <!-- 휴대폰 번호 -->
                <form action="<%=request.getContextPath()%>/jelly?page=userInfo" method="POST" id="userInfoFormPhonenumber">
                <h5>휴대폰 번호</h5>
                <div class="unit">
                    <div class="inputBox">
                        <span class="detailInfo" id="phoneDisplay"><c:out value="${phonenumber}" /></span>
                        <input type="tel" name="userphonenum" id="phoneInput" value="<c:out value='${phonenumber}' />" style="display: none;" />
                        <div class="button-group">
                            <button type="button" id="editPhoneBtn" class="nickname-edit-btn">변경</button>
                            <button type="submit" id="savePhoneBtn" class="nickname-edit-btn" style="display: none;">저장</button>
                            <button type="button" id="cancelPhoneBtn" class="nickname-edit-btn" style="display: none;">취소</button>
                        </div>
                    </div>
                </div>
			   </form>
            </div>
        </div>
    </div>

    <script>
 	// 이메일 변경
    const emailInput = document.getElementById('emailInput');
    const emailDisplay = document.getElementById('emailDisplay');
    const editEmailBtn = document.getElementById('editEmailBtn');
    const saveEmailBtn = document.getElementById('saveEmailBtn');
    const cancelEmailBtn = document.getElementById('cancelEmailBtn');
    const userInfoFormEmail = document.getElementById('userInfoFormEmail'); 

    editEmailBtn.addEventListener('click', () => {
        emailDisplay.style.display = 'none';
        emailInput.style.display = 'inline';
        editEmailBtn.style.display = 'none';
        saveEmailBtn.style.display = 'inline';
        cancelEmailBtn.style.display = 'inline';
    });

    saveEmailBtn.addEventListener('click', async () => {
        
        const newEmail = emailInput.value;
        
        const emailInputElement = document.getElementById('emailInput');
        emailInputElement.value = newEmail;

        // 서버에 비동기적으로 이메일 변경 요청
        try {
            const response = await fetch(userInfoFormEmail.action, {
                method: 'POST',
                body: new FormData(userInfoFormEmail),
            });
            // 응답 상태 확인
            if (response.ok) {
                alert('이메일이 성공적으로 변경되었습니다.');
                emailDisplay.textContent = newEmail;
            } else {
                const errorMessage = await response.text();
                console.error('Error:', errorMessage);
                alert('이메일 변경에 실패했습니다. 서버 응답 오류.');
            }
        } catch (error) {
            console.error('Fetch Error:', error);
            alert('이메일 변경 중 오류가 발생했습니다.');
        }
        cancelEmailBtn.click();
    });

    cancelEmailBtn.addEventListener('click', () => {
        emailDisplay.style.display = 'inline';
        emailInput.style.display = 'none';
        editEmailBtn.style.display = 'inline';
        saveEmailBtn.style.display = 'none';
        cancelEmailBtn.style.display = 'none';
    });
    
 // 비밀번호 변경
    const passwordInput = document.getElementById('passwordInput');
    const passwordDisplay = document.getElementById('passwordDisplay');
    const editPasswordBtn = document.getElementById('editPasswordBtn');
    const savePasswordBtn = document.getElementById('savePasswordBtn');
    const cancelPasswordBtn = document.getElementById('cancelPasswordBtn');
    const togglePasswordBtn = document.getElementById('togglePasswordBtn');
    const userInfoFormPassword = document.getElementById('userInfoFormPassword'); 

    editPasswordBtn.addEventListener('click', () => {
        passwordDisplay.style.display = 'none';
        passwordInput.style.display = 'inline';
        passwordInput.type = 'password';
        passwordInput.placeholder = '새 비밀번호를 입력하세요';
        passwordInput.value = '';
        editPasswordBtn.style.display = 'none';
        savePasswordBtn.style.display = 'inline';
        cancelPasswordBtn.style.display = 'inline';
        togglePasswordBtn.style.display = 'inline';
    });

    togglePasswordBtn.addEventListener('click', () => {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            togglePasswordBtn.textContent = '🙈';
        } else {
            passwordInput.type = 'password';
            togglePasswordBtn.textContent = '👀';
        }
    });

    savePasswordBtn.addEventListener('click', async () => {
        const newPassword = passwordInput.value;

        if (!newPassword) {
            alert('새 비밀번호를 입력해주세요.');
            return;
        }

        // 서버에 비동기적으로 비밀번호 변경 요청
        try {
            const response = await fetch(userInfoFormPassword.action, {
                method: 'POST',
                body: new FormData(userInfoFormPassword),
            });

            if (response.ok) {
                // 비밀번호 변경 성공 시 화면에 마스킹 처리된 값 표시
                passwordDisplay.textContent = '********';
                alert('비밀번호가 성공적으로 변경되었습니다.');
            } else {
                const errorMessage = await response.text();
                console.error('Error:', errorMessage);
                alert('비밀번호 변경에 실패했습니다. 서버 응답 오류.');
            }
        } catch (error) {
            console.error('Fetch Error:', error);
            alert('비밀번호 변경 중 오류가 발생했습니다.');
        }

        cancelPasswordBtn.click();
    });

    cancelPasswordBtn.addEventListener('click', () => {
        passwordDisplay.style.display = 'inline';
        passwordInput.style.display = 'none';
        passwordInput.type = 'password'; // 입력 필드 타입 초기화
        editPasswordBtn.style.display = 'inline';
        savePasswordBtn.style.display = 'none';
        cancelPasswordBtn.style.display = 'none';
        togglePasswordBtn.style.display = 'none';
    });
    
 // 휴대폰 번호 변경
    const phoneInput = document.getElementById('phoneInput');
    const phoneDisplay = document.getElementById('phoneDisplay');
    const editPhoneBtn = document.getElementById('editPhoneBtn');
    const savePhoneBtn = document.getElementById('savePhoneBtn');
    const cancelPhoneBtn = document.getElementById('cancelPhoneBtn');
    const userInfoFormPhonenumber = document.getElementById('userInfoFormPhonenumber'); 

    editPhoneBtn.addEventListener('click', () => {
        phoneDisplay.style.display = 'none';
        phoneInput.style.display = 'inline';
        phoneInput.placeholder = '새 전화번호를 입력하세요';
        phoneInput.value = '';
        editPhoneBtn.style.display = 'none';
        savePhoneBtn.style.display = 'inline';
        cancelPhoneBtn.style.display = 'inline';
    });

    savePhoneBtn.addEventListener('click', async () => {
        const newPhone = phoneInput.value;

        if (!newPhone) {
            alert('새 전화번호를 입력해주세요.');
            return;
        }

        // 서버에 비동기적으로 전화번호 변경 요청
        try {
            const response = await fetch(userInfoFormPhonenumber.action, {
                method: 'POST',
                body: new FormData(userInfoFormPhonenumber),
            });

            if (response.ok) {
                // 마스킹된 전화번호로 UI 업데이트
                const maskedPhoneNumber = newPhone.substring(0, 3) + "-" + newPhone.charAt(5) + "***" + "-" + newPhone.substring(8, 11);
                phoneDisplay.textContent = maskedPhoneNumber;
                alert('전화번호가 성공적으로 변경되었습니다.');
            } else {
                const errorMessage = await response.text();
                console.error('Error:', errorMessage);
                alert('전화번호 변경에 실패했습니다. 서버 응답 오류.');
            }
        } catch (error) {
            console.error('Fetch Error:', error);
            alert('전화번호 변경 중 오류가 발생했습니다.');
        }

        cancelPhoneBtn.click();
    });

    cancelPhoneBtn.addEventListener('click', () => {
        phoneDisplay.style.display = 'inline';
        phoneInput.style.display = 'none';
        editPhoneBtn.style.display = 'inline';
        savePhoneBtn.style.display = 'none';
        cancelPhoneBtn.style.display = 'none';
    });
    </script>
</body>
</html>