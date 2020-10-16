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
		 System.out.println("다오 photoNum"+photoNum);
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

	//상품 조회
//	@Override
//	public List<HashMap<String, String>> selectProd(Map<String, String> search) throws Exception {
//		List<HashMap<String, String>> list= sqlSession.selectList("admin.mapper.e_p002.selectProd", search);
//		return list;
//	}
	
	//상품조회
	@Override
	public List selectProd(Map search) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p002.selectProd", search);
		return list;
	}

	//상품 삭제
	@Override
	public int deleteProd(int prodNum) throws Exception {
		sqlSession.delete("admin.mapper.e_p002.deletePhoto",prodNum); //상품 이미지 삭제
		sqlSession.delete("admin.mapper.e_p002.deleteOtion",prodNum); // 상품 옵션 삭제
		return sqlSession.delete("admin.mapper.e_p002.deleteProd",prodNum); // 상품 삭제
	}

	//상품 상세 보기
	@Override
	public List viewProdList(int prodNum) throws Exception {
		List<E_p002VO> list = sqlSession.selectList("admin.mapper.e_p002.viewProdList", prodNum);
		System.out.println("다오 prodList사이즈: "+list.size());
		return list;
	}

	@Override
	public List viewPhotoList(int prodNum) throws Exception {
		
		List<E_p002VO> list = sqlSession.selectList("admin.mapper.e_p002.viewPhotoList", prodNum);
		for(int i=0; i<list.size(); i++) {
			
		}
		return list;
	}
	
	//상품 옵션 수정
	@Override
	public int updateOption(Map map) throws Exception {
		int result = sqlSession.update("admin.mapper.e_p002.updateOption", map);
		return result;
	}
	
	
	

	

	


}
