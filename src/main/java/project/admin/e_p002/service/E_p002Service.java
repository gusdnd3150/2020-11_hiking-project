package project.admin.e_p002.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface E_p002Service {

	int insertProd(Map map)throws Exception;

	int insertProdPhoto(int index, List<MultipartFile> files, String path)throws IOException;

	List<HashMap<String, String>> selectProd(Map<String, String> search)throws Exception;

	int deleteProd(int prodNum)throws Exception;

}
