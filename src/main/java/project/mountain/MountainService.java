package project.mountain;

import java.io.UnsupportedEncodingException;
import java.util.List;

public interface MountainService {
    MountainResponseVO getMountainInfo(String mtNm, String ArNm) throws UnsupportedEncodingException;
}
