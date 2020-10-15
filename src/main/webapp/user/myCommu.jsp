<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal"
	data-target="#myCommu">Launch demo modal</button>


<div class="modal fade" id="myCommu" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">나의 산 모임</h5>
			</div>
			<div class="modal-body">
				<div class="card text-center">
						<div class="card-header">
							<ul class="nav nav-tabs card-header-tabs" id="tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									href="#tab1" data-toggle="tab">Link</a></li>
								<li class="nav-item"><a class="nav-link" href="#tab2"
									data-toggle="tab">Link2</a></li>
							
							</ul>
						</div>
						<div class="tab-content">
							<div class="card-body tab-pane active" id="tab1">
								<p class="card-text">여기는 tab1</p>
							</div>
							<div class="card-body tab-pane " id="tab2">
							<p class="card-text" >여기는 tab2</p>
							</div>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>







	</div>
</div>
</html>