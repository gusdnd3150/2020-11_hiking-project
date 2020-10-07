package project.B_P003_D001.dao;

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
	public E_P002_D003ProductsVO topDetail(Map<String, Object> map) throws DataAccessException {
		E_P002_D003ProductsVO vo = sqlSession.selectOne("project.e_P002_D003.selectProductDetail",map);
		return vo;
	}
	@Override
	public List<E_P002_D003PhotoVO> detailImages(Map<String, Object> map) throws DataAccessException {
          List<E_P002_D003PhotoVO> list = sqlSession.selectList("project.e_P002_D003.selectProductDetailImages",map);
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

	//////////////////구매 후//////////
	
	@Override
	public void updateQuantity(Map<String, Object> map) throws DataAccessException {
		sqlSession.update("project.e_P002_D003.updateQuantity",map);
	}
	@Override  //구매 후 orders 테이블에 주문 추가
	public void updateOrders(Map<String, Object> map) throws DataAccessException {
        sqlSession.insert("project.e_P002_D003.insertOrders",map);
	}
	@Override
	public void delivery(Map<String, Object> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.insertDelivery",map);
	}
	@Override
	public void updatePoint(Map<String, Object> map) throws DataAccessException {
		sqlSession.update("project.e_P002_D003.updatePoint",map);
	}
	@Override
	public void insertPayment(Map<String, Object> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.insertPayment",map);
		
	}
	
	///////////////장바구니
	@Override
	public void addCart(Map<String, Object> map) throws DataAccessException {
		sqlSession.insert("project.e_P002_D003.addCart",map);
	}
	@Override
	public List<OrdersVO> CartList(Map<String, Object> map) throws DataAccessException {
		List<OrdersVO> list =  sqlSession.selectList("project.e_P002_D003.UserCartList",map);
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
	
	

}
