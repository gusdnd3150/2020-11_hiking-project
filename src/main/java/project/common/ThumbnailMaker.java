package project.common;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnails;

@Repository
public class ThumbnailMaker {

	public byte[] createThumbnail(MultipartFile mFile, int width, int height) throws IOException {

		InputStream in = mFile.getInputStream();
		BufferedImage orgImg = ImageIO.read(in);
		
	    // 원본 이미지의 width,height
       double getWidth = orgImg.getWidth();
       double getHeight = orgImg.getHeight();
        
        // 비율
       double resizeRatio = getWidth / getHeight;
       

       // 지정한 높이, 높이와 비율로 구한 너비  
       int mediumheight = 550;
       int mediumWidth = (int) (resizeRatio * height);
     
		//화질 깨져도 되면
		//BufferedImage buffThumbImg = Thumbnails.of(orgImg).size(width, height).asBufferedImage();
		//고화질 얻으려면
		BufferedImage buffThumbImg = Thumbnails.of(orgImg).size(mediumWidth, mediumheight).outputQuality(1.0f).outputFormat("png").asBufferedImage();

		//BurreredImage를 byte[] 형태로 바꿈
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(buffThumbImg, "png", baos);
		baos.flush();

		byte[] thumbImg = baos.toByteArray();
		

		in.close();
		baos.close();
		return thumbImg;

	}

}
