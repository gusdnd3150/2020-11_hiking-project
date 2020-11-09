package project.commu;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.Paging;
import project.after.AfterService;
import project.group.GroupService;
import project.groupmedia.GroupMediaService;
import project.user.service.UserService;
@Controller
@RequestMapping("/commu/*")
public class CommuController {

	
	public static final Logger logger = LoggerFactory.getLogger(CommuController.class);
	private static final String LOGIN = "LOGIN";

	@Value("${mountainImagePath}")
	private String mountainImagePath;

	@Autowired
	private CommuService commuService;

	@Autowired
	private GroupMediaService groupMediaService;

	@Autowired
	private UserService userService;

	@Autowired
	private GroupService groupService;

	@Autowired
	private AfterService afterService;

	@Transactional
	@PostMapping(value = "/insert.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> insertGroup(@RequestParam Map map,
			@RequestParam(value = "file", required = false) List<MultipartFile> files, HttpServletRequest request)
			throws Exception {
		Map<String, Object> m = commuService.insertGroup(map);

		String path = request.getSession().getServletContext().getRealPath("/");
		int groupNum = (int) map.get("groupNum");
		groupMediaService.insertGroupMedia(groupNum, files, path);

		return m;
	}

	@Transactional
	@PostMapping(value = "/update.do")
	@ResponseBody
	public void updateGroup(@RequestParam Map map,
			@RequestParam(value = "file", required = false) List<MultipartFile> file, HttpServletRequest request)
			throws Exception {
		commuService.updateGroup(map);
		for(MultipartFile m : file) {
			if (!m.isEmpty()) {
				String path = request.getSession().getServletContext().getRealPath("/");
				int groupNum = Integer.parseInt((String) map.get("groupNum"));
				groupMediaService.updateGroupMedia(groupNum, file, path);
			}
		}	
	}

	@GetMapping("/commuMainView.do")
	public ModelAndView commuMainView() {
		ModelAndView mav = new ModelAndView("commuMain");
//		List<Map> list = commuService.selectAllCommuList();
//		mav.addObject("commu", list);
		return mav;
	}

	@PostMapping("/selectAllCommuList.do")
	@ResponseBody
	public List<Map> selectAllCommuList(@RequestBody Map map) {
		System.out.println(map.toString());
		List<Map> list = commuService.selectAllCommuList(map);
		return list;
	}

	@RequestMapping(value = "/commuPageView.do")
	public ModelAndView commuPageView(@RequestParam("groupNum") int groupNum, HttpSession httpSession)
			throws Exception {
		ModelAndView mav = new ModelAndView("commuPage");
		if (groupNum == 0) {
			mav.setViewName("redirect:/commu/commuMain.do");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			String id = (String) httpSession.getAttribute(LOGIN);
			int userNum = userService.selectUserNum(id);
			map.put("id", id);
			map.put("groupNum", groupNum);
			map.put("userNum", userNum);
			List<Map> list = commuService.selectCommuPageInfo(map);
			int i = 1;
			for (Map m : list) {
				String s = "m" + i;
				//System.out.println(s + ">>>>>" + m);
				mav.addObject(s, m);
				i++;
			}
			List<Map> postList = commuService.selectCommuPosts(map);
			mav.addObject("postList", postList);

			int total = commuService.countAlbumPosts(map);
			Map<String, Object> vM = map;
			vM.put("total", total);
			mav.addObject("vM", vM);

			String sessionIdImage = groupService.selectSessionIdImage(id);
			mav.addObject("sessionIdImage", sessionIdImage);
		}
		return mav;
	}

	@RequestMapping(value = "/commuAlbumPaging.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<CommuVO> commuPageView(@RequestBody Map<String, Object> info, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> m = new HashMap<String, Object>();

		int nowPage = (int) info.get("nowPage");
		int cntPerPage = (int) info.get("cntPerPage");
		int total = (int) info.get("cntPerPage");
		int userNum = userService.selectUserNum((String) info.get("userId"));

		Paging vo = new Paging(total, nowPage, cntPerPage);
		m = info;
		m.put("userNum", userNum);
		m.put("start", vo.getStart());
		m.put("end", vo.getEnd());
		List<CommuVO> pList = commuService.selectPgAlbumPosts(m);

		return pList;
	}

	@Transactional
	@GetMapping("/updateBoardAccess.do")
	@ResponseBody
	public void updateBoardAccess(@RequestParam("groupNum") int groupNum,
			@RequestParam("boardAccess") int boardAccess) {
		try {
			commuService.updateBoardAccess(groupNum, boardAccess);

		} catch (Exception e) {
		}
	}
	
	@RequestMapping("/createFormView.do")
	public ModelAndView createFormView(ModelAndView mav) {
		mav.setViewName("createForm");
		return mav;
	}

	@Transactional
	@RequestMapping(value = "/insertPost.do")
	public ModelAndView insertPost(@RequestParam Map<String, Object> info, HttpServletResponse response, HttpServletRequest request, HttpSession httpSession) throws Exception {
		String id = (String) httpSession.getAttribute(LOGIN);
		int userNum = userService.selectUserNum(id);

		Pattern nonValidPattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		Map m = new HashMap();
		Map mm = new HashMap();
		//Enumeration enu = info.getParameterNames();

		int groupNum = Integer.parseInt((String) info.get("groupNum"));
		int type = 0;
		if (info.get("type") != null) {
			type = Integer.parseInt((String) info.get("type"));
			Map mmm = new HashMap();
			mmm.put("groupNum", groupNum);
			mmm.put("type", type);
			commuService.updatePostType(mmm);
		}

			Matcher matcher = nonValidPattern.matcher((String)info.get("feedContent"));
			while (matcher.find()) {
				String src = matcher.group(1);
				int i = matcher.group(1).lastIndexOf("/");
				String fileName = src.substring(i + 1);
				mm.put("groupNum", groupNum);
				mm.put("storedFileName", fileName);
				mm.put("userNum", userNum);
				commuService.insertAlbum2(mm);
			}
			
			m = info;
			m.put("userNum", userNum);
			m.put("type", type);
			commuService.insertPost(m);
			ModelAndView mav = new ModelAndView("redirect:commuPageView.do?groupNum=" + groupNum);
			return mav;
		}

	@Transactional
	@PostMapping(value = "/updatePost.do")
	public ModelAndView updatePost(@RequestParam Map<String, Object> info, HttpServletResponse response,
			HttpServletRequest request, HttpSession httpSession) throws Exception {
		System.out.println("커뮤 피드 작성하기: updatePost" +info);
		String id = (String) httpSession.getAttribute(LOGIN);
		int userNum = userService.selectUserNum(id);
		Map m = new HashMap();

		int groupNum = Integer.parseInt((String) info.get("groupNum"));
		int type = 0;
		if (info.get("type") != null) {
			type = Integer.parseInt((String) info.get("type"));
			Map mmm = new HashMap();
			mmm.put("groupNum", groupNum);
			mmm.put("type", type);
			commuService.updatePostType(mmm);
		}
		m = info;
		m.put("userNum", userNum);
		m.put("type", type);
		commuService.updatePost(m);
		System.out.println("커뮤 피드 작성하기????: updatePost" +m);
		ModelAndView mav = new ModelAndView("redirect:commuPageView.do?groupNum=" + groupNum);
		return mav;
	}

	@Transactional
	@PostMapping(value = "/insertAlbum.do", produces = "application/json")
	@ResponseBody
	public int insertAlbum(MultipartHttpServletRequest multipartRequest, HttpSession httpSession,
			HttpServletRequest request) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");

		List<MultipartFile> files = (List<MultipartFile>) multipartRequest.getFiles("pics");
		String id = (String) httpSession.getAttribute(LOGIN);
		int userNum = userService.selectUserNum(id);
		int groupNum = Integer.parseInt((String) multipartRequest.getParameter("groupNum"));

		Map<String, Object> m = new HashMap();
		m.put("userNum", userNum);
		String path = request.getSession().getServletContext().getRealPath("/");
		commuService.insertAlbum(groupNum, files, path, m);

		m.put("groupNum", groupNum);
		int total = commuService.countAlbumPosts(m);

		return total;
	}

	@GetMapping("/commu/searchByUserId.do")
	@ResponseBody
	public List selectCreatedCommu(@RequestParam("userId")String userId){
		List list = new ArrayList();
		list.add(commuService.selectCreatedCommu(userId));
		list.add(commuService.selectJoinedCommu(userId));

		System.out.println(list.toString());
		return list;
	}
	@GetMapping("/checkWriter.do")
	@ResponseBody
	public int checkWriter(@RequestParam String userId) {
		return userService.selectUserNum(userId);
	}

	@Transactional
	@GetMapping("/deletePost.do")
	@ResponseBody
	public int deletePost(@RequestParam int postNum) {
		int i = commuService.deletePost(postNum);
		return i;
	}

	@GetMapping(value = "/selectACommuPost.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String selectACommuPost(@RequestParam int postNum, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		String str = commuService.selectACommuPost(postNum);
		return str;
	}

	@PostMapping(value = "/selectMemberList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Map> selectMemberList(@RequestBody Map groupNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Map> rst = new ArrayList<Map>();
		rst = commuService.selectMemberList(groupNum);
		return rst;
	}

	@PostMapping(value = "/selectLeader.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> selectLeader(@RequestBody Map groupNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> rst = new HashMap<String, Object>();
		rst = commuService.selectLeader(groupNum);
		return rst;
	}

	@PostMapping(value = "/selectScheduleList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Map> selectScheduleList(@RequestBody Map groupNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Map> rst = new ArrayList<Map>();
		rst = commuService.selectScheduleList(groupNum);
		return rst;
	}

	@RequestMapping(value = "/commuSearch.do")
	public ModelAndView commuSearch(@RequestParam("groupNum") int groupNum, @RequestParam("keyword") String keyword,
			HttpSession httpSession) throws Exception {
		ModelAndView mav = new ModelAndView("commuPage");
		if (groupNum == 0) {
			mav.setViewName("redirect:/commu/commuMain.do");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			String id = (String) httpSession.getAttribute(LOGIN);
			int userNum = userService.selectUserNum(id);
			map.put("id", id);
			map.put("groupNum", groupNum);
			map.put("userNum", userNum);
			List<Map> list = commuService.selectCommuPageInfo2(map);
			int i = 1;
			for (Map m : list) {
				String s = "m" + i;
				mav.addObject(s, m);
				i++;
			}
			map.put("keyword", keyword);
			List<Map> postList = commuService.selectSearchPosts(map);
			mav.addObject("postList", postList);

			int total = commuService.countAlbumPosts(map);
			Map<String, Object> vM = map;
			vM.put("total", total);
			mav.addObject("vM", vM);

			String sessionIdImage = groupService.selectSessionIdImage(id);
			mav.addObject("sessionIdImage", sessionIdImage);
		}
		return mav;
	}
	
    @PostMapping("/commu/commuMandate.do")
    @ResponseBody
    public int commuMandate(@RequestBody Map map){
        return commuService.commuMandate(map);
    }

}
