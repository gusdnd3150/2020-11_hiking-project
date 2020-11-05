package project.admin.e_p004.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import project.admin.e_p004.dao.E_p004DAO;

@Service
public class E_p004ServiceImpl implements E_p004Service {

	@Autowired
	private E_p004DAO e_p004DAO;

	@Value("${sms.key}")
	private String api_key;

	@Value("${sms.secret}")
	private String api_secret;

	// 주문조건검색
	@Override
	public List selectOrder(Map<String, String> search) throws Exception {
		List list = e_p004DAO.selectOrder(search);
		return list;
	}

	// 배송상태변경
	@Override
	public int updateDelivery(Map map) throws Exception {
		return e_p004DAO.updateDelivery(map);
	}

	//// 셀렉트 일자 조회 (전체, 당일, 1주, 2주 1달)
	@Override
	public List selectOrderDay(Map<String, String> select_keyword) throws Exception {
		List list = e_p004DAO.selectOrderDay(select_keyword);
		return list;
	}

	// 지정일자 조회 (ex 2020-02-16 ~ 2020-10-11)
	@Override
	public List searchOrderDay(Map<String, String> search_keyword) throws Exception {
		List list = e_p004DAO.searchOrderDay(search_keyword);
		return list;
	}

	// 주문상태별 조회
	@Override
	public List selectOrderStatus(int orderStatus) throws Exception {
		List list = e_p004DAO.selectOrderStatus(orderStatus);
		return list;
	}

	// 배송상태별 조회
	@Override
	public List selectDeliveryStatus(int deliverystatus) throws Exception {
		List list = e_p004DAO.selectDeliveryStatus(deliverystatus);
		return list;
	}

	// 취소 요청건 조회
	@Override
	public List selectCancelOrder() throws Exception {
		List list = e_p004DAO.selectCancelOrder();
		return list;
	}

	// 취소 상세보기1 (고객정보)
	@Override
	public List viewCancelList(String merchant_uid) throws Exception {
		List list = e_p004DAO.viewCancelList(merchant_uid);
		return list;
	}

	// 취소 상세보기(상품정보)
	@Override
	public List viewCancelList2(String merchant_uid) throws Exception {
		List list = e_p004DAO.viewCancelList2(merchant_uid);
		return list;
	}

	// 결제취소시 재고 수량 수정
	@Override
	public int upDateCancel(List<Map<String, Object>> optionListMap) throws Exception {
		int result = e_p004DAO.upDateCancel(optionListMap);
		return result;
	}

	// 결제 취소시 오터 상태 수정 (결제취소로 전환)
	@Override
	public int upDateOrderStatus(List<Map<String, Object>> ordernumListMap) throws Exception {
		int result = e_p004DAO.upDateOrderStatus(ordernumListMap);
		return result;

	}

	// 결제 취소 메세지
	@Override
	public int cancelMessage(Map map) {

		Message message = new Message(api_key, api_secret);
		HashMap<String, String> params = new HashMap<String, String>();

		params.put("to", (String) map.get("phone"));
		params.put("from", "01065130216");
		params.put("type", "SMS");
		params.put("text", map.get("name") + "고객님 오름마켓 결제 취소 요청건이 정상 처리되었습니다. 감사합니다.");
		params.put("app_version", "test app 1.2");

		try {
			JSONObject obj = (JSONObject) message.send(params);
			System.out.println(obj.toString()); // 전송 결과 출력
			return 1;
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
			return 0;
		}
	}

	// 배송 완료 문자 발송
	@Override
	public int message(Map map) {
		Message message = new Message(api_key, api_secret);
		HashMap<String, String> params = new HashMap<String, String>();

		params.put("to", (String) map.get("phone"));
		params.put("from", "01065130216");
		params.put("type", "SMS");
		params.put("text", map.get("name") + "고객님 오름마켓에서 주문하신 상품이 정상 출고 되었습니다. 이용해주셔서 감사합니다");
		params.put("app_version", "test app 1.2");

		try {
			JSONObject obj = (JSONObject) message.send(params);
			System.out.println(obj.toString()); // 전송 결과 출력
			return 1;
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
			return 0;
		}

	}

	//금일 취소요청건 카운트
	@Override
	public String toDayCancelOrder(Map map) throws Exception {
		return e_p004DAO.toDayCancelOrder(map);
	}


}
