package project.admin.e_p002.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import project.admin.e_p002.dao.E_p002DAO;
import project.common.FileUtils;

@Service
public class E_p002ServiceImpl implements E_p002Service{
	
	@Autowired
	private E_p002DAO e_p002DAO;
	
	@Resource(name = "fileUtils")
    private FileUtils fileUtils;

	//상품등록
	@Override 
	public int insertProd(Map map) throws Exception {
		return e_p002DAO.insertProd(map);
	}

	//상품사진등록
	@Override
	 @Transactional(propagation = Propagation.REQUIRED)
	public int insertProdPhoto(int index, List<MultipartFile> files, String path) throws IOException {
		List list =fileUtils.saveFile(index, files, path);
		return e_p002DAO.insertProdPhoto(list);
	}

	//상품 조회
	@Override
	public List<HashMap<String, String>> selectProd(Map<String, String> search) throws Exception {
		List<HashMap<String, String>> list = e_p002DAO.selectProd(search);
		return list;
	}
	
	//상품 삭제
	@Override
	public int deleteProd(int prodNum) throws Exception {
		return e_p002DAO.deleteProd(prodNum);
	}

}
