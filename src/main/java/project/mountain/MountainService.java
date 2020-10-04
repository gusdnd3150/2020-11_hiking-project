package project.mountain;

import java.io.UnsupportedEncodingException;
import java.util.List;

public interface MountainService {
    MountainResponseVO get100MountainInfo(String mtNm, String ArNm) throws UnsupportedEncodingException;
    MountainResponseVO getMountainInfo(String searchWrd) throws UnsupportedEncodingException;
    MountainResponseVO getMountainImage(String mntiListNo) throws UnsupportedEncodingException;
}
