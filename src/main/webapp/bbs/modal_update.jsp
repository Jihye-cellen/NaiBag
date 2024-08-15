<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="modalUpdate" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">댓글 수정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<span>${user.uname}(${uid})</span><br><hr>
      	<input id="cid" type="hidden">
        <textarea id="content1" rows="5" class="form-control"></textarea>
      </div>
      <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button id="btnUpdate" type="button" class="btn btn-danger">수정</button>
      </div>
    </div>
  </div>
</div>

<script>

//모달안에 있는 수정버튼
	$("#btnUpdate").on("click", function(){
		const cid=$("#cid").val();
		const contents=$("#content1").val();
				//수정하기
					$.ajax({
						type:"post",
						url:"/com/update",
						data:{contents:contents, cid:cid},
						success:function(){
							alert("수정성공!");
							getTotal();
						}
						
					})
		});
</script>