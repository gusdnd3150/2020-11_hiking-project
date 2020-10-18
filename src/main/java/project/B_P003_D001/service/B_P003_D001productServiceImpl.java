package project.B_P003_D001.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.B_P003_D001.dao.B_P003_D001productDAO;
import project.B_P003_D001.vo.DeliveryVO;
import project.B_P003_D001.vo.OrdersVO;
import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;
import project.user.vo.UserVO;

@Service
public class B_P003_D001productServiceImpl implements B_P003_D001productService{

	@Autowired
	B_P003_D001productDAO b_P003_D001productDAO;
	
	@Override
	public List<Map> topDetail(Map<String, Object> map) throws DataAccessException {
		List<Map> vo = b_P003_D001productDAO.topDetail(map);
		return vo;
	}

	@Override
	public List<Map> detailImages(Map<String, Object> map) throws DataAccessException {
		List<Map> list = b_P003_D001productDAO.detailImages(map);
		return list;
	}
	@Override
	public List<Map> detailImagesBottom(Map<String, Object> map) throws DataAccessException {
		List<Map> list = b_P003_D001productDAO.detailImagesBottom(map);
		return list;
	}

	@Override
	public void addAfter(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.addAfter(map);
	}

	@Override
	public List<productAfterVO> afterList(Map<String, Object> map) throws DataAccessException {
		List<productAfterVO> list = b_P003_D001productDAO.afterList(map);
		return list;
	}

	@Override
	public int afterTotal(Map<String,Object> map) {
		int total = b_P003_D001productDAO.afterTotal(map);
		return total;
	}

	@Override
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException {
		productAfterVO resutl = b_P003_D001productDAO.getImage(vo);
		return resutl;
	}

	@Override
	public void addComent(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.addComent(map);
	}

	@Override
	public int average(Map<String, Object> map) throws DataAccessException {
        int average = b_P003_D001productDAO.average(map);
		return average;
	}

	public Map<String, Object> buyerinfo(Map<String, Object> map) throws DataAccessException {
		Map<String, Object> result = b_P003_D001productDAO.buyerinfo(map);
		return result;
	}

	@Override
	public UserVO getAddress(Map<String, Object> map) throws DataAccessException {
		UserVO vo = b_P003_D001productDAO.getAddress(map);
		return vo;
	}

	/// 아래는 구매 후
	@Override
	public void updateQuantity(List<Map> map) throws DataAccessException {
		b_P003_D001productDAO.updateQuantity(map);
	}

	@Override
	public void updateOrders(List<Map> map) throws DataAccessException {
		b_P003_D001productDAO.updateOrders(map);
	}


	@Override
	public void delivery(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.delivery(map);
	}

	@Override
	public void updatePoint(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.updatePoint(map);
	}

	@Override
	public void insertPayment(List<Map> map) throws DataAccessException {
		b_P003_D001productDAO.insertPayment(map);
		
	}

	//트랜잭션 테스트
	@Override
	@Transactional
	public void insertPaymentTest(Map<String, Object> map) throws DataAccessException {
		    //b_P003_D001productDAO.updateQuantity(map);
			//b_P003_D001productDAO.updateOrders(map);
			b_P003_D001productDAO.delivery(map);
			b_P003_D001productDAO.updatePoint(map);
			//b_P003_D001productDAO.insertPayment(map);
	}
	
	//장바구니 상품 추가
	
	public void addCart(List<Map> map) throws DataAccessException {
		b_P003_D001productDAO.addCart(map);
	}

	@Override
	public List<Map> CartList(Map<String, Object> map) throws DataAccessException {
		List<Map> list =  b_P003_D001productDAO.CartList(map);
		return list;
	}

	@Override
	public int CartTotal(Map<String, Object> map)throws DataAccessException {
		int total = b_P003_D001productDAO.CartTotal(map);
		return total;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.deleteCart(map);
	}

	@Override
	public Integer checkCart(Map<String, Object> map) throws DataAccessException {
		Integer result = b_P003_D001productDAO.checkCart(map);
		return result;
	}

	@Override
	public void modifyBeforeBuy(List<OrdersVO> list) throws DataAccessException {
		b_P003_D001productDAO.modifyBeforeBuy(list);	
	}
	
	
	/////중고물품 등록
	@Override
	public void saveUsedImage(List<Map> hmap) {
		b_P003_D001productDAO.saveUsedImage(hmap);
	}
	@Override
	public void addUsedProduct(Map<String, Object> datahMap) throws DataAccessException {
		b_P003_D001productDAO.addUsedProduct(datahMap);
	}

	@Override
	public List<Map> selectProductInfo(Map<String, Object> map) throws DataAccessException {
		return b_P003_D001productDAO.selectProductInfo(map);
	}

	@Override
	public List<Map> selectCartList(Map<String, Object> map) throws DataAccessException {
		return b_P003_D001productDAO.selectCartList(map);
	}

	@Override
	public int selectCartCount(Map<String, Object> map) {
		return b_P003_D001productDAO.selectCartCount(map);
	}
	
	@Override
	public List test(List<Map> list) {
		return b_P003_D001productDAO.test(list);
	}

	@Override
	public void insertPaymentMultiple(List<Map> map) throws DataAccessException {
		 b_P003_D001productDAO.insertPaymentMultiple(map);
		
	}

	@Override
	public void updateOrder(List<Map> map) throws DataAccessException {
		b_P003_D001productDAO.updateOrder(map);
	}

	@Override
	public void saveUsedDetailImage(List<Map> hmap) {
		b_P003_D001productDAO.saveUsedDetailImage(hmap);
		
	}

	@Override
	public void addUsedCategory(Map<String, Object> datahMap) throws DataAccessException {
		b_P003_D001productDAO.addUsedCategory(datahMap);
	}

	@Override
	public void addOption(List<Map> addOption)throws DataAccessException {
		b_P003_D001productDAO.addOption(addOption);
	}

	@Override
	public int prodNum() {
		return b_P003_D001productDAO.prodNum();
	}

	@Override
	public int optionNum() {
		return b_P003_D001productDAO.optionNum();
	}

	@Override
	public List<Integer> checkQuantity(Map<String,Object> map) throws DataAccessException {
		return b_P003_D001productDAO.checkQuantity(map);
	}

	@Override
	public List<Integer> searchOption(Map<String, Object> map) throws DataAccessException {
		return b_P003_D001productDAO.searchOption(map);
	}

	@Override
	public void addCartOne(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.addCartOne(map);
		
	}

	@Override
	public void modOption(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.modOption(map);
		
	}

	
	

}
