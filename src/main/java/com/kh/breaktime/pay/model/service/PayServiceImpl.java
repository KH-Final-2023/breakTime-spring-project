package com.kh.breaktime.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.pay.model.dao.PayDAO;



@Service
public class PayServiceImpl implements PayService {

	@Autowired // bean으로 등록된 객체중 같은 타입이 있을 경우 의존성(객체)를 주입해줌(DI)
	private PayDAO payDao;
	


}
