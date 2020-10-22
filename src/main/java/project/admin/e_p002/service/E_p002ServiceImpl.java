package project.admin.e_p002.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
	        return e_p002DAO.insertPhotoDetail(list,PhotoNum);
	}
	
	//상품 옵션등록
	@Override
	public int insertProdOption(List<Map<String, Object>> optionListMap) throws Exception {	
		return e_p002DAO.insertProdOption(optionListMap);
	}
	
	//상품조회
	@Override
	public List selectProd(Map search) throws Exception {
		List list =  e_p002DAO.selectProd(search);
		return list;
	}	

	//상품 옵션 수정 (사이즈, 색상, 재고 수정) 데이터 테이블 안에서 사용
	@Override
	public int updateOption(Map map) throws Exception {
		int result = e_p002DAO.updateOption(map);
		return result;
	}

	//상품 옵션 수정2(데이테 테이블 상태 및 상세페이지 옵션 정보 공통 사용)
	@Override
	public int updateDateProdOption(Map map) throws Exception {
		int result = e_p002DAO.updateDateProdOption(map);
		return result;
	}

	//상품 수정
	@Override
	public int updateDateProd(Map map) throws Exception {
		int result = e_p002DAO.updateDateProd(map);
		return result;
	}

	//상품 상세페이지 메인 이미지
	@Override
	public List viewPhotoMainList(int prodNum) throws Exception {
		List list = e_p002DAO.viewPhotoMainList(prodNum);
		return list;
	}

	//상품 상세페이지 디테일 이미지
	@Override
	public List viewPhotoDetail(int prodNum) throws Exception {
		List list = e_p002DAO.viewPhotoDetail(prodNum);
		return list;
	}

	//상품 상세페이지 상품 정보
	@Override
	public List viewProdList(int optionNum) throws Exception {
		List list = e_p002DAO.viewProdList(optionNum);
		return list;
	}

	//상세페이지 상단 고정 정보 가져오는 메소드
	@Override
	public List viewList(int optionNum) throws Exception {
		List list = e_p002DAO.viewList(optionNum);
		return list;
	}

	//상세페이지 메인사진 수정
	@Override
	public int upDateMainPhoto(int prodNum, Map<String, MultipartFile> fileMap, String path, int pphotonum) throws IOException {
	

        String imagePath = "/resources/img/";
        String savePath = path + imagePath;

        File file = new File(savePath);
        if(file.exists() == false){
            file.mkdirs();
        }
        
    	String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
      
        Map map = null;

        for(MultipartFile m : fileMap.values()){
            originalFileName = m.getOriginalFilename();
            originalFileExtension = m.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;

            file = new File(savePath + storedFileName);
            System.out.println(file.getAbsolutePath()); //파일 절대 경로

            m.transferTo(file);

            map = new HashMap();
            map.put("prodNum", prodNum);
            map.put("pphotonum", pphotonum);
            map.put("content", storedFileName);
        
        }
        return e_p002DAO.upDateMainPhoto(map);
	
	}

	//상세페이지 디테일 사진 수정
	@Override
	public int upDateDetailPhoto(int prodNum, Map<String, MultipartFile> fileMap, String path, int pphotonum) throws IOException{
		
		   String imagePath = "/resources/img/";
	       String savePath = path + imagePath;

	        File file = new File(savePath);
	        if(file.exists() == false){
	            file.mkdirs();
	        }
	        
	    	String originalFileName = null;
	        String originalFileExtension = null;
	        String storedFileName = null;
      
	        Map map = null;

	        for(MultipartFile m : fileMap.values()){
	            originalFileName = m.getOriginalFilename();
	            originalFileExtension = m.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
	            storedFileName = getRandomString() + originalFileExtension;

	            file = new File(savePath + storedFileName);
	            System.out.println(file.getAbsolutePath()); //파일 절대 경로

	            m.transferTo(file);

	            map = new HashMap();
	            map.put("prodNum", prodNum);
	            map.put("pphotonum", pphotonum);
	            map.put("contentdetail", storedFileName);
	        
	        }
	    
	        return e_p002DAO.upDateDetailPhoto(map);
	}

	//상세페이지 이미지 선택 삭제
	@Override
	public int deleteImg(Map map) throws Exception {
		return e_p002DAO.deleteImg(map);
	}

	//상세페이지 메인이지 추가
	@Override
	public int upDateAddMainImg(List<MultipartFile> files, String path, int prodNum) throws IOException {
		
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
      
        for(MultipartFile m : files){
            originalFileName = m.getOriginalFilename();
            originalFileExtension = m.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;

            file = new File(savePath + storedFileName);
            System.out.println(file.getAbsolutePath()); //파일 절대 경로

            m.transferTo(file);

            listMap = new HashMap();
            listMap.put("prodNum", prodNum);
            listMap.put("content", storedFileName);
            list.add(listMap);
        }
        return e_p002DAO.upDateAddMainImg(list,prodNum);
	}

	//상세페이지 디테일 이미지 추가
	@Override
	public int upDateAddDetailImg(List<MultipartFile> files, String path, int prodNum) throws IOException {
		
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
      
        for(MultipartFile m : files){
            originalFileName = m.getOriginalFilename();
            originalFileExtension = m.getOriginalFilename().substring(originalFileName.lastIndexOf("."));
            storedFileName = getRandomString() + originalFileExtension;

            file = new File(savePath + storedFileName);

            m.transferTo(file);

            listMap = new HashMap();
            listMap.put("prodNum", prodNum);
            listMap.put("contentdetail", storedFileName);
            list.add(listMap);
        }
        return e_p002DAO.upDateAddDetailImg(list,prodNum);
	}


	
	
	


}
