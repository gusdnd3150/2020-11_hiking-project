package project.admin.e_p004.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class E_p004DAOImpl implements E_p004DAO{

	@Autowired
	private SqlSession sqlSession;
	
	//조건 검색
	@Override
	public List selectOrder(Map<String, String> search) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p004.selectOrder",search);
		return list;
	}

	//배송 상태 변경
	@Override
	public int updateDelivery(Map map) throws Exception {
		return sqlSession.update("admin.mapper.e_p004.updateDelivery", map);
	}

	//셀렉트 일자 조회 (전체, 당일, 1주, 2주, 1달)
	@Override
	public List selectOrderDay(Map<String, String> select_keyword) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p004.selectOrderDay",select_keyword);
		return list;
	}

	//지정일자 조회 (ex 2020-02-16 ~ 2020-10-11)
	@Override
	public List searchOrderDay(Map<String, String> search_keyword) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p004.searchOrderDay",search_keyword);
		return list;
	}

	//주문 상태별 조회
	@Override
	public List selectOrderStatus(int orderStatus) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p004.selectOrderStatus",orderStatus);
		return list;
	}

	//배송상태별 조회
	@Override
	public List selectDeliveryStatus(int deliverystatus) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p004.selectDeliveryStatus",deliverystatus);
		return list;
	}

}
