package project.commu;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class CommuVO {
	
//	private List<Integer> BoardNumList;
//	private List<String> BoardNameList;
	
	
	public List<Integer> getBoardNumList() {
	 List<Integer> BoardNumList = new ArrayList<Integer>();
		BoardNumList.add(1);
		BoardNumList.add(2);
		BoardNumList.add(3);
		BoardNumList.add(4);
		BoardNumList.add(5);
		return BoardNumList;
	}
	
	public List<String> getBoardNameList() {
	 List<String> BoardNameList = new ArrayList<String>();
		BoardNameList.add("main");
		BoardNameList.add("calendar");
		BoardNameList.add("album");
		BoardNameList.add("files");
		BoardNameList.add("member");
		return BoardNameList;
	}

	
	
}
