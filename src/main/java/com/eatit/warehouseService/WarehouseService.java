package com.eatit.warehouseService;

import java.util.List;
import java.util.Map;

import com.eatit.mainDomain.Criteria;
import com.eatit.memberDomain.MemberVO;
import com.eatit.warehouseDomain.StockInfoVO;
import com.eatit.warehouseDomain.StockVO;
import com.eatit.warehouseDomain.WarehouseVO;

public interface WarehouseService {
	
	// 창고 정보 리스트 가져오기(All)
	public List<WarehouseVO> warehouseListAll();
	
	// 회원 정보 리스트 가져오기(All)
	public List<MemberVO> memberListAll();
	
	// 직책 정보 리스트 가져오기- ajax
	public List<String> memberGetPositionName();
	
	// 직책에 해당하는 회원이름 리스트 가져오기- ajax
	public List<String> getMembersOfposition(String position_name);
	
	// 이름에 해당하는 회원정보 리스트 가져오기 - ajax
	public List<MemberVO> getMemberInfoByName(String name);
	
	// 창고 정보 가져오기(main)
	public List<WarehouseVO> warehouseListMain();
	
	// 특정 창고 정보 가져오기 - ajax
	public WarehouseVO warehouseInfo(WarehouseVO vo);
	
	// 창고 등록 할 때 등록페이지에 로그인한 회원 정보 가져오기
	public MemberVO warehouseInfo(int no);
	
	// 창고 등록 
	public void warehouseRegist(WarehouseVO vo);
	
	// 창고 수정
	public void warehouseUpdate(WarehouseVO vo);
	
	// 창고 삭제
	public void deleteWarehouse(int[] warehouse_no);
	
	//------------------------------------------------------------------------------------//
	// 창고 재고 정보 현황에 필요한 정보 조회
	public void getStockList();
	
	// 창고 재고 정보 페이징(검색어, 필터x)
	public List<StockInfoVO> getStockInfoList(Criteria cri);
	
	// 창고 재고 정보 페이징(검색어, 필터0)
	public List<StockInfoVO> findStockInfoList(Map<String, Object> params);
	
	// 창고 재고
	public int getTotalCount();
	
	// 창고 재고 정보 갯수(검색어, 필터0)
	public int getFindCount(Map<String, Object> params);
	
	// 창고 승인 처리
	public void stockApprovalProcess(StockInfoVO infoVO);
	
	// 창고 취소 처리
	public void stockCancelProcess(String[] identifyCode);
	
	// 창고 조회
	public List<StockVO> stockListALL(); 
}
