package project.B_P003_D001.dao;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.B_P003_D001.vo.DeliveryVO;
import project.B_P003_D001.vo.OrdersVO;
import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;
import project.user.vo.UserVO;

@Repository
public class B_P003_D001productDAOImpl implements B_P003_D001productDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map> topDetail(Map<String, Object> map) throws DataAccessException {
		List<Map> vo = sqlSession.selectList("project.e_P002_D003.selectProductDetail",map);
		return vo;
	}
	@Override
	public List<Map> detailImages(Map<String, Object> map) throws DataAccessException {
          List<Map> list = sqlSession.selectList("project.e_P002_D003.selectProductDetailImages",map);
		return list;
	}
	@Override
	public List<Map> detailImagesBottom(Map<String, Object> map) throws DataAccessException {
		List<Map> list = sqlSession.selectList("project.e_P002_D003.selectProductDetailImagesBottom",map);
		return list;
	}
	
	@Override
	public void addAfter(Map<String, Object> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.addAfter",map);
	}
	
	@Override
	public List<productAfterVO> afterList(Map<String, Object> map) throws DataAccessException {
		 List<productAfterVO> list = sqlSession.selectList("project.e_P002_D003.afterList",map);
			return list;
	}
	@Override
	public int afterTotal(Map<String,Object> map) {
		int total = sqlSession.selectOne("project.e_P002_D003.afterTotal",map);
		return total;
	}
	@Override
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException {
		productAfterVO result = sqlSession.selectOne("project.e_P002_D003.detailImage",vo);
		return result;
	}
	@Override
	public void addComent(Map<String, Object> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.addComent",map);		
	}
	@Override
	public int average(Map<String, Object> map) throws DataAccessException {
        int average = sqlSession.selectOne("project.e_P002_D003.prodAverage",map);
		return average;
	}
	////////////////////구매전////////
	@Override //테스트
	public Map<String, Object> buyerinfo(Map<String, Object> map) throws DataAccessException {
		Map<String, Object> result = new HashMap<String,Object>();
		result.put("point",sqlSession.selectOne("project.e_P002_D003.getPoint",map));//point
		return result;
	}
	@Override
	public UserVO getAddress(Map<String, Object> map) throws DataAccessException {
		UserVO vo = sqlSession.selectOne("project.e_P002_D003.getAddress",map);
		return vo;
	}
	@Override
	public List<Map> selectCartList(Map<String, Object> map) throws DataAccessException {
		return sqlSession.selectList("project.e_P002_D003.selectCartList",map);
	}
	@Override
	public int selectCartCount(Map<String, Object> map) {
		return sqlSession.selectOne("project.e_P002_D003.selectCartCount",map);
	}

	//////////////////구매 후//////////
	
	@Override
	public void updateQuantity(List<Map> map) throws DataAccessException {
		sqlSession.update("project.e_P002_D003.updateQuantity",map);
	}
	@Override  //구매 후 orders  table 수정  (장바구니 구매)
	public void updateOrders(List<Map> map) throws DataAccessException {
        sqlSession.update("project.e_P002_D003.insertOrders",map);
	}
	
	@Override  //구매 후 orders  table 수정       (즉시구매)
	public void updateOrder(List<Map> map) throws DataAccessException {
        sqlSession.insert("project.e_P002_D003.insertOrderOne",map);
	}
	
	@Override  //구매 후 pament 테이블에 주문 추가
	public void insertPaymentMultiple(List<Map> map) throws DataAccessException {
        sqlSession.insert("project.e_P002_D003.insertPaymentmultiple",map);
	}           
	
	
	@Override
	public void insertPayment(List<Map> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.insertPayment",map);
	}
	
	@Override
	public void delivery(Map<String, Object> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.insertDelivery",map);
	}
	@Override
	public void updatePoint(Map<String, Object> map) throws DataAccessException {
		sqlSession.update("project.e_P002_D003.updatePoint",map);
	}
	
	///////////////장바구니
	@Override
	public void addCart(List<Map> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.addCart",map);
	}
	@Override
	public List<Map> CartList(Map<String, Object> map) throws DataAccessException {
		List<Map> list =  sqlSession.selectList("project.e_P002_D003.UserCartList",map);
		return list;
	}
	@Override
	public int CartTotal(Map<String, Object> map)throws DataAccessException {
		int total = sqlSession.selectOne("project.e_P002_D003.CartCount",map);
		return total;
	}
	@Override
	public void deleteCart(Map<String, Object> map) throws DataAccessException {
		sqlSession.delete("project.e_P002_D003.deleteCart",map);
	}
	@Override
	public Integer checkCart(Map<String, Object> map) throws DataAccessException {
		Integer result =sqlSession.selectOne("project.e_P002_D003.checkProdNum",map);
		return result;
	}
	@Override
	public void modifyBeforeBuy(List<OrdersVO> list) throws DataAccessException {
		sqlSession.update("project.e_P002_D003.modifyBeforeBuy",list);
		
	}
	
	//////////////////중고물품 등록신청
	@Override
	public void saveUsedImage(List<Map> hmap) {
		sqlSession.insert("project.e_P002_D003.saveUsedImage",hmap);
	}
	@Override
	public void saveUsedDetailImage(List<Map> hmap) {
		sqlSession.insert("project.e_P002_D003.saveUsedDetailImage",hmap);
	}
	@Override
	public void addUsedProduct(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.addUsedPro",datahMap);
	}
	@Override
	public void addUsedCategory(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.addUsedCategory",datahMap);
	}
	@Override
	public int prodNum() {
		return sqlSession.selectOne("project.e_P002_D003.prodnum");
	}
	@Override
	public int optionNum() {
		return sqlSession.selectOne("project.e_P002_D003.optionNum");
	}
	
	
	@Override
	public void addOption(List<Map> addOption)throws DataAccessException {
			sqlSession.insert("project.e_P002_D003.addOption",addOption);
	}
	
	
	@Override   //구매페이지 상품 하나에 대한 정보
	public List<Map> selectProductInfo(Map<String, Object> map) throws DataAccessException {
		return sqlSession.selectList("project.e_P002_D003.selectProductInfo",map);
	}
	
	
	@Override   // 다중 select 테스트용
	public List<Map> test(List<Map> list) {
		List<Map> result = null;
		for(int i=0;i<list.size();i++) {
			result = sqlSession.selectList("project.e_P002_D003.test",list.get(i).get("orderNum"));
		}
		return result;
	}
	@Override
	public List<Integer> checkQuantity(Map<String,Object> map) throws DataAccessException {
		return sqlSession.selectList("project.e_P002_D003.checkQuantity",map);
	}







}
