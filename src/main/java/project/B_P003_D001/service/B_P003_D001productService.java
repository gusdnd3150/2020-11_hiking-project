package project.B_P003_D001.service;

import java.util.HashMap;


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

public interface B_P003_D001productService {
	
	public List<Map> topDetail(Map<String, Object> map) throws DataAccessException;
	public List<Map> detailImages(Map<String, Object> map) throws DataAccessException;
	public List<Map> detailImagesBottom(Map<String, Object> map) throws DataAccessException;
	
	public void addAfter(Map<String, Object> map) throws DataAccessException;
	public void addComent(Map<String, Object> map) throws DataAccessException ;
	public float average(Map<String, Object> map) throws DataAccessException;
	
	public List<Map> selectProductInfo(Map<String, Object> map) throws DataAccessException;
	

	public int afterTotal(Map<String,Object> map) ;
	public List<Map> afterList(Map<String, Object> map) throws DataAccessException;
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException;
	
	///
	public Map<String, Object> buyerinfo(Map<String, Object> map) throws DataAccessException ;
	public Map<String,Object> getAddress(Map<String, Object> map) throws DataAccessException;
	public void addAddress(Map<String, Object> info) throws DataAccessException;
	public List<Map> selectCartList(Map<String, Object> map) throws DataAccessException;
	public List<Map> paymentList(Map<String, Object> map) throws DataAccessException ;
	public void applycancelPay(Map<String, Object> map) ;
	public List<Map> payDetailList(Map<String, Object> map) throws DataAccessException ;
	public int totalPaymentCount(Map<String, Object> map) throws DataAccessException ;

	public int selectCartCount(Map<String, Object> map);
	public List<Map> selectComment(Map<String, Object> map) throws DataAccessException ;
	
	//구매성공 후
	public void updateQuantity(List<Map> map) throws DataAccessException;
	public void updateOrders(List<Map> map) throws DataAccessException;
	public void insertPaymentMultiple(List<Map> map) throws DataAccessException ;
	public void updateOrder(List<Map> map) throws DataAccessException ;
	public List<Map> checkPointTable(Map<String, Object> map) throws DataAccessException ;
	public int getDelibasic(Map<String, Object> map) throws DataAccessException;
	public List<Map> getDelibasicSize(Map<String, Object> map) throws DataAccessException;
	
	public void delivery(Map<String, Object> map) throws DataAccessException ;
	public void updatePoint(List<Map> map) throws DataAccessException ;
	public void insertPayment(List<Map> map) throws DataAccessException ;
	//트랜잭션 테스트용
	@Transactional
	public String insertPaymentTest(List<String> payNames,Map<String, Object> info,int userNum,List<Integer> prodNums,List<Integer> quantityToDB
			,List<Integer> orderNums,List<Integer> perTotals,List<Integer> prodPrices,List<Integer> optionNums) throws DataAccessException ;
	
	//장바구니 상품 추가
	public List<Integer> checkQuantity(Map<String,Object> map) throws DataAccessException ;
	public void addCart(List<Map> map) throws DataAccessException ;
	public void addCartOne(Map<String, Object> map) throws DataAccessException ;
	public List<Map> CartList(Map<String, Object> map) throws DataAccessException;
	public List<Integer> searchOption(Map<String, Object> map) throws DataAccessException;
	
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
	public int ordernum() throws DataAccessException;
	public void addOption(List<Map> addOption)throws DataAccessException ;
	public void modOption(Map<String, Object> map) throws DataAccessException ;
	public List test(List<Map> list);
	
	//마이페이지 구매내역, 위시리스트
	public int buyCount(int userNum) throws DataAccessException ;
	public int wishCount(int userNum) throws DataAccessException ;
	public void addprodLike(Map<String, Object> map) throws DataAccessException ;
	public List<Map> selectWishList(Map<String, Object> map) throws DataAccessException;
	public void updateMemo(Map<String, Object> map) throws DataAccessException ;
	public void addCartFromWish(List<Map> wish) throws DataAccessException;
	public void deleteWish(List<Map> wish) throws DataAccessException;
	public void deleteWishOne(Map<String, Object> likenum) throws DataAccessException;

	
	public int totaladdUsed(Map<String, Object> usernum) throws DataAccessException ;
	public List<Map> selectMyUsedList(Map<String, Object> usernum) throws DataAccessException ;
	public void delAfter(Map<String, Object> info) ;	
	public void delComment(Map<String, Object> afterNum) ;
	public void delwish(Map<String, Object> prodNum) throws DataAccessException ;
	public void addwish(Map<String, Object> prodNum) throws DataAccessException ;
	public void updateCNT(Map<String,Object> map) ;
	
	
	public List<Map> myMainImage(Map<String, Object> map) ;
	public List<Map> myDetailImage(Map<String, Object> map) ;
	public List<Map> myProdDetail(Map<String, Object> map) ;
}
