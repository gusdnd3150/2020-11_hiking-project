package project.admin.e_p003.service;

import java.util.HashMap;
import java.util.List; 
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import project.admin.e_p003.dao.E_p003DAO;
import project.admin.e_p003.vo.E_p003VO;

@Service
public class E_p003ServiceImpl implements E_p003Service{
	@Autowired
	private E_p003DAO e_p003DAO; 
	
	@Autowired // mail 콘텍스 xml에서 설정한 빈을 자동 주입한다.
	private JavaMailSender mailSender;

	//게시글 등록
	@Override
	public int addCSpost(Map map) throws Exception {
		return e_p003DAO.addCSpost(map);
	}


	@Override
	public List viewDetaList(int csPostNum) throws Exception {
		List viewDetaList = e_p003DAO.selectviewDetaList(csPostNum);
		return viewDetaList;
	}

	@Override
	public int upDateCsBoard(Map map) throws Exception {
		return e_p003DAO.upDateCsBoard(map);
	}

	@Override
	public int removeCsboard(int csPostNum) throws Exception {
		return e_p003DAO.deleteUserCsboard(csPostNum);
	}
	
	//메일발송
	@Override
	public int mailSending(Map<String, String> map) throws Exception {
		MimeMessage message = mailSender.createMimeMessage(); // MimeMessage타입 객체 생성
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8"); // 메일을 보내기위한 MimeMessageHelper객체 생성
			messageHelper.setFrom("bithiking168@gmail.com", "산오름 관리자"); //보내는 사람 
			messageHelper.setTo(map.get("userEmail")); // 받는사람 이메일
			messageHelper.setSubject(map.get("title")); // 제목
			messageHelper.setText(map.get("content")); // 내용
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}

	@Override
	public String viewType(int csPostNum) throws Exception {
			return e_p003DAO.viewType(csPostNum);
	}

	//조회
	@Override
	public List searchCsBoard(Map<String, String> search) throws Exception {
		List list = e_p003DAO.searchBoard(search);
		return list;
	}


	//문의글 카운트 알림
	@Override
	public String countBoard() throws Exception {
		return e_p003DAO.countBoard();
	}


	@Override
	public int mainPageMail(Map<String, String> map) throws Exception {
		
		MimeMessage message1 = mailSender.createMimeMessage(); // MimeMessage타입 객체 생성
		try {
			MimeMessageHelper emailMessag = new MimeMessageHelper(message1, true, "utf-8"); // 메일을 보내기위한 MimeMessageHelper객체 생성
			emailMessag.setFrom("bithiking168@gmail.com", "산오름 관리자"); //보내는 사람 
			emailMessag.setTo(map.get("email")); // 받는사람 이메일
			emailMessag.setSubject( map.get("subject")); // 제목
			emailMessag.setText( map.get("content")); // 내용
			mailSender.send(message1);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}


	//신고글 카운트 알림
	@Override
	public String countBoard300() throws Exception {
		return e_p003DAO.countBoard300();
	}

	

}
