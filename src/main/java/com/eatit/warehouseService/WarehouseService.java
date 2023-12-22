package com.eatit.warehouseService;

import java.util.List;

import com.eatit.warehouseDomain.WarehouseVO;

public interface WarehouseService {
	
	// 창고 정보 리스트 가져오기(All)
	public List<WarehouseVO> warehouseListAll();
	
	// 창고 정보 가져오기(main)
	public List<WarehouseVO> warehouseListMain();
	
	// 특정 창고 정보 가져오기
	public WarehouseVO warehouseInfo(WarehouseVO vo);
	
}
