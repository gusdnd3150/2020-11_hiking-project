package project.admin.e_p002.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import project.admin.e_p002.dao.E_p002DAO;
import project.admin.e_p002.vo.E_p002VO;
import project.common.FileUtils;

@Service
@Transactional
public class E_p002ServiceImpl implements E_p002Service{
	
	@Autowired
	private E_p002DAO e_p002DAO;
	
	@Resource(name = "fileUtils")
    private FileUtils fileUtils;
	
	  public static String getRandomString(){
	        return UUID.randomUUID().toString().replaceAll("-","");
	    }

	//상품등록
	@Override 
	public int insertProd(Map map) throws Exception {
		return e_p002DAO.insertProd(map);
	}

	//상품등록시 카테고리 등록
	@Override
	public void insertcategory(Map<String, Object> categoryMap) throws Exception{
		e_p002DAO.insertcategory(categoryMap);
		
	}
	
	//상품사진등록
	@Override
	 @Transactional(propagation = Propagation.REQUIRED)
	public int insertProdPhoto(int index, List<MultipartFile> files, String path) throws IOException {
		List list =fileUtils.saveFile(index, files, path);
		 return  e_p002DAO.insertProdPhoto(list);
	}
	//상품 디테일 사진
	@Override
	public int insertPhotoDetail(int index, List<MultipartFile> files2, String path, int PhotoNum) throws IOException {
		
		
			String originalFileName = null;
	        String originalFileExtension = null;
	        String storedFileName = null;

	        List list = new ArrayList();
	        Map listMap = null;

	        String imagePath = "/resources/img/";
	        String savePath = path + imagePath;

	        File file = new File(savePath);
	        if(file.exists() == false){
	            file.mkdirs();
	        }

	        for(MultipartFile m : files2){
	            originalFileName = m.getOriginalFilename();
	            originalFileExtension = m.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
	            storedFileName = getRandomString() + originalFileExtension;

	            file = new File(savePath + storedFileName);
	            System.out.println(file.getAbsolutePath()); //파일 절대 경로

	            m.transferTo(file);

	            listMap = new HashMap();
	            listMap.put("prodNum", index);
	            listMap.put("contentdetail", storedFileName);
	            list.add(listMap);
	        }
	        System.out.println(list.toString());
	        return e_p002DAO.insertPhotoDetail(list,PhotoNum);
	}
	
	//상품 옵션등록
	@Override
	public int insertProdOption(List<Map<String, Object>> optionListMap) throws Exception {	
		return e_p002DAO.insertProdOption(optionListMap);
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

	//상품 상세페이지
	@Override
	public List viewProdList(int prodNum) throws Exception {
		List list = e_p002DAO.viewProdList(prodNum);
		return list;
	}

	//상품 상세페이지 이미지 리스트
	@Override
	public List viewPhotoList(int prodNum) throws Exception {
		List<E_p002VO> list1 = e_p002DAO.viewPhotoList(prodNum);
		return list1;
	}

	

	

	
	


}
