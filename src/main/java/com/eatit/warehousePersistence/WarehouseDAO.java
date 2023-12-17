package com.eatit.warehousePersistence;

import java.util.List;

import com.eatit.warehouseDomain.WarehouseVO;

public interface WarehouseDAO {
	
	// 창고 정보 리스트 가져오기
	public List<WarehouseVO> getWarehouseListAll();
}
