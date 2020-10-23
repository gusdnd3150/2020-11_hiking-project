package project.groupmedia;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GroupMediaDAO {

	@Autowired
	private SqlSession sqlSession;

	public void insertGroupMedia(List<Map> list) {
		int index = 0;
		for (Map m : list) {
			m.put("mediaNum", index);
			sqlSession.insert("groupMedia.insertGroupMedia", m);
			index++;
		}
	}

	public byte[] selectGroupMediaOne(int groupNum) {
		return sqlSession.selectOne("groupMedia.selectGroupMedia", groupNum);
	}

	public List<byte[]> selectGroupMediaDetail(int groupNum) {
		return sqlSession.selectList("groupMedia.selectGroupMediaDetail", groupNum);

	}

	//그룹 사진 수정
	public void updateGroupMedia(List<Map> list) {
		int index = 0;
		for (Map m : list) {
			m.put("mediaNum", index);
			sqlSession.insert("groupMedia.updateGroupMedia", m);
			index++;

		}
	}
}
