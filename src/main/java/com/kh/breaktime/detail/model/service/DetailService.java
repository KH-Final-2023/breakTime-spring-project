package com.kh.breaktime.detail.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.breaktime.detail.model.vo.CategoryCode;

public interface DetailService {

    public ArrayList<CategoryCode> selectCategoryCodeList();

    public void selectDetailList(String category, Map<String, Object> map);

    public void getFilteredData(String category, List<String> prices, List<String> reserves, List<String> options, Map<String, Object> map);
    
    public void getAreaData(String category, String area, Map<String, Object> map);

    public void searchDetailList(Map<String, Object> paramMap, Map<String, Object> map);
    
    public void selectAreaList(String areaNo, Map<String, Object> map);
}

