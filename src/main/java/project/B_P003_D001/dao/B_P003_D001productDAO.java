package project.B_P003_D001.dao;

import java.util.ArrayList;
import java.util.List;


import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.B_P003_D001.vo.DeliveryVO;
import project.B_P003_D001.vo.OrdersVO;
import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;
import project.user.vo.UserVO;

public interface B_P003_D001productDAO {
	public E_P002_D003ProductsVO topDetail(Map<String,Object> map) throws DataAccessException;  //쇼핑몰 상세 상단 정보
	public List<E_P002_D003PhotoVO> detailImages(Map<String,Object> map)throws DataAccessException;
	public void addAfter(Map<String,Object> map)throws DataAccessException;
	public void addComent(Map<String,Object> map)throws DataAccessException;
	public int average(Map<String,Object> map)throws DataAccessException; //평균값 구하는 메서드

	public int afterTotal(Map<String,Object> map);
	public List<productAfterVO> afterList(Map<String,Object> map)throws DataAccessException;
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException;  //
	
	public Map<String, Object> buyerinfo(Map<String,Object> map)  throws DataAccessException;  
	public UserVO getAddress(Map<String,Object> map)  throws DataAccessException;
	
	////구매성공 후 
	public void updateQuantity(Map<String,Object> map)throws DataAccessException;//구매 성공 후 수량 감소
	public void updateOrders(Map<String,Object> map)throws DataAccessException;
	public void delivery(Map<String,Object> map)throws DataAccessException;
	public void updatePoint(Map<String, Object> map) throws DataAccessException ;
	public void insertPayment(Map<String, Object> map) throws DataAccessException ;
	
	//장바구니  상품 추가
	public void addCart(Map<String, Object> map) throws DataAccessException ;
	public Integer checkCart(Map<String, Object> map) throws DataAccessException ;
	public List<OrdersVO> CartList(Map<String,Object> map)throws DataAccessException;
	public int CartTotal(Map<String,Object> map)throws DataAccessException;
	public void deleteCart(Map<String, Object> map) throws DataAccessException ;
	public void modifyBeforeBuy(List<OrdersVO> list)throws DataAccessException; 
}
