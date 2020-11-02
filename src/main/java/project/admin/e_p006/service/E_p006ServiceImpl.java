package project.admin.e_p006.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.admin.e_p006.dao.E_p006DAO;
import project.admin.e_p006.vo.E_p006VO;

@Service
public class E_p006ServiceImpl implements E_p006Service {
	@Autowired
	private E_p006DAO e_p006DAO;

	// cs게시글 지정일자 조회
	@Override
	public JSONObject searchDatePieChart(Map<String, String> search_keyword) throws Exception {
		List<E_p006VO> items = e_p006DAO.searchDatePieChart(search_keyword);

		// 리턴할 json 객체
		JSONObject data = new JSONObject(); 

		// json의 칼럼 객체
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		

		// json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
		JSONArray title = new JSONArray();

		col1.put("label", "글부분"); // col1에 자료를 저장 ("필드이름","자료형")
		col1.put("type", "string");
		col2.put("label", "게시글 수");
		col2.put("type", "number");

		// 테이블행에 컬럼 추가
		title.add(col1);
		title.add(col2);

		// json 객체에 타이틀행 추가
		data.put("cols", title);// 제이슨을 넘김 {"cols" : [{"label" : "글부분","type":"string"},{"label" : "게시글 수", "type" : "number"}]}

		JSONArray body = new JSONArray(); // json 배열을 사용하기 위해 객체를 생성

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject();  // json오브젝트 객체를 생성 vo저장 글 구분 스트링 가져와서 v라고 저장한다.
			type.put("v", vo.getCsposttypeString());

			JSONObject count = new JSONObject();
			count.put("v", vo.getCsboardcnt());

			JSONArray row = new JSONArray(); // json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
			row.add(type); // type을 row에 저장 (테이블의 행)
			row.add(count); // count을 row에 저장 (테이블의 행)

			JSONObject cell = new JSONObject();
			cell.put("c", row); // cell 2개를 합쳐서 "c"라는 이름으로 추가
			body.add(cell); // 레코드 1개 추가

		}
		data.put("rows", body);

		return data;
	}

	// 셀렉트 cs통계  조회
	@Override
	public JSONObject selectPieChart(Map<String, String> select_keyword) throws Exception {
		List<E_p006VO> items = e_p006DAO.selectPieChart(select_keyword);
		JSONObject data = new JSONObject(); 
		
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();

		JSONArray title = new JSONArray();

		col1.put("label", "글구분"); 
		col1.put("type", "string");
		col2.put("label", "게시글 수");
		col2.put("type", "number");

		title.add(col1);
		title.add(col2);

		data.put("cols", title);				

		JSONArray body = new JSONArray();

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject(); 
			type.put("v", vo.getCsposttypeString());

			JSONObject count = new JSONObject();
			JSONObject count1 = new JSONObject();
			JSONObject count2 = new JSONObject();
			
			count.put("v", vo.getCsboardcnt());
			

			JSONArray row = new JSONArray(); 
			row.add(type); 
			row.add(count); 
			

			JSONObject cell = new JSONObject();
			cell.put("c", row); 
			body.add(cell);

		}
		data.put("rows", body);

		return data;
	}

	// 지정일자 조회 매출 통계
	@Override
	public JSONObject searchDateColumnChart(Map<String, String> search_keyword) throws Exception {
		List<E_p006VO> items = e_p006DAO.searchDateColumnChart(search_keyword);

		JSONObject data = new JSONObject(); 

		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
	
		JSONArray title = new JSONArray();

		col1.put("label", "날짜"); 
		col1.put("type", "string");
		col2.put("label", "매출");
		col2.put("type", "number");

		
		title.add(col1);
		title.add(col2);

		
		data.put("cols", title); 
								
		JSONArray body = new JSONArray(); 

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject(); 
			type.put("v", vo.getCreatedatString());

			JSONObject count = new JSONObject();
			count.put("v", vo.getSumPrice());

			JSONArray row = new JSONArray(); 
			row.add(type); 
			row.add(count); 

			JSONObject cell = new JSONObject();
			cell.put("c", row); 
			body.add(cell); 

		}
		data.put("rows", body);

		return data;
	}
	
	//셀렉트 조회 매출 통계
	@Override
	public JSONObject selectColumnChart(Map<String, String> select_keyword) throws Exception {
		List<E_p006VO> items = e_p006DAO.selectColumnChart(select_keyword);
		
		JSONObject data = new JSONObject(); 

		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
	
		JSONArray title = new JSONArray();

		col1.put("label", "날짜"); 
		col1.put("type", "string");
		col2.put("label", "매출");
		col2.put("type", "number");

		title.add(col1);
		title.add(col2);

		data.put("cols", title);

		JSONArray body = new JSONArray(); 

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject(); 
			type.put("v", vo.getCreatedatString());

			JSONObject count = new JSONObject();
			count.put("v", vo.getSumPrice());

			JSONArray row = new JSONArray(); 
			row.add(type);
			row.add(count); 

			JSONObject cell = new JSONObject();
			cell.put("c", row);
			body.add(cell); 

		}
		data.put("rows", body);

		return data;
	}
	
	//셀렉트 조회 가입자 현황 라인차트
	@Override
	public JSONObject selectUserLineChart(Map<String, String> select_keyword) throws Exception {
	List<E_p006VO> items = e_p006DAO.selectUserLineChart(select_keyword);
	
		JSONObject data = new JSONObject(); 

		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		JSONObject col4 = new JSONObject();
	
		JSONArray title = new JSONArray();

		col1.put("label", "날짜"); 
		col1.put("type", "string");
		col2.put("label", "전체");
		col2.put("type", "number");
		col3.put("label", "남자");
		col3.put("type", "number");
		col4.put("label", "여자");
		col4.put("type", "number");
		
		title.add(col1);
		title.add(col2);
		title.add(col3);
		title.add(col4);

		data.put("cols", title);
								
		JSONArray body = new JSONArray(); 

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject(); 
			type.put("v", vo.getUserCreatedat());
		

			JSONObject count = new JSONObject();
			JSONObject count2 = new JSONObject();
			JSONObject count3 = new JSONObject();
			
			count.put("v", vo.getAllUser());
			count2.put("v", vo.getMan());
			count3.put("v", vo.getWoman());

			JSONArray row = new JSONArray();
			
			row.add(type); 
			row.add(count); 
			row.add(count2); 
			row.add(count3); 

			JSONObject cell = new JSONObject();
			cell.put("c", row); 
			body.add(cell); 

		}
		data.put("rows", body);

		return data;
	}

	//지정일자 조회 가입자 통계 라인 차트
	@Override
	public JSONObject serchUserLineChart(Map<String, String> search_keyword) throws Exception {
		List<E_p006VO> items = e_p006DAO.serchUserLineChart(search_keyword);
		
		JSONObject data = new JSONObject(); 

		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		JSONObject col4 = new JSONObject();
	
		JSONArray title = new JSONArray();

		col1.put("label", "날짜"); 
		col1.put("type", "string");
		col2.put("label", "전체");
		col2.put("type", "number");
		col3.put("label", "남자");
		col3.put("type", "number");
		col4.put("label", "여자");
		col4.put("type", "number");
		

		title.add(col1);
		title.add(col2);
		title.add(col3);
		title.add(col4);

		data.put("cols", title);

		JSONArray body = new JSONArray(); 

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject(); 
			
			type.put("v", vo.getUserCreatedat());
		
			JSONObject count = new JSONObject();
			JSONObject count2 = new JSONObject();
			JSONObject count3 = new JSONObject();
			
			count.put("v", vo.getAllUser());
			count2.put("v", vo.getMan());
			count3.put("v", vo.getWoman());
			

			JSONArray row = new JSONArray(); 
			
			row.add(type); 
			row.add(count); 
			row.add(count2); 
			row.add(count3); 

			JSONObject cell = new JSONObject();
			cell.put("c", row); 
			body.add(cell); 

		}
		data.put("rows", body);

		return data;
	}

	//셀렉트 조회 가입자 통계 바차트
	@Override
	public JSONObject selectUserBarChart(Map<String, String> select_keyword) throws Exception {
	List<E_p006VO> items = e_p006DAO.selectUserBarChart(select_keyword);
		
		JSONObject data = new JSONObject(); 

		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		JSONObject col4 = new JSONObject();
	
		JSONArray title = new JSONArray();

		col1.put("label", "타입");
		col1.put("type", "string");
		col2.put("label", "총 회원수");
		col2.put("type", "number");
		col3.put("label", "남자");
		col3.put("type", "number");
		col4.put("label", "여자");
		col4.put("type", "number");
		
		title.add(col1);
		title.add(col2);
		title.add(col3);
		title.add(col4);

		data.put("cols", title);

		JSONArray body = new JSONArray(); 

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject();
			
			type.put("v", "");

			JSONObject count = new JSONObject();
			JSONObject count2 = new JSONObject();
			JSONObject count3 = new JSONObject();
			
			count.put("v", vo.getAllUser());
			count2.put("v", vo.getMan());
			count3.put("v", vo.getWoman());
			

			JSONArray row = new JSONArray(); 
			row.add(type); 
			row.add(count); 
			row.add(count2);
			row.add(count3);

			JSONObject cell = new JSONObject();
			cell.put("c", row); 
			body.add(cell); 

		}
		data.put("rows", body);

		return data;
	}

	//지정일자 조회 가입자 현황 바 차트
	@Override
	public JSONObject serchUserBarChart(Map<String, String> search_keyword) throws Exception {
			List<E_p006VO> items = e_p006DAO.serchUserBarChart(search_keyword);
		
		JSONObject data = new JSONObject(); 

		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		JSONObject col4 = new JSONObject();
	
		JSONArray title = new JSONArray();

		col1.put("label", "타입");
		col1.put("type", "string");
		col2.put("label", "총 회원수");
		col2.put("type", "number");
		col3.put("label", "남자");
		col3.put("type", "number");
		col4.put("label", "여자");
		col4.put("type", "number");
		
		title.add(col1);
		title.add(col2);
		title.add(col3);
		title.add(col4);


		data.put("cols", title);

		JSONArray body = new JSONArray();

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject();
			type.put("v", "");

			JSONObject count = new JSONObject();
			JSONObject count2 = new JSONObject();
			JSONObject count3 = new JSONObject();
			count.put("v", vo.getAllUser());
			count2.put("v", vo.getMan());
			count3.put("v", vo.getWoman());
			

			JSONArray row = new JSONArray();
			row.add(type);
			row.add(count); 
			row.add(count2); 
			row.add(count3); 

			JSONObject cell = new JSONObject();
			cell.put("c", row); 
			body.add(cell); 
		}
		data.put("rows", body);

		return data;
	}

	//셀렉트 조회 카테고리별 판매 통계
	@Override
	public JSONObject selectCategoryChart(Map<String, String> select_keyword) throws Exception {
		List<E_p006VO> items = e_p006DAO.selectCategoryChart(select_keyword);
		
		JSONObject data = new JSONObject(); 

		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		JSONObject col4 = new JSONObject();
		
	
		JSONArray title = new JSONArray();

		
		col1.put("label", "날짜"); 
		col1.put("type", "string");
		
		col2.put("label", "의류"); 
		col2.put("type", "number");
		
		col3.put("label", "잡화"); 
		col3.put("type", "number");
		
		col4.put("label", "등산");
		col4.put("type", "number");
		

		title.add(col1);
		title.add(col2);
		title.add(col3);
		title.add(col4);
		

		data.put("cols", title);

		JSONArray body = new JSONArray(); 

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject(); 
			type.put("v",vo.getOrdereDatString());

			JSONObject count = new JSONObject(); //의류
			JSONObject count1 = new JSONObject(); //잡화
			JSONObject count2 = new JSONObject(); //등산용품
			
		
			
			count.put("v", vo.getType1());
			count1.put("v",vo.getType2());
			count2.put("v",vo.getType3());

			JSONArray row = new JSONArray(); 
			row.add(type);
			row.add(count); 
			row.add(count1); 
			row.add(count2); 

			JSONObject cell = new JSONObject();
			cell.put("c", row);
			body.add(cell); 

		}
		data.put("rows", body);

		return data;
		
	}

	//지정일자 조회 카테고리별 통계
	@Override
	public JSONObject serchCategoryChart(Map<String, String> search_keyword) throws Exception {
		List<E_p006VO> items = e_p006DAO.serchCategoryChart(search_keyword);
		
		JSONObject data = new JSONObject(); 

		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		JSONObject col4 = new JSONObject();
		
	
		JSONArray title = new JSONArray();

		
		col1.put("label", "날짜"); 
		col1.put("type", "string");
		
		col2.put("label", "의류"); 
		col2.put("type", "number");
		
		col3.put("label", "잡화"); 
		col3.put("type", "number");
		
		col4.put("label", "등산");
		col4.put("type", "number");
		

		title.add(col1);
		title.add(col2);
		title.add(col3);
		title.add(col4);
		

		data.put("cols", title);

		JSONArray body = new JSONArray(); 

		for (E_p006VO vo : items) {

			JSONObject type = new JSONObject(); 
			type.put("v",vo.getOrdereDatString());

			JSONObject count = new JSONObject(); //의류
			JSONObject count1 = new JSONObject(); //잡화
			JSONObject count2 = new JSONObject(); //등산용품
			
		
			
			count.put("v", vo.getType1());
			count1.put("v",vo.getType2());
			count2.put("v",vo.getType3());

			JSONArray row = new JSONArray(); 
			row.add(type);
			row.add(count); 
			row.add(count1); 
			row.add(count2); 

			JSONObject cell = new JSONObject();
			cell.put("c", row);
			body.add(cell); 

		}
		data.put("rows", body);

		return data;
	}
}
