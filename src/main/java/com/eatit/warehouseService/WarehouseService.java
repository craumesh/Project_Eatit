package com.eatit.warehouseService;

import java.util.List;

import com.eatit.warehouseDomain.WarehouseVO;

public interface WarehouseService {
	
	// 창고 정보 리스트 가져오기
	public List<WarehouseVO> warehouseListAll();
}
