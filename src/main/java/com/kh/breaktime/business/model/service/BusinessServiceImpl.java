package com.kh.breaktime.business.model.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.business.model.dao.BusinessDao;
import com.kh.breaktime.business.model.vo.Business;




@Service
public class BusinessServiceImpl implements BusinessService{
	
	@Autowired // bean으로 등록된 객체중 같은 타입이 있을 경우 의존성(객체)를 주입해줌(DI)
	private BusinessDao businessDao;

	@Override
	public Business loginBusiness(Business inputBusiness) {
		
		Business loginUser = businessDao.loginBusiness(inputBusiness);
		
		return loginUser;
	}
	
	@Override
	public int insertBusiness(Business inputBusiness) {
		
		int result = businessDao.insertBusiness(inputBusiness);
		//파일 업로드(우리 서버에)
		
		/*
		 * MultipartFile f = inputBusiness.getF();
		 * 
		 * if(!f.isEmpty()) { //원래 이름 -> db에 저장 //변경된 이름 -> db에 저장 //서비스 레이어에서 작업하도록
		 * String changeName = System.currentTimeMillis()+"_"+f.getOriginalFilename();
		 * inputBusiness.setChangeName(changeName); //사이즈, 타입
		 * System.out.println("===============");
		 * System.out.println(f.getOriginalFilename()); System.out.println(f.getSize());
		 * System.out.println(f.getContentType());
		 * System.out.println("===============");
		 * 
		 * //파일을 톰캣에 저장 String path =
		 * req.getServletContext().getRealPath("/resources/uploadFiles/buMainImg/");
		 * //파일을 서버에 저장 //getREalPath == /spring999prjFinal/src/main/webapp // File file
		 * = new File("D:/uploadForSpring/999prj/profile/"+ changeName); File file = new
		 * File(path+ changeName); f.transferTo(file);
		 * 
		 * //db에 insert businessDao.uploadProfile(inputBusiness); }
		 * 
		 * return result; }
		 */
		return result;
	}
}
