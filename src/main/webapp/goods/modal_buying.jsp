<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Modal -->
<div class="modal fade" id="modalBuying" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">바로구매</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<h3>${goods.title}</h3>
					<div class="mb-3">가격: <fmt:formatNumber value="${goods.price}" pattern="#,###원"/></div>
					<div class="mb-3">브랜드: ${goods.brand}</div>
					<img src="${goods.image}" width="30%">
					<hr>
					<div class="input-group mb-2">
						<span class="input-group-text">상품가격</span>
						<input id="price" class="form-control" value="${goods.price}">
						<span class="input-group-text">상품개수</span>
						<input id="qnt" type="number">
					</div>
					
					<h4><span id="total"></span></h4>
					<hr>
				<form name="frm">
					<div class="input-group mb-2">
						<span class="input-group-text">주문자명</span>
						<input name="rname" class="form-control" value="${user.uname}">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text">전화번호</span>
						<input name="rphone" class="form-control" value="${user.phone}">
					</div>
					<div class="input-group mb-2">
						<span class="input-group-text">주소</span>
						<input name="raddress1" class="form-control" value="${user.address1 }">
						<button class="btn btn-outline-secondary">검색</button>
					</div>
					<div class="input-group mb-2">
						<input name="raddress2" class="form-control" placeholder="상세주소" value="${user.address2}">
					</div>
					<input name="sum" type="hidden">
				</form>
			</div>
			<div class="text-center my-5">
				<button type="button" class="btn btn-secondary px-5"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-success px-5 insert">주문하기</button>
			</div>
		</div>
	</div>
</div>

<script>

let rgid="${param.gid}";
let sum = 0;

	$("#qnt").on("click",function(){
		const price = $("#price").val();
		const qnt = $("#qnt").val();
		sum = price * qnt;
		$("#total").html("총 금액: " + sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원")
	});


	$("#modalBuying").on("click", ".insert", function(){
		const rname=$(frm.rname).val();
		const rphone=$(frm.rphone).val();
		const raddress1=$(frm.raddress1).val();
		const raddress2=$(frm.raddress2).val();
		price = $("#price").val();
		qnt = $("#qnt").val();
		console.log(uid, rname, rphone, raddress1, raddress2, price, qnt, sum);
		
		if(!confirm("주문하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url:"/purchase/insert",
			data:{uid, rname, rphone, raddress1, raddress2, sum},
			success:function(pid){
				$.ajax({
					type:"post",
					url:"/orders/insert",
					data:{pid, gid:rgid, price, qnt},
					success:function(){
						alert("주문성공!");
						location.href="/";
					}
			})
		}
		
		
	});
	
	
})	
	
	
	
	

</script>