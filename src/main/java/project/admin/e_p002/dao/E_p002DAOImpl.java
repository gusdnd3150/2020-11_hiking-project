package project.admin.e_p002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class E_p002DAOImpl implements E_p002DAO{
	
	 @Autowired
	    private SqlSession sqlSession;

	 //상품등록
	@Override
	public int insertProd(Map map) throws Exception {
		return sqlSession.insert("admin.mapper.e_p002.insertProd", map);
	}

	//상품 사진 등록
	@Override
	public int insertProdPhoto(List<Map> list) {
		 int result = 0;
	        int index = 1;
	        for(Map m : list){
	            m.put("pPhotoNum",index);
	            result = sqlSession.insert("admin.mapper.e_p002.insertProdPhoto", m);
	            index++;
	        }
	     return result;
	    
	}

	@Override
	public List<HashMap<String, String>> selectProd(Map<String, String> search) throws Exception {
		List<HashMap<String, String>> list= sqlSession.selectList("admin.mapper.e_p002.selectProd", search);
		return list;
	}

	@Override
	public int deleteProd(int prodNum) throws Exception {
		return sqlSession.delete("admin.mapper.e_p002.deleteProd",prodNum);
	}

}
