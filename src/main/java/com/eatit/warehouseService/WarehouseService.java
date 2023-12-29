package com.eatit.warehouseService;

import java.util.List;

import com.eatit.memberDomain.MemberVO;
import com.eatit.warehouseDomain.WarehouseVO;

public interface WarehouseService {
	
	// 창고 정보 리스트 가져오기(All)
	public List<WarehouseVO> warehouseListAll();
	
	// 창고 정보 가져오기(main)
	public List<WarehouseVO> warehouseListMain();
	
	// 특정 창고 정보 가져오기
	public WarehouseVO warehouseInfo(WarehouseVO vo);
	
	// 창고 등록 할 때 등록페이지에 로그인한 회원 정보 가져오기
	public MemberVO warehouseInfo(int no);
	
	// 창고 등록 
	public void warehouseRegist(WarehouseVO vo);
	
	// 창고 삭제
	public void deleteWarehouse(List warehouse_no);
}
