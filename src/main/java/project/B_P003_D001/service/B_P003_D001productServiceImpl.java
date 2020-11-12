package project.B_P003_D001.service;

import java.util.ArrayList;
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
	public List<Map> afterList(Map<String, Object> map) throws DataAccessException {
		List<Map> list = b_P003_D001productDAO.afterList(map);
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
	public float average(Map<String, Object> map) throws DataAccessException {
		float average = b_P003_D001productDAO.average(map);
		return average;
	}

	public Map<String, Object> buyerinfo(Map<String, Object> map) throws DataAccessException {
		Map<String, Object> result = b_P003_D001productDAO.buyerinfo(map);
		return result;
	}

	@Override
	public Map<String,Object> getAddress(Map<String, Object> map) throws DataAccessException {
		Map<String,Object> vo = b_P003_D001productDAO.getAddress(map);
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
	public void updatePoint(List<Map> map) throws DataAccessException {
		b_P003_D001productDAO.updatePoint(map);
	}

	@Override
	public void insertPayment(List<Map> map) throws DataAccessException {
		b_P003_D001productDAO.insertPayment(map);
		
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

	@Override
	public int ordernum() throws DataAccessException {
		return b_P003_D001productDAO.ordernum();
	}

	@Override
	public int buyCount(int userNum) throws DataAccessException {
		return b_P003_D001productDAO.buyCount(userNum);
	}

	@Override
	public int wishCount(int userNum) throws DataAccessException {
		return b_P003_D001productDAO.wishCount(userNum);
	}

	@Override
	public void addprodLike(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.addprodLike(map);
		
	}

	@Override
	public List<Map> selectWishList(Map<String, Object> map) throws DataAccessException {
		return b_P003_D001productDAO.selectWishList(map);
	}

	@Override
	public void updateMemo(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.updateMemo(map);
		
	}

	@Override
	public void addCartFromWish(List<Map> wish) throws DataAccessException {
		b_P003_D001productDAO.addCartFromWish(wish);
		
	}

	@Override
	public void deleteWish(List<Map> wish) throws DataAccessException {
		b_P003_D001productDAO.deleteWish(wish);
		
	}

	@Override
	public void deleteWishOne(Map<String, Object> likenum) throws DataAccessException {
		b_P003_D001productDAO.deleteWishOne(likenum);
		
	}

	@Override
	public void addAddress(Map<String, Object> info) throws DataAccessException {
		b_P003_D001productDAO.addAddress(info);
		
	}

	@Override
	public int getDelibasic(Map<String, Object> map) throws DataAccessException {
		return b_P003_D001productDAO.getDelibasic(map);
	}

	@Override
	public List<Map> checkPointTable(Map<String, Object> map) throws DataAccessException {
		return b_P003_D001productDAO.checkPointTable(map);
	}

	@Override
	public List<Map> getDelibasicSize(Map<String, Object> map) throws DataAccessException {
		return b_P003_D001productDAO.getDelibasicSize(map);
	}

	@Override
	public List<Map> paymentList(Map<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return b_P003_D001productDAO.paymentList(map);
	}

	@Override
	public int totalPaymentCount(Map<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return b_P003_D001productDAO.totalPaymentCount(map);
	}

	@Override
	public List<Map> payDetailList(Map<String, Object> map) throws DataAccessException {
		return b_P003_D001productDAO.payDetailList(map);
	}


	@Override
	public void applycancelPay(Map<String, Object> map) {
		b_P003_D001productDAO.applycancelPay(map);
		
	}
	
	@Override
	public List<Map> selectComment(Map<String, Object> map) throws DataAccessException {
		return b_P003_D001productDAO.selectComment(map);
	}

	@Override
	public int totaladdUsed(Map<String, Object> usernum) throws DataAccessException {
		return b_P003_D001productDAO.totaladdUsed(usernum);
	}

	@Override
	public List<Map> selectMyUsedList(Map<String, Object> usernum) throws DataAccessException {
		return b_P003_D001productDAO.selectMyUsedList(usernum);
	}
	

	@Override
	public void delAfter(Map<String, Object> info) {
		b_P003_D001productDAO.delAfter(info);
		
	}

	@Override
	public void delComment(Map<String, Object> afterNum) {
		b_P003_D001productDAO.delComment(afterNum);
	}
	
	@Override
	public void delwish(Map<String, Object> prodNum) throws DataAccessException {
		b_P003_D001productDAO.delwish(prodNum);
	}
	

	@Override
	public void addwish(Map<String, Object> prodNum) throws DataAccessException {
		b_P003_D001productDAO.addwish(prodNum);
		
	}
	
	@Override
	public void updateCNT(Map<String,Object> map) {
		 b_P003_D001productDAO.updateCNT(map);
	}
	
	@Override
	public List<Map> myMainImage(Map<String, Object> map) {
		
		return b_P003_D001productDAO.myMainImage(map);
	}
	@Override
	public List<Map> myDetailImage(Map<String, Object> map) {
		return b_P003_D001productDAO.myDetailImage(map);
	}
	@Override
	public List<Map> myProdDetail(Map<String, Object> map) {
		return b_P003_D001productDAO.myProdDetail(map);
	}


	

		@Override           //결제
		@Transactional
		public String insertPaymentTest(List<String> payNames,Map<String, Object> info,int userNum,List<Integer> prodNums,List<Integer> quantityToDB
				,List<Integer> orderNums,List<Integer> perTotals,List<Integer> prodPrices,List<Integer> optionNums) throws DataAccessException {
			String result ="";

			Map<String,Object> param2 = new HashMap<String,Object>();
	        List<Map> list = new ArrayList<Map>();
	        System.out.println("info에 담긴 정보들:"+info.toString());
	        
	        String type = (String) info.get("type");  //즉시구매 1   장바구니결제 3
	        String point=(String) info.get("point");
	        int deliveryType =0;
	        
	        try {
			    param2.put("userNum", userNum);
		        param2.put("price",Integer.parseInt((String) info.get("paid_amount")));
		        param2.put("prodName",info.get("prodName"));
		        param2.put("chooseAddress",info.get("chooseAddress")); 
		        param2.put("address1",info.get("address1"));
		        param2.put("address2",info.get("address2"));
		        param2.put("paid_amount",Integer.parseInt((String) info.get("paid_amount")));
		        param2.put("zoneCode",Integer.parseInt((String) info.get("zoneCode")));
		        param2.put("point",Integer.parseInt((String) info.get("point")));
		        param2.put("phoneNum",info.get("phoneNum"));
		        param2.put("custName",info.get("custName"));
			
		     //   delivery
			  if(info.get("chooseAddress").equals("변경배송지")) {
				  
				    List<Map> delisize = getDelibasicSize(param2);
				    if(delisize.size()==0) { //delivery 테이블에 row가 없으면 기본배송지로 추가
				    	deliveryType=1;
				    }else {
				    	deliveryType = getDelibasic(param2)+1;
				    }
			        param2.put("deliBasic", deliveryType);
			        delivery(param2);
			        
		        }else {  //기본배송지
		        	deliveryType = 1;
		        }
			
			
			if(type.equals("1")) {
				System.out.println("즉시구매");
				
				int totalPrice =Integer.parseInt((String) info.get("totalPrice")); //결제 총금액
		    	 
				
				System.out.println("즉시구매 사이즈:"+orderNums.size());
				for(int i=0; i<orderNums.size() ;i++) {
					Map<String,Object> param = new HashMap<String,Object>();
					int orderNum= ordernum(); //시퀀스번호
					System.out.println("오더넘 시퀀스:"+orderNum);
					param.put("userNum",userNum);
					param.put("prodNum", prodNums.get(i));
					param.put("quantity", quantityToDB.get(i));  
					param.put("optionNum", optionNums.get(i));
					param.put("payTotal", perTotals.get(i));
					param.put("price", prodPrices.get(i));
					param.put("deliveryType",deliveryType  );
					param.put("prodName",info.get("prodName"));
					param.put("custName",info.get("custName"));
					param.put("payType",info.get("payType"));
					param.put("imp_uid",info.get("imp_uid"));
					param.put("merchant_uid",info.get("merchant_uid"));
					param.put("apply_num", info.get("apply_num"));
					
					param.put("orderNum",orderNum);
					param.put("getPoint", (totalPrice*0.05));  //총금액 5% - 사용포인트
					param.put("used", Integer.parseInt(point));  //사용한 포인트
					
					list.add(param);
				}
				
				System.out.println("즉시구매 파라미터값:"+list.toString());
				  //orders 에  delieryType 추가해주어야함
			    updateOrder(list);   //  (즉시구매)   insert orders
				updatePoint(list);   // point 테이블에 추가
				
			}else if(type.equals("3")) {
				System.out.println("장바구니 결제");
				
				int totalPrice =Integer.parseInt((String) info.get("totalPrice")); //결제 총금액
				for(int i=0;i<orderNums.size();i++) {
					Map<String,Object> param = new HashMap<String,Object>();
					param.put("userNum",userNum);
					param.put("prodNum", prodNums.get(i));
					param.put("quantity", quantityToDB.get(i));  //
					param.put("orderNum", orderNums.get(i));   //
					param.put("optionNum", optionNums.get(i));
					param.put("payTotal", perTotals.get(i));
					param.put("price", prodPrices.get(i));
					param.put("deliveryType", deliveryType );
					param.put("prodName",payNames.get(i));
					param.put("custName",info.get("custName"));
					param.put("payType",info.get("payType"));  //
					param.put("imp_uid",info.get("imp_uid"));
					param.put("merchant_uid",info.get("merchant_uid"));
					param.put("apply_num", info.get("apply_num"));
					
					param.put("getPoint", (totalPrice*0.05));  //총금액 5% - 사용포인트
					param.put("used", Integer.parseInt(point));  //사용한 포인트
					list.add(param);
				}
	        	updateOrders(list);    // (장바구니) update  orders
			    updatePoint(list);
	        	
			}
	        System.out.println("리스트 정보:"+list.toString());
	             //update  prodoption 수량 차감 
			    updateQuantity(list);
			    //insert payment   
			    insertPaymentMultiple(list); 
			    
	        result ="seccess";
	        	 
			} catch (Exception e) {
	           e.printStackTrace();
	           result="fail";
			}
			return result;
				
		}

		@Override
		public int ajaxTotal() {
			return b_P003_D001productDAO.ajaxTotal();
		}
		@Override
		public List<Map<String, Object>> ajaxResult(Map<String, Object> info) {
			return b_P003_D001productDAO.ajaxResult(info);
		}
		


		
		

		

	


}
