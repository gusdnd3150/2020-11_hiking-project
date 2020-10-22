package project.admin.e_p002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.admin.e_p002.vo.E_p002VO;

public interface E_p002DAO {

	int insertProd(Map map)throws Exception;

	int insertProdPhoto(List<Map> list);
	
	int insertPhotoDetail(List<Map> list2, int photoNum);

	//List<HashMap<String, String>> selectProd(Map<String, String> search)throws Exception;
	
	List selectProd(Map search)throws Exception;

	int deleteProd(int prodNum)throws Exception;

	List viewProdList(int prodNum)throws Exception;

	List<E_p002VO> viewPhotoList(int prodNum)throws Exception;

	void insertcategory(Map<String, Object> categoryMap)throws Exception;

	int insertProdOption(List<Map<String, Object>> optionListMap)throws Exception;

	int updateOption(Map map)throws Exception;

	


}
