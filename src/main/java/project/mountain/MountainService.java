package project.mountain;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

public interface MountainService {
    MountainResponseVO get100MountainInfo(String mtNm, String ArNm) throws UnsupportedEncodingException;
    MountainResponseVO get100MountainImage(String mntiListNo) throws UnsupportedEncodingException;

    MountainResponseVO getMountainInfo(String searchWrd) throws UnsupportedEncodingException;
    MountainResponseVO getMountainImage(String mntiListNo) throws UnsupportedEncodingException;

    MountainResponseVO getTrailInfo(String searchWrd) throws UnsupportedEncodingException;

    List selectMountainByRank();
    List selectTrailByRank();

    int followMountainFunction(Map map);
    int followMountainCount(String mntilistno);
    String checkMtLike(Map map);

    void insertTrailInfo(Map map);
    void insertTrailLocation(Map map);
    void insertTrailSpot(Map map);

    List selectTrailLocation(Map map);
    List selectTrailInfo(Map map);
    List selectTrailSpot(Map map);
    List selectCourseByMNTN_CODE(Map map);
}
