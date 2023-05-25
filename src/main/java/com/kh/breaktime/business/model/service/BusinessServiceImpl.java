package com.kh.breaktime.business.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
