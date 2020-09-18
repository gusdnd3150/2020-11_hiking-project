package project.E_P002_D003.file;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class imgBlobController {
	
	@Autowired
	private ImgBlobDao dao;
	
	@RequestMapping(value="/E_P002_D003/saveImage.do")
	public String saveImage(E_P002_D003PhotoVO vo, 
			MultipartHttpServletRequest file //업로드로온 요청은 여기서 다 받는다
			,HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Map<String,MultipartFile> test = file.getFileMap();
		//List <MultipartFile> getFiles =  (List<MultipartFile>) file.getFileNames();
		//System.out.println("파일 개수 :"+ test.size());
		//System.out.println("총개수 :"+ getFiles.size());
		//System.out.println("Dd이름"+getFiles.get(0).getOriginalFilename());
		//System.out.println("Dd이름"+getFiles.get(1).getOriginalFilename());
		//System.out.println("Dd이름"+getFiles.get(2).getOriginalFilename());
		//Dd이름교환_거시기해_천인누_Baram19081917260701.jpg
		//Dd이름교환_거시기해_돌아왔다이기_Baram19082019551901.jpg
		//Dd이름교환_거시기해_천인누_Baram19081917221300.jpg
		
		Map<String,Object> hmap = new HashMap<String,Object>();
		/*hmap.put("CONTENT1", vo.getCONTENT1().getBytes());
		hmap.put("PPHOTONUM", vo.getPPHOTONUM());
		System.out.println("vo:"+vo.getPPHOTONUM());
		dao.saveImage1(hmap);*/
		if (test.size() ==1) {
			try {
				hmap.put("CONTENT1", vo.getCONTENT1().getBytes());
				dao.saveImage1(hmap);
				return "redirect:view";
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("실패");
				return "redirect:view";
			}
		}else if (test.size()==2) {
			try {
				hmap.put("CONTENT1", vo.getCONTENT1().getBytes());
				hmap.put("CONTENT2", vo.getCONTENT2().getBytes());
				dao.saveImage1(hmap);
				dao.saveImage2(hmap);
				return "redirect:view";
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("실패");
				return "redirect:view";
			}
			
		}else if (test.size()==3) {
			try {
				hmap.put("CONTENT1", vo.getCONTENT1().getBytes());
				hmap.put("CONTENT2", vo.getCONTENT2().getBytes());
				hmap.put("CONTENT3", vo.getCONTENT3().getBytes());
				dao.saveImage1(hmap);
				dao.saveImage2(hmap);
				dao.saveImage3(hmap);
				return "redirect:view";
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("실패");
				return "redirect:view";
			}
			
		}else if (test.size()==4) {
			try {
				hmap.put("CONTENT1", vo.getCONTENT1().getBytes());
				hmap.put("CONTENT2", vo.getCONTENT2().getBytes());
				hmap.put("CONTENT3", vo.getCONTENT3().getBytes());
				hmap.put("CONTENT4", vo.getCONTENT4().getBytes());
				dao.saveImage1(hmap);
				dao.saveImage2(hmap);
				dao.saveImage3(hmap);
				dao.saveImage4(hmap);
				return "redirect:view";
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("실패");
				return "redirect:view";
			}
		}
		return "redirect:view";
	}
	/*
	 * @RequestMapping(value = "/view") public String view() { return
	 * "imgblob/view"; }
	 */
	
    /*@RequestMapping(value ="/getByteImage")
	public ResponseEntity<byte[]> getByteImage(){
		Map<String,Object> map = dao.getByteImage();
		byte[] imageContent = (byte[])map.get("img");
		
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent,headers,HttpStatus.OK);
	}*/
	
	
	

}
