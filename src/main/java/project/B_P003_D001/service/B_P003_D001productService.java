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
	
	public List<Map> topDetail(Map<String, Object> map) throws DataAccessException;
	public List<Map> detailImages(Map<String, Object> map) throws DataAccessException;
	public List<Map> detailImagesBottom(Map<String, Object> map) throws DataAccessException;
	
	public void addAfter(Map<String, Object> map) throws DataAccessException;
	public void addComent(Map<String, Object> map) throws DataAccessException ;
	public int average(Map<String, Object> map) throws DataAccessException;
	
	public List<Map> selectProductInfo(Map<String, Object> map) throws DataAccessException;
	

	public int afterTotal(Map<String,Object> map) ;
	public List<productAfterVO> afterList(Map<String, Object> map) throws DataAccessException;
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException;
	
	///
	public Map<String, Object> buyerinfo(Map<String, Object> map) throws DataAccessException ;
	public UserVO getAddress(Map<String, Object> map) throws DataAccessException;
	public List<Map> selectCartList(Map<String, Object> map) throws DataAccessException;
	public int selectCartCount(Map<String, Object> map);
	
	//구매성공 후
	public void updateQuantity(List<Map> map) throws DataAccessException;
	public void updateOrders(List<Map> map) throws DataAccessException;
	public void insertPaymentMultiple(List<Map> map) throws DataAccessException ;
	public void updateOrder(List<Map> map) throws DataAccessException ;
	
	
	public void delivery(Map<String, Object> map) throws DataAccessException ;
	public void updatePoint(Map<String, Object> map) throws DataAccessException ;
	public void insertPayment(List<Map> map) throws DataAccessException ;
	//트랜잭션 테스트용
	public void insertPaymentTest(Map<String, Object> map) throws DataAccessException ;
	
	//장바구니 상품 추가
	public String checkQuantity(Map<String, Object> map) throws DataAccessException;
	public void addCart(Map<String, Object> map) throws DataAccessException ;
	public List<Map> CartList(Map<String, Object> map) throws DataAccessException;
	public int CartTotal(Map<String, Object> map)throws DataAccessException ;
	public void deleteCart(Map<String, Object> map) throws DataAccessException;
	public Integer checkCart(Map<String, Object> map) throws DataAccessException ;
    public void modifyBeforeBuy(List<OrdersVO> list) throws DataAccessException ;
    
    //중고물품 등록
	public void saveUsedImage(List<Map> hmap)throws DataAccessException ;
	public void saveUsedDetailImage(List<Map> hmap) ;
	public void addUsedProduct(Map<String, Object> datahMap) throws DataAccessException ;
	public void addUsedCategory(Map<String, Object> datahMap) throws DataAccessException;
	public int prodNum() ;
	public int optionNum() ;
	public void addOption(List<Map> hmap)throws DataAccessException ;
	public List test(List<Map> list);
}
