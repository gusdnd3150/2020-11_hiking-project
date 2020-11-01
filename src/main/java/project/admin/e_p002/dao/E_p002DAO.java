package project.admin.e_p002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.admin.e_p002.vo.E_p002VO;

public interface E_p002DAO {

	int insertProd(Map map)throws Exception;

	int insertProdPhoto(List<Map> list);
	
	int insertPhotoDetail(List<Map> list2, int photoNum);
	
	List selectProd(Map search)throws Exception;

	void insertcategory(Map<String, Object> categoryMap)throws Exception;

	int insertProdOption(List<Map<String, Object>> optionListMap)throws Exception;

	int updateOption(Map map)throws Exception;

	int updateDateProdOption(Map map)throws Exception;

	int updateDateProd(Map map)throws Exception;

	List viewPhotoMainList(int prodNum)throws Exception;

	List viewPhotoDetail(int prodNum)throws Exception;

	List viewProdList(int optionNum)throws Exception;

	List viewList(int optionNum)throws Exception;

	int upDateMainPhoto(Map map);

	int upDateDetailPhoto(Map map);

	int deleteImg(Map map)throws Exception;

	int upDateAddMainImg(List<Map<String, Object>> list, int prodNum);

	int upDateAddDetailImg(List<Map<String, Object>> list, int prodNum);

	List searchUsedProd(Map<String, String> search)throws Exception;

	List viewUsedList(Map map)throws Exception;

	List viewUsedOptionList(int prodNum)throws Exception;

	int usedComment(Map map)throws Exception;

	int insertPoint(Map map)throws Exception;

	void upDateProdType(int prodNum)throws Exception;

	String countUsed()throws Exception;

	String todayOrder(Map map)throws Exception;

}
