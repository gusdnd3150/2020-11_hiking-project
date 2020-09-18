package project.E_P002_D003.file;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImgBlobDao {
	@Autowired
	private SqlSession query;

	public void saveImage1(Map<String, Object> hmap) {
		query.insert("project.e_P002_D003.saveImage1",hmap);
	}
	public void saveImage2(Map<String, Object> hmap) {
		query.insert("project.e_P002_D003.saveImage2",hmap);
	}
	public void saveImage3(Map<String, Object> hmap) {
		query.insert("project.e_P002_D003.saveImage3",hmap);
	}
	public void saveImage4(Map<String, Object> hmap) {
		query.insert("project.e_P002_D003.saveImage4",hmap);
	}
	
	
   /*
	public Map<String, Object> getByteImage() {
		return query.selectOne("project.e_P002_D003.getByteImage");
	}*/
}
