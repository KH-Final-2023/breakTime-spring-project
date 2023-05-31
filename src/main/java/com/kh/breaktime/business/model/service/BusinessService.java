package com.kh.breaktime.business.model.service;



import com.kh.breaktime.business.model.vo.Business;


public interface BusinessService {

	
	public abstract Business loginBusiness(Business inputBusiness);
		
	public abstract int insertBusiness(Business inputBusiness);
}

