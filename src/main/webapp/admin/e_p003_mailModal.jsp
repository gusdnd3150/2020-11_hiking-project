<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
    
  

			    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">문의글 답변</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form>
					          <div class="form-group">
					            <label for="recipient-name" class="col-form-label">받는사람</label>
					            <input type="text" class="form-control" id="recipient-name">
					          </div>
					           <div class="form-group">
					            <label for="recipient-name" class="col-form-label">제목</label>
					            <input type="text" class="form-control" id="recipient-title">
					          </div>
					          <div class="form-group">
					            <label for="message-text" class="col-form-label">문의 답변</label>
					            <textarea class="form-control" id="message-text"> </textarea>
					          </div>
					        </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="button" id="sendMail"class="btn btn-primary">메일 발송</button>
					      </div>
					    </div>
					    
					    
