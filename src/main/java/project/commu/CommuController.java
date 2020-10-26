package project.commu;

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

	@Transactional
	@PostMapping(value = "/insert.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> insertGroup(@RequestParam Map map,
			@RequestParam(value = "file", required = false) List<MultipartFile> files, HttpServletRequest request)
			throws Exception {
		System.out.println("컨트롤러에 들어온 맵:    " + map);
		Map<String, Object> m = commuService.insertGroup(map);

		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println("사진 경로" + path);
		int groupNum = (int) map.get("groupNum");
		groupMediaService.insertGroupMedia(groupNum, files, path);

		return m;
	}

	@Transactional
	@PostMapping(value = "/update.do")
	@ResponseBody
	public void updateGroup(@RequestParam Map map,
			@RequestParam(value = "file", required = false) List<MultipartFile> files, HttpServletRequest request)
			throws Exception {
		commuService.updateGroup(map);

		if (!files.isEmpty()) {
			String path = request.getSession().getServletContext().getRealPath("/");
			System.out.println("사진 경로" + path);
			int groupNum = Integer.parseInt((String) map.get("groupNum"));
			groupMediaService.updateGroupMedia(groupNum, files, path);
		}
	}

	@GetMapping("/commuMainView.do")
	public ModelAndView commuMainView() {
		ModelAndView mav = new ModelAndView("commuMain");
		List<Map> list = commuService.selectAllGroupList();
		mav.addObject("commu", list);
		return mav;
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
			System.out.println("userNum??"+ id);
			int userNum = userService.selectUserNum(id);
			map.put("id", id);
			map.put("groupNum", groupNum);
			map.put("userNum", userNum);
			List<Map> list = commuService.selectCommuPageInfo(map);
			int i = 1;
			for (Map m : list) {
				String s = "m" + i;
				 System.out.println(s + ">>>>>" + m);
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
		for (CommuVO cc : pList) {
		}

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

	@Transactional
	@RequestMapping(value = "/commu/insertPost.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertPost(MultipartHttpServletRequest multipartRequest, HttpServletResponse response,
			HttpServletRequest request, HttpSession httpSession) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String id = (String) httpSession.getAttribute(LOGIN);
		int userNum = userService.selectUserNum(id);

		Pattern nonValidPattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		Map m = new HashMap();
		Map mm = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();

		int groupNum = Integer.parseInt(multipartRequest.getParameter("groupNum"));
		int type = 0;
		if(multipartRequest.getParameter("type") != null) {
			type = Integer.parseInt(multipartRequest.getParameter("type")); 
			Map mmm = new HashMap();
			mmm.put("groupNum", groupNum);
			mmm.put("type", type);
			commuService.updatePostType(mmm);
		}
		
		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			Matcher matcher = nonValidPattern.matcher(value);
			String path = request.getSession().getServletContext().getRealPath("/");
			while (matcher.find()) {
				String src = matcher.group(1);
				int i = matcher.group(1).lastIndexOf("/");
				String fileName = src.substring(i + 1);
				mm.put("groupNum", groupNum);
				mm.put("storedFileName", fileName);
				mm.put("userNum", userNum);
				commuService.insertAlbum(mm);
			}
			m.put("userNum", userNum);
			m.put(name, value);
			m.put("type", type);
		}
		commuService.insertPost(m);
		ModelAndView mav = new ModelAndView("redirect:commuPageView.do?groupNum=" + groupNum);
		return mav;
	}

	@Transactional
	@PostMapping(value = "/commu/insertAlbum.do", produces = "application/json")
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
	
	@GetMapping("/commu/checkWriter.do")
    @ResponseBody
    public int checkWriter(@RequestParam String userId){
        return userService.selectUserNum(userId);
    }
	
	@Transactional
	@GetMapping("/commu/deletePost.do")
	@ResponseBody
	public int deletePost(@RequestParam int postNum){
		int i =  commuService.deletePost(postNum);
		 System.out.println("포스트 삭제 완룡:   "+i);
		return i;
	}
	
	
	@GetMapping(value="/commu/selectACommuPost.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String selectACommuPost(@RequestParam int postNum, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		String str = commuService.selectACommuPost(postNum);
	System.out.println("commuService.selectACommuPost(postNum):"+ str );
		return str;
	}


}
