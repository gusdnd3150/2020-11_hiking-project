package project.admin.e_p004.service;

import java.util.List;
import java.util.Map;

public interface E_p004Service {

	List selectOrder(Map<String, String> search)throws Exception;

	int updateDelivery(Map map)throws Exception;

	List selectOrderDay(Map<String, String> select_keyword)throws Exception;

	List searchOrderDay(Map<String, String> search_keyword)throws Exception;

	List selectOrderStatus(int orderStatus)throws Exception;

	List selectDeliveryStatus(int deliverystatus)throws Exception;

	int message(Map map);

	List selectCancelOrder()throws Exception;

	List viewCancelList(String merchant_uid)throws Exception;

	List viewCancelList2(String merchant_uid)throws Exception;

	int upDateCancel(List<Map<String, Object>> optionListMap)throws Exception;

	int upDateOrderStatus(List<Map<String, Object>> ordernumListMap)throws Exception;

	int cancelMessage(Map map);

}
