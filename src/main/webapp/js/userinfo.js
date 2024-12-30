
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
			emailDisplay.textContent = newEmail;
			alert('이메일이 성공적으로 변경되었습니다.');
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
const userInfoFormPassword = document.getElementById('userInfoFormPassword'); // 비밀번호 변경 폼

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
		togglePasswordBtn.textContent = '숨김';
	} else {
		passwordInput.type = 'password';
		togglePasswordBtn.textContent = '표시';
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
const userInfoFormPhonenumber = document.getElementById('userInfoFormPhonenumber'); // 휴대폰 번호 폼

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