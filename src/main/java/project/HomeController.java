package project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import project.admin.e_p003.service.E_p003ServiceImpl;
import project.after.AfterService;
import project.board.BoardService;
import project.commu.CommuService;
import project.group.GroupService;
import project.search.SearchService;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@EnableSwagger2
public class HomeController {

	@Resource(name = "groupService")
	private GroupService groupService;

	@Resource(name = "afterService")
	private AfterService afterService;

	@Resource(name = "commuService")
	private CommuService commuService;

	@Resource(name = "boardService")
	private BoardService boardService;

	@GetMapping("/main.do")
	public String home() {
		return "home";
	}

	@GetMapping("/main/groupList.do")
	@ResponseBody
	public List mainGroupList(){
		return groupService.selectMainGroupList();
	}

	@GetMapping("/main/afterList.do")
	@ResponseBody
	public List mainAfterList(){
		return afterService.selectMainAfterList();
	}

	@GetMapping("/main/commuList.do")
	@ResponseBody
	public List mainCommuList(@RequestParam("keyword")String keyword,
							  @RequestParam("rowNum")int rowNum) {
		Map map = new HashMap<>();
		map.put("keyword",keyword);
		map.put("rowNum",rowNum);
		return commuService.selectAllCommuList(map);
	}

	@GetMapping("/main/noticeList.do")
	@ResponseBody
	public List mainNoticeList() throws Exception {
		Map map = new HashMap();
		map.put("csPostType",100);
		map.put("rowNum",1);
		return boardService.selectBoard(map);
	}

	//메인 등산모임 search
	@GetMapping("/main/search.do")
	public ModelAndView mainSearch(@RequestParam("keyword")String keyword){
		ModelAndView mav = new ModelAndView("/group/searchMain");
		mav.addObject("keyword",keyword);
		return mav;
	}
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminHome() {
		return "admin_home";
	}
}
