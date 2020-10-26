package project.mountain;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

public interface MountainService {
    MountainResponseVO get100MountainInfo(String mtNm, String ArNm) throws UnsupportedEncodingException;
    MountainResponseVO get100MountainImage(String mntiListNo) throws UnsupportedEncodingException;

    MountainResponseVO getMountainInfo(String searchWrd) throws UnsupportedEncodingException;
    MountainResponseVO getMountainImage(String mntiListNo) throws UnsupportedEncodingException;

    List selectMountainByRank();
    int followMountainFunction(Map map);
    int followMountainCount(String mntilistno);
    String checkMtLike(Map map);
}
