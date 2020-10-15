<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head >
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
</head>
<body>
	<div id="grid"></div>
	<button onclick="grid.request('updateData')">저장</button>

	<script>
        // 웹서버에서 GRID 데이터를 가져오고 수정된 GRID 데이터를 전송하도록 설정한다.
		var clsData = {
			api: {
				readData: { url: 'api_read.html', method: 'GET' },
				updateData: { url: 'api_update.html', method: 'POST' }
			}
		};

        // GRID 를 보여준다.
		var grid = new tui.Grid( {
			el: document.getElementById('grid'),
			columns: [
				{
					header: '이름',
					name: 'name',
					
					
				},
				{
					header: '나이',
					name: 'value',
					editor: 'text'
				}
			],
			data: [{
				name:'홍길동',
				value:'12',
				},
				{name:'하이묘',
					value:'35'}
				
			]
		} );
	</script>
</body>
</html>