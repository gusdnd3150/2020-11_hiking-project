package project.admin.e_p004.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import project.admin.e_p004.dao.E_p004DAO;

@Service
public class E_p004ServiceImpl implements E_p004Service{
	
	
	
	@Autowired
	private E_p004DAO e_p004DAO;

	//주문조건검색
	@Override
	public List selectOrder(Map<String, String> search) throws Exception {
		List list = e_p004DAO.selectOrder(search);
		return list;
	}

	//배송상태변경
	@Override
	public int updateDelivery(Map map) throws Exception {
		return e_p004DAO.updateDelivery(map);
	}

	////셀렉트 일자 조회 (전체, 당일, 1주, 2주 1달)
	@Override
	public List selectOrderDay(Map<String, String> select_keyword) throws Exception {
		List list = e_p004DAO.selectOrderDay(select_keyword);
		return list;
	}

	//지정일자 조회 (ex 2020-02-16 ~ 2020-10-11)
	@Override
	public List searchOrderDay(Map<String, String> search_keyword) throws Exception {
		List list = e_p004DAO.searchOrderDay(search_keyword);
		return list;
	}

	//주문상태별 조회
	@Override
	public List selectOrderStatus(int orderStatus) throws Exception {
		List list = e_p004DAO.selectOrderStatus(orderStatus);
		return list;
	}

	//배송상태별 조회
	@Override
	public List selectDeliveryStatus(int deliverystatus) throws Exception {
		List list = e_p004DAO.selectDeliveryStatus(deliverystatus);
		return list;
	}

	//문자발송
	@Override
	public int message(Map map) {
		
		String api_key = "NCSNCH1UOLCHLWCJ";
		String api_secret = "HLPAH4OKAP8QU5QGS0ZL7GKZL2KVOF0R";
		
		Message message = new Message(api_key, api_secret);
		HashMap<String, String> params = new HashMap<String, String>();
		
		  params.put("to", (String) map.get("phone"));
	      params.put("from", "01065130216");
	      params.put("type", "SMS");
	      params.put("text", map.get("name")+"고객님 오름마켓에서 주문하신 상품이 정상 출고 되었습니다. 이용해주셔서 감사합니다");
	      params.put("app_version", "test app 1.2");
	      
	      try { 
	    	  JSONObject obj = (JSONObject) message.send(params);
	    	  System.out.println(obj.toString()); //전송 결과 출력 
	    	  return 1;
	    	  } catch (CoolsmsException e) {
	    		  System.out.println(e.getMessage()); 
	    		  System.out.println(e.getCode()); 
	    	  return 0;
	    	 }
		
		
	}
	

}
