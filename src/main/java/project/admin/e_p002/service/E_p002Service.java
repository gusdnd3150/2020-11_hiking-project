package project.admin.e_p002.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import project.admin.e_p002.vo.E_p002VO;

public interface E_p002Service {

	int insertProd(Map map)throws Exception;

	int insertProdPhoto(int index, List<MultipartFile> files, String path)throws IOException;

	List<HashMap<String, String>> selectProd(Map<String, String> search)throws Exception;

	int deleteProd(int prodNum)throws Exception;

	List viewProdList(int prodNum)throws Exception;

	List<E_p002VO> viewPhotoList(int prodNum)throws Exception;

	void insertcategory(Map<String, Object> categoryMap)throws Exception;

	int insertProdOption(List<Map<String, Object>> optionListMap)throws Exception;

	int insertPhotoDetail(int index, List<MultipartFile> files2, String path, int insertProdPhoto)throws IOException;

	

}
