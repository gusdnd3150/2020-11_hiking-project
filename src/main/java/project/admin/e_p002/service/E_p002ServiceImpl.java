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

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import project.admin.e_p002.dao.E_p002DAO;
import project.admin.e_p002.vo.E_p002VO;
import project.common.FileUtils;

@Service
@Transactional
public class E_p002ServiceImpl implements E_p002Service{
	
	@Autowired
	private E_p002DAO e_p002DAO;
	

	@Value("${sms.key}")
	private String api_key;

	@Value("${sms.secret}")
	private String api_secret;

	
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
	
	//중고요청 조회
	@Override
	public List searchUsedProd(Map<String, String> search) throws Exception {
		List list =  e_p002DAO.searchUsedProd(search);
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

	// 상품정보, 고객정보 (중고상세보기)
	@Override
	public List viewUsedList(Map map) throws Exception {
		List list = e_p002DAO.viewUsedList(map);
		return list;
	}

	//상품 옵션 (중고 상세보기)
	@Override
	public List viewUsedOptionList(int prodNum) throws Exception {
		List list = e_p002DAO.viewUsedOptionList(prodNum);
		return list;
	}

	//중고거래 취소 (취소사유등록 및 타입변환)
	@Override
	public int usedComment(Map map) throws Exception {
		return e_p002DAO.usedComment(map);
	}

	//중고거래 승인 (포인트지급 및 문자발송, 상품 상태 변환)
	@Override
	@Transactional
	public int insertPoint(Map map) throws Exception {
		
		String str = (String) map.get("point");
		String str1 = str.replace(",", "");
		int point = Integer.parseInt(str1);
		map.put("point", point);
		
		//포인트 지급
		int result =e_p002DAO.insertPoint(map);
		
		if(result !=0) {
			
			//상품 상태변환 (중고거래 승인)
			int prodNum = Integer.parseInt (map.get("prodNum").toString());	
			e_p002DAO.upDateProdType(prodNum); // 상품 옵션 수정
			e_p002DAO.upDateProdOptionType(prodNum); // 상품 옵션 수정(대기로 전환)
			
			//문자발송
			Message message = new Message(api_key, api_secret);
			HashMap<String, String> params = new HashMap<String, String>();

			params.put("to", (String) map.get("phone"));
			params.put("from", "01065130216");
			params.put("type", "SMS");
			params.put("text",map.get("userName")+"고객님 중고거래가 승인되어 포인트 "+map.get("point")+"원이 지급되었습니다.");
			System.out.println(map.get("userName")+"고객님 중고거래가 승인되어 포인트 "+map.get("point")+"원이 지급되었습니다.");
			params.put("app_version", "test app 1.2");

			try {
				JSONObject obj = (JSONObject) message.send(params);
				System.out.println(obj.toString()); // 전송 결과 출력
				
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
				
			}
			
		}
		return result;

	}

	//중고요청 카운트 알림
	@Override
	public String countUsed() throws Exception {
		return e_p002DAO.countUsed();
	}

	//금일 주문건 카운트
	@Override
	public String todayOrder(Map map) throws Exception {
		return e_p002DAO.todayOrder(map);
	}




}
