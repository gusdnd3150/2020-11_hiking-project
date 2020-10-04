package project.groupmedia;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface GroupMediaService {
    int insertGroupMedia(int result, List<MultipartFile> files, String path) throws IOException;
    byte[] selectGroupMediaOne(int groupNum);
    List<byte[]> selectGroupMediaDetail(int groupNum);
}
