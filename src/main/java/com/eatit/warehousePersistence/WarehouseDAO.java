package com.eatit.warehousePersistence;

import java.util.List;

import com.eatit.warehouseDomain.WarehouseVO;

public interface WarehouseDAO {
	
	// 창고 정보 모두 가져오기
	public List<WarehouseVO> getWarehouseListAll();
	
	// 창고 정보 가져오기(main)
	public List<WarehouseVO> getWarehouseListMain();
	
	// 특정 창고 정보 가져오기
	public List<WarehouseVO> getWarehouseInfo(int warehouse_no);
}
