package project.admin.e_p002.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.admin.e_p002.vo.E_p002VO;

public interface E_p002Service {

	int insertProd(Map map)throws Exception;

	int insertProdPhoto(int index, List<MultipartFile> files, String path)throws IOException;
	
	List selectProd(Map search)throws Exception;
	
	List viewPhotoMainList(int prodNum)throws Exception;
	
	List viewPhotoDetail(int prodNum)throws Exception;

	void insertcategory(Map<String, Object> categoryMap)throws Exception;

	int insertProdOption(List<Map<String, Object>> optionListMap)throws Exception;

	int insertPhotoDetail(int index, List<MultipartFile> files2, String path, int insertProdPhoto)throws IOException;

	int updateOption(Map map)throws Exception;

	int updateDateProdOption(Map map)throws Exception;

	int updateDateProd(Map map)throws Exception;

	List viewProdList(int optionNum)throws Exception;

	List viewList(int optionNum)throws Exception;

	int upDateMainPhoto(int prodNum,Map<String, MultipartFile> fileMap, String path, int pphotonum)throws IOException;

	int upDateDetailPhoto(int prodNum, Map<String, MultipartFile> fileMap, String path, int pphotonum)throws IOException;

	int deleteImg(Map map)throws Exception;

	int upDateAddMainImg(List<MultipartFile> files, String path, int prodNum)throws IOException;

	int upDateAddDetailImg(List<MultipartFile> files, String path, int prodNum)throws IOException;

	List searchUsedProd(Map<String, String> search)throws Exception;

	List viewUsedList(Map map)throws Exception;

	List viewUsedOptionList(int prodNum)throws Exception;

	int usedComment(Map map)throws Exception;

	int insertPoint(Map map)throws Exception;

	String countUsed()throws Exception;

	String todayOrder(Map map)throws Exception;


}
