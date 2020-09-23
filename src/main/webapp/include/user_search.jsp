<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <section class="content container-fluid">
    	 <form action="search.do" method="post">
          <div class="input-group margin">
                <div class="input-group-btn">
                	<select name="searchOption" class="btn btn-info dropdown-toggle">
            		<option value="userNum">전체검색</option>
           			 <option value="name">이름</option>
            		<option value="id">아이디</option>
           		 <option value="address">주소</option>
            		<option value="email">email</option>
        			</select>
                </div>
                <input type="text" name="key_word" class="form-control" placeholder="조회내용을 입력하세요">
                    <span class="input-group-btn">
                      <button type="submit" class="btn btn-info btn-flat" >조회</button>
                    </span>
              </div>
             </form>
    </section>