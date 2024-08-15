<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<style>
.modal-body img, .card-body img{
		border-radius:50%; border: 1px solid gray; cursor: pointer
	}

</style>

<div class="row justify-content-center">
	<div class="col-12 col-md-8 col-lg-6">
		<h1>마이페이지</h1>
		<div class="card">
			<div class="card-body">
				<div class="mb-3">			
				<span>이름: ${user.uname}(${user.uid})</span>
				<button class="btn btn btn-outline-danger btn-sm ms-3" id="btnPass">비밀번호변경</button><hr>
				</div>
				<div class="mb-3">주소: ${user.address1} ${user.address2}<hr></div>
				<div class="mb-3">전화: ${user.phone}<hr></div>
				<div class="text-center mt-3"><button id="btnInfo" class="btn btn-warning px-5">정보수정</button></div>
			</div>
		</div>
	</div>
	<jsp:include page="modal_info.jsp"/>
	<jsp:include page="modal_pass.jsp"/>
</div>


<script>
	
	$("#btnInfo").on("click", function(){
		$("#modalInfo").modal("show");
	});
	
	$("#btnPass").on("click", function(){
		$("#modalPass").modal("show");
	});
	
	
</script>