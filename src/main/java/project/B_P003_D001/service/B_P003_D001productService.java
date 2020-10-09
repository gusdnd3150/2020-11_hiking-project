package project.B_P003_D001.service;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.B_P003_D001.vo.DeliveryVO;
import project.B_P003_D001.vo.OrdersVO;
import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;
import project.user.vo.UserVO;

public interface B_P003_D001productService {
	
	public E_P002_D003ProductsVO topDetail(Map<String, Object> map) throws DataAccessException;
	public List<E_P002_D003PhotoVO> detailImages(Map<String, Object> map) throws DataAccessException;
	public void addAfter(Map<String, Object> map) throws DataAccessException;
	public void addComent(Map<String, Object> map) throws DataAccessException ;
	public int average(Map<String, Object> map) throws DataAccessException;
	
	public List<Map> selectProductInfo(Map<String, Object> map) throws DataAccessException;
	

	public int afterTotal(Map<String,Object> map) ;
	public List<productAfterVO> afterList(Map<String, Object> map) throws DataAccessException;
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException;
	
	public Map<String, Object> buyerinfo(Map<String, Object> map) throws DataAccessException ;
	public UserVO getAddress(Map<String, Object> map) throws DataAccessException;
	
	//구매성공 후
	public void updateQuantity(Map<String, Object> map) throws DataAccessException;
	public void updateOrders(Map<String, Object> map) throws DataAccessException;
	public void delivery(Map<String, Object> map) throws DataAccessException ;
	public void updatePoint(Map<String, Object> map) throws DataAccessException ;
	public void insertPayment(Map<String, Object> map) throws DataAccessException ;
	//트랜잭션 테스트용
	public void insertPaymentTest(Map<String, Object> map) throws DataAccessException ;
	
	//장바구니 상품 추가
	public void addCart(Map<String, Object> map) throws DataAccessException ;
	public List<Map> CartList(Map<String, Object> map) throws DataAccessException;
	public int CartTotal(Map<String, Object> map)throws DataAccessException ;
	public void deleteCart(Map<String, Object> map) throws DataAccessException;
	public Integer checkCart(Map<String, Object> map) throws DataAccessException ;
    public void modifyBeforeBuy(List<OrdersVO> list) throws DataAccessException ;
    
    //중고물품 등록
	public void saveUsedImage(List<E_P002_D003PhotoVO> hmap)throws DataAccessException ;
	public void addUsedProduct(Map<String, Object> datahMap) throws DataAccessException ;
}
