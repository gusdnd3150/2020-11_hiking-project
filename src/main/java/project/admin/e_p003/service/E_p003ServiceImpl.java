package project.admin.e_p003.service;

import java.util.List; 
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import project.admin.e_p003.dao.E_p003DAO;
import project.admin.e_p003.vo.E_p003VO;

import javax.mail.internet.MimeMessage;

@Service
public class E_p003ServiceImpl implements E_p003Service{
	@Autowired
	private E_p003DAO e_p003DAO; 
	
	@Autowired // mail 콘텍스 xml에서 설정한 빈을 자동 주입한다.
	private JavaMailSender mailSender;

	@Override
	public int addCSpost(E_p003VO e_p003VO) throws Exception {
		return e_p003DAO.insertCSpost(e_p003VO);
	}

	@Override
	public List searchCsBoard(Map<String, String> search) throws Exception {
		 List csBoardList = e_p003DAO.selectCsBoard(search);
		return csBoardList;
	}

	@Override
	public List viewDetaList(int csPostNum) throws Exception {
		List viewDetaList = e_p003DAO.selectviewDetaList(csPostNum);
		return viewDetaList;
	}

	@Override
	public int upDateCsBoard(E_p003VO e_p003VO) throws Exception {
		return e_p003DAO.upDateCsBoard(e_p003VO);
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
			messageHelper.setFrom("seokhg0216@gmail.com", "산오름 관리자"); //보내는 사람 
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

}
