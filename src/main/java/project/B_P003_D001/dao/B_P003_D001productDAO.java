package project.B_P003_D001.dao;

import java.util.ArrayList;
import java.util.List;


import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.transaction.annotation.Transactional;

import project.B_P003_D001.vo.DeliveryVO;
import project.B_P003_D001.vo.OrdersVO;
import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;
import project.user.vo.UserVO;

public interface B_P003_D001productDAO {
	public List<Map> topDetail(Map<String,Object> map) throws DataAccessException;  //쇼핑몰 상세 상단 정보
	public List<Map> detailImages(Map<String,Object> map)throws DataAccessException;
	public List<Map> detailImagesBottom(Map<String, Object> map) throws DataAccessException ;
	public void addAfter(Map<String,Object> map)throws DataAccessException;
	public void addComent(Map<String,Object> map)throws DataAccessException;
	public int average(Map<String,Object> map)throws DataAccessException; //평균값 구하는 메서드

	public List<Map> selectProductInfo(Map<String,Object> map) throws DataAccessException;  //즉시구매 페이지 상품 정보
	
	public int afterTotal(Map<String,Object> map);
	public List<productAfterVO> afterList(Map<String,Object> map)throws DataAccessException;
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException;  //
	
	///구매전
	public Map<String, Object> buyerinfo(Map<String,Object> map)  throws DataAccessException;  
	public UserVO getAddress(Map<String,Object> map)  throws DataAccessException;
	public List<Map> selectCartList(Map<String, Object> map) throws DataAccessException;
	public int selectCartCount(Map<String,Object> map);
	
	////구매성공 후 
	@Transactional
	public void updateQuantity(List<Map> map)throws DataAccessException;//구매 성공 후 수량 감소
	@Transactional
	public void updateOrders(List<Map> map)throws DataAccessException;
	@Transactional
	public void insertPaymentMultiple(List<Map> map) throws DataAccessException;
	@Transactional
	public void insertPayment(List<Map> map) throws DataAccessException ;
	@Transactional
	public void updateOrder(List<Map> map) throws DataAccessException ;
	@Transactional
	public void delivery(Map<String,Object> map)throws DataAccessException;
	@Transactional
	public void updatePoint(Map<String, Object> map) throws DataAccessException ;
	
	public List<Integer> checkQuantity(Map<String,Object> map)throws DataAccessException ;
	public void addCart(List<Map> map) throws DataAccessException ;
	public Integer checkCart(Map<String, Object> map) throws DataAccessException ;
	public List<Map> CartList(Map<String,Object> map)throws DataAccessException;
	public int CartTotal(Map<String,Object> map)throws DataAccessException;
	public void deleteCart(Map<String, Object> map) throws DataAccessException ;
	public void modifyBeforeBuy(List<OrdersVO> list)throws DataAccessException; 
	
	//중고물품 등록신청
	public void saveUsedImage(List<Map> hmap)throws DataAccessException ;
	public void saveUsedDetailImage(List<Map> hmap) ;
	public void addUsedProduct(Map<String, Object> datahMap) throws DataAccessException;
	public void addUsedCategory(Map<String, Object> datahMap) throws DataAccessException;
	public int prodNum();
	public void addOption(List<Map> addOption)throws DataAccessException ;
	public int optionNum(); 
	
	public List<Map> test(List<Map> list);
	
}