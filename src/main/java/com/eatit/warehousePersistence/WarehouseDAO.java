package com.eatit.warehousePersistence;

import java.util.List;

import com.eatit.memberDomain.MemberVO;
import com.eatit.warehouseDomain.WarehouseVO;

public interface WarehouseDAO {
	
	// 창고 정보 모두 가져오기
	public List<WarehouseVO> getWarehouseListAll();
	
	// 창고 정보 가져오기(main)
	public List<WarehouseVO> getWarehouseListMain();
	
	// 특정 창고 정보 가져오기
	public WarehouseVO getWarehouseInfo(WarehouseVO vo);
	
	// 특정 창고 정보 가져오기(세션 아이디에 해당하는 회원정보)
	public MemberVO getWarehouseInfo(int no);
	
	// 창고 등록
	public void insertWarehouse(WarehouseVO vo);
}
