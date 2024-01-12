package com.eatit.productionPersistence;

import java.util.List;

import com.eatit.businessDomain.OrdersVO;
import com.eatit.machineDomain.machineVO;
import com.eatit.mainDomain.Criteria;
import com.eatit.productionDomain.masterdata_informationVO;
import com.eatit.productionDomain.productionVO;
import com.eatit.productionDomain.productionhistoryVO;
import com.eatit.warehouseDomain.StockVO;

public interface productionDAO {
	
	

	// 설비 페이징 처리 갯수
	public int machinetotalCount();
	

	// 설비 상세 조회
	public List<machineVO> machinelistall(Criteria cri);
	
	// 생산 완료
	public void productionhistory(productionhistoryVO vo);
	
	// 발주서 조회
	public List<OrdersVO> selectOrderList(Criteria cri);

	// 레시피 조회
	public String recipe(Integer product_no);
	
	// 자재 조회
	public List<masterdata_informationVO> category();
	
	// 이름 으로 조회한 제품 번호
	public masterdata_informationVO nameproduct_no(String name);
	
	// 이름 으로 조회한 창고 정보
	public StockVO stockname(String name);
	
}