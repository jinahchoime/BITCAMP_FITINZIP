## 💪UNTACT SPORTS CLASS SITE : FITINZIP
#### Spring Framework를 이용한 비대면 스포츠 클래스 사이트(라이브PT, 간단한 운동용품 구매)

-----------
### 📍 내가 구현한 기능
-----------
<img src="https://user-images.githubusercontent.com/73566078/120486577-28435200-c3f0-11eb-99d5-8487425e2f40.png" width="400" height="350">

-----------
### 📍 메인 화면
-----------
<img src="https://user-images.githubusercontent.com/73566078/120487508-ff6f8c80-c3f0-11eb-9557-7476af3844e1.png" width="700" height="1000">

-----------
### 📍 용품 페이지 
-----------
<img src="https://user-images.githubusercontent.com/73566078/120490055-0dbea800-c3f3-11eb-87f8-e7dff34f0a4b.png" width="950" height="450">

-----------

### 🖥 장바구니에 담기
-----------
<img src="https://user-images.githubusercontent.com/73566078/120489548-af91c500-c3f2-11eb-8930-c6986b537f8d.png" width="950" height="450">

- ajax 사용

- 동일한 상품이 장바구니에 있으면 알림창이 뜬다.
-----------
### 🖥 장바구니 화면
-----------
<img src="https://user-images.githubusercontent.com/73566078/120489534-adc80180-c3f2-11eb-9c76-59c812f250c2.png" width="950" height="500">

- 계속 쇼핑하기 클릭시 용품 메인 화면으로 이동

<img src="https://user-images.githubusercontent.com/73566078/120489635-c0dad180-c3f2-11eb-8190-e82e094396f0.png" width="950" height="450">

- 상품 선택/전체 삭제 기능 구현

- ajax를 사용하여 수량 변경 기능 구현 

```
<script>
	//수량 변경
	
	function showModal(form) {
		const modal = new bootstrap.Modal(form.querySelector("#exampleModal2"));
		modal.toggle();
	} 
	
	function up(form) {
		const $viewAmount = form.querySelector("#viewAmount");
		const $changeAmount = form.querySelector("#changeAmount");
		let viewAmount = parseInt($viewAmount.innerText);
		viewAmount++;
		$viewAmount.innerText = viewAmount;
		$changeAmount.innerText = viewAmount;
		
		//let formData = $("form[name=form]").serialize();
		//let formData = new FormData(document.getElementById("thisform"));
		//let formData = new FormData(this.form);
		let formData = new FormData(form);
		
		let options = {
				method: "POST",
				body : new URLSearchParams(formData)
		}
		
		fetch("/updateAmount", options) 
			.then(async function (response) {
				let result = await response.json();
			})
		 
		
		.catch(err => {
			//alert("오류 발생: " + err)
			//location.href="/cart"
		});  
	}
	
	function down(form) {
		const $viewAmount = form.querySelector("#viewAmount");
		const $changeAmount = form.querySelector("#changeAmount");
		let viewAmount = parseInt($viewAmount.innerText);
		viewAmount--;
		$viewAmount.innerText = viewAmount;
		$changeAmount.innerText = viewAmount;
		
		//let formData = $("form[name=form]").serialize();
		let formData = new FormData(form);
		
		let options = {
				method: "POST",
				body : new URLSearchParams(formData)
		}
		
		fetch("/downAmount", options) 
			.then(async function (response) {
				let result = await response.json();
			})
		
		.catch(err => {
			//alert("오류 발생: " + err);
			//location.href="/cart"
		});  
	}
</script>
```
-----------
### 🖥 주문 결제 화면
-----------
<img src="https://user-images.githubusercontent.com/73566078/120498829-807f5180-c3fa-11eb-9b8f-9b6ea4470b7e.jpg" width="950" height="450">

- 배송지 입력 : Daum 주소 API 사용

<img src="https://user-images.githubusercontent.com/73566078/120489652-c506ef00-c3f2-11eb-82c7-61e7480bdabd.png" width="950" height="450">

- 결제 API : I'mport 카카오페이 API 사용

<img src="https://user-images.githubusercontent.com/73566078/120489663-c6d0b280-c3f2-11eb-9f45-4436ea7fb158.png" width="950" height="450">

-----------
### 🖥 주문 상세내역 화면
-----------
<img src="https://user-images.githubusercontent.com/73566078/120489667-c801df80-c3f2-11eb-9efa-5beb6171fde1.png" width="950" height="450">
