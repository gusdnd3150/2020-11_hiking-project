package project.admin.e_p002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.admin.e_p002.vo.E_p002VO;

@Repository
public class E_p002DAOImpl implements E_p002DAO{
	
	 @Autowired
	private SqlSession sqlSession;

	 //상품등록
	@Override
	public int insertProd(Map map) throws Exception {
		return sqlSession.insert("admin.mapper.e_p002.insertProd", map);
	}
	//상풍등록시 카테고리 등록
	@Override
	public void insertcategory(Map<String, Object> categoryMap) throws Exception {
		sqlSession.insert("admin.mapper.e_p002.insertcategory",categoryMap);		
	}

	//상품 메인 사진  등록
	@Override
	public int insertProdPhoto(List<Map> list) {
		 int result = 0;
	        int index = 1;
	        for(Map m : list){
	            m.put("pPhotoNum",index);
	            result = sqlSession.insert("admin.mapper.e_p002.insertProdPhoto", m);
	            index++;
	        }
	     return index;
	}
	
	//상품 디테일 사진 등록
	@Override
	public int insertPhotoDetail(List<Map> list2,int photoNum) {
		
		 int result = 0;
	        int index = photoNum;
	        for(Map m2 : list2){
	            m2.put("pPhotoNum",index);
	            result =  sqlSession.insert("admin.mapper.e_p002.insertPhotoDetail", m2); 
	            index++;
	        }
	     return result;
	}
	
	//상품 옵션 등록
	@Override
	public int insertProdOption(List<Map<String, Object>> optionListMap) throws Exception {
		return sqlSession.insert("admin.mapper.e_p002.insertProdOption", optionListMap);
	}

	//상품조회
	@Override
	public List selectProd(Map search) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p002.selectProd", search);
		return list;
	}
	
	//상품 옵션 수정 (사이즈, 색상, 재고) 데이터테이블 안에서 사용
	@Override
	public int updateOption(Map map) throws Exception {
		int result = sqlSession.update("admin.mapper.e_p002.updateOption", map);
		return result;
	}
	
	//상품 옵션 수정 (상세페이지)
	@Override
	public int updateDateProdOption(Map map) throws Exception {
		int result = sqlSession.update("admin.mapper.e_p002.updateDateProdOption", map);
		return result;
	}
	
	//상품 수정 (상세페이지)
	@Override
	public int updateDateProd(Map map) throws Exception {
		int result = sqlSession.update("admin.mapper.e_p002.updateDateProd", map);
		return result;
	}
	
	//상품 상세페이지 메인 이미지
	@Override
	public List viewPhotoMainList(int prodNum) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p002.viewPhotoMainList", prodNum);
		return list;
	}
	
	//상품 상세페이지 디테일이미지
	@Override
	public List viewPhotoDetail(int prodNum) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p002.viewPhotoDetail", prodNum);
		return list;
	}
	
	//상품 상세페이지 상품 정보
	@Override
	public List viewProdList(int optionNum) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p002.viewProdList", optionNum);
		return list;
	}
	
	//상세페이지 상단 고정값 
	@Override
	public List viewList(int optionNum) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p002.viewList", optionNum);
		return list;
	}
	
	//상세페이지 메인이미지 수정
	@Override
	public int upDateMainPhoto(Map map) {	
	    int result = sqlSession.update("admin.mapper.e_p002.upDateMainPhoto",map); 
	     return result;
	}
	
	//상세페이지 디테일이미지 수정
	@Override
	public int upDateDetailPhoto(Map map) {
		 int result = sqlSession.update("admin.mapper.e_p002.upDateDetailPhoto",map); 
	     return result;
	}
	
	//상세페이지 이미지 선택 삭제
	@Override
	public int deleteImg(Map map) throws Exception {
		 int result = sqlSession.delete("admin.mapper.e_p002.deleteImg",map); 
	     return result;
	}
	
	//상세페이지 메인 이미지 추가
	@Override
	public int upDateAddMainImg(List<Map<String, Object>> list, int prodNum) {
		
		 int result = 0;
	     int index = sqlSession.selectOne("admin.mapper.e_p002.selectMaxNum", prodNum);
	     index+=1;
	     for(Map m : list){
	          m.put("pPhotoNum",index);
	          result =  sqlSession.insert("admin.mapper.e_p002.upDateAddMainImg", m); 
	          index++;
	     }
	  return result;
	}
	
	//상세 페이지 디테일 이미지 추가
	@Override
	public int upDateAddDetailImg(List<Map<String, Object>> list, int prodNum) {
		
		int result = 0;
        int index = sqlSession.selectOne("admin.mapper.e_p002.selectMaxNum", prodNum);
        index+=1;
        for(Map m : list){
            m.put("pPhotoNum",index);
            result =  sqlSession.insert("admin.mapper.e_p002.upDateAddDetailImg", m); 
            index++;
        }
     return result;
	}
	
	//중고품 요청 조회
	@Override
	public List searchUsedProd(Map<String, String> search) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p002.searchUsedProd",search );
		return list;
	}
	//고객정보, 상품점보(증고상세보기)
	@Override
	public List viewUsedList(Map map) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p002.viewUsedList",map);
		return list;
	}
	//상품옵셥(중고 상세보기)
	@Override
	public List viewUsedOptionList(int prodNum) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p002.viewUsedOptionList",prodNum);
		return list;
	}
	
	//중고거래 취소 (취소사유등록 및 타입 변화)
	@Override
	public int usedComment(Map map) throws Exception {
		return sqlSession.update("admin.mapper.e_p002.usedComment", map);
	}
	
	//중고거래 승인 (포인트 지급)
	@Override
	public int insertPoint(Map map) throws Exception {
		return sqlSession.insert("admin.mapper.e_p002.insertPoint", map);
	}
	
	//중고거래 승인 (상품 타입 변화)
	@Override
	public void upDateProdType(int prodNum) throws Exception {
	  sqlSession.update("admin.mapper.e_p002.upDateProdType", prodNum);
		
	}
	
	//중고요청 카운트 알림
	@Override
	public String countUsed() throws Exception {
		return sqlSession.selectOne("admin.mapper.e_p002.countUsed");
	}
	
	//금일주문건 카운트
	@Override
	public String todayOrder(Map map) throws Exception {
		return sqlSession.selectOne("admin.mapper.e_p002.todayOrder",map);
	}
	
}
