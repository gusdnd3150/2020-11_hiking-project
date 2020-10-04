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

    public int insertGroupMedia(List<Map> list){
        int result = 0;
        int index = 0;
        for(Map m : list){
            m.put("mediaNum",index);
            result = sqlSession.insert("groupMedia.insertGroupMedia", m);
            index++;
        }
        return result;
    }

    public byte[] selectGroupMediaOne(int groupNum){
        return sqlSession.selectOne("groupMedia.selectGroupMedia",groupNum);
    }

    public List<byte[]> selectGroupMediaDetail(int groupNum){
        return sqlSession.selectList("groupMedia.selectGroupMediaDetail", groupNum);

    }
}
