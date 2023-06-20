package com.kh.breaktime.detail.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.detail.model.dao.DetailDAO;
import com.kh.breaktime.detail.model.vo.AreaCode;
import com.kh.breaktime.detail.model.vo.CategoryCode;
import com.kh.breaktime.detail.model.vo.Detail;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailDAO detailDao;

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<CategoryCode> selectCategoryCodeList() {
		return detailDao.selectCategoryCodeList();
	}

	public void selectDetailList(String category, String area, Map<String, Object> map) {
		ArrayList<Detail> list = detailDao.selectDetailList(category, area);
		map.put("list", list);
	}

	public void filterListSubmit(String category, List<String> prices, List<String> reserves, List<String> options,
			Integer guests, String area, String date_in, String date_out, Double userStarScore, Map<String, Object> map) {
		ArrayList<Detail> list = detailDao.filterListSubmit(category, prices, reserves, options, area, date_in,
				date_out, userStarScore, guests);
		map.put("list", list);
	}

	public void searchDetailList(Map<String, Object> paramMap, Map<String, Object> map) {
		ArrayList<Detail> list = detailDao.searchDetailList(paramMap);
		map.put("list", list);
	}

	public void selectAreaList(String areaNo, Map<String, Object> map) {
		ArrayList<AreaCode> list = detailDao.selectAreaList(areaNo);
		map.put("list", list);
	}

}