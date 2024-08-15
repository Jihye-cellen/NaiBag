<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	.input-group-text{
		justify-content-center;
		width:100px;
	}

</style>    
    
<div class="row justify-content-center my-5">
	<div class="col-10 col-md-8 col-lg-6">
		<div class="card">
			<div class="card-header">
				<h3 class="text-center">회원가입</h3>
			</div>
			<div class="card-body">
				<form name="frm">
					<div class="input-group mb-2">
						<span class="input-group-text">아이디</span>
						<input name="uid" class="form-control" placeholder="사용할 아이디를 입력하세요">
						<button type="button" id="btnCheck" class="btn btn-outline-secondary">중복체크</button>
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text">비밀번호</span>
						<input name="upass" class="form-control" type="password" placeholder="사용할 비밀번호를 입력하세요">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text">성명</span>
						<input name="uname" class="form-control" placeholder="성명을 입력하세요">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text">주소</span>
						<input name="address1" class="form-control" id="address1" placeholder="주소를 입력하세요">
						<button id="btnSearch" class="btn btn-danger">주소검색</button>
					</div>
					<div class="input-group mb-3">
						<input name="address2" class="form-control" placeholder="상세주소를 입력하세요">
					</div>
					<div class="text-center">
						<button class="btn btn-outline-warning" id="btnJoin">회원가입</button>
						<button class="btn btn-secondary" type="reset">취소</button>
					</div>
				</form>	
			</div>
		</div>
	</div>
</div>

<script>
	let check=false;
	$("#btnSearch").on("click", function(){
	    new daum.Postcode({
	          oncomplete:function(data){
	              console.log(data);
	              const building=data.buildingName;
	              let address="";
	              if(building!=""){
	                  address=data.address + "(" + building + ")";
	              }else{
	                  address=data.address;
	              }
	              $("#address1").val(address);
	          }
	      }).open();
	 });
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		const uid = $(frm.uid).val();
		const uname=$(frm.uname).val();
		const upass=$(frm.upass).val();
		const address1=$(frm.address1).val();
		const address2=$(frm.address2).val();
		if(uid==""|| uname=="" || upass==""||address1==""||address2==""){
			alert("모든정보를 입력하세요!")
			return;
		}
		if(!check){
			alert("아이디 중복 체크를 하세요!");
			return;
			}if(confirm("회원가입을 하시겠습니까?")){
				//회원가입 실행
				$.ajax({
					type:"post",
					url:"/user/join",
					data:{uid, upass, uname, address1, address2},
					success:function(){
						alert("회원가입이 완료되었습니다.");
						location.href="/user/login";
					}
					
				});
				
			}
			
		});
	
	$("#btnCheck").on("click", function(){
		const uid=$(frm.uid).val();
		if(uid==""){
			alert("사용자 아이디를 입력하세요!")
			return;
		}
		$.ajax({
			type:"post",
			url:"/user/login",
			data:{uid},
			success:function(data){
				if(data==0){
					alert("사용 가능한 아이디입니다!");
					check=true;
				}else{
					alert("이미 사용중인 아이디입니다!");
				}
			}
			
			
		})
	});
	
	//아이디가 바뀐 경우
	$(frm.uid).on("change", function(){
		check=false;
	})
	
	
	
	
	
	
</script>