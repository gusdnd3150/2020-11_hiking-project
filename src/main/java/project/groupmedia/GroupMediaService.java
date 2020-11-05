package project.groupmedia;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface GroupMediaService {
	
    void insertGroupMedia(int result, List<MultipartFile> files, String path) throws IOException;
    
    byte[] selectGroupMediaOne(int groupNum);
    
    List<byte[]> selectGroupMediaDetail(int groupNum);

    void updateGroupMedia(int groupNum, List<MultipartFile> files, String path) throws IOException;
}
