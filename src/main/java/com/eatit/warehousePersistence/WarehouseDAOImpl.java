package com.eatit.warehousePersistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.eatit.memberDomain.MemberVO;
import com.eatit.warehouseDomain.StockInfoVO;
import com.eatit.warehouseDomain.WarehouseVO;

@Repository
public class WarehouseDAOImpl implements WarehouseDAO {
	
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseDAOImpl.class);
	private static final String NAMESPACE = "com.eatit.mapper.warehouseMapper.";
	
	@Inject
	private SqlSession sqlsession;

	@Override
	// 창고 정보 모두 가져오기
	public List<WarehouseVO> getWarehouseListAll() {
		return sqlsession.selectList(NAMESPACE+"getWarehouseListAll");
	}

	@Override
	// 회원 정보 모두 가져오기
	public List<MemberVO> getMemberListAll() {
		return sqlsession.selectList(NAMESPACE+"getMemberListAll");
	}

	@Override
	// 직책 정보 가져오기- ajax
	public List<String> getPositionName() {
		return sqlsession.selectList(NAMESPACE+"getPositionName");
	}

	@Override
	// 직책에 맞는 회원이름 가져오기- ajax
	public List<String> getMembersOfPosition(String position_name) {
		return sqlsession.selectList(NAMESPACE+"getMembersOfPosition", position_name);
	}
	
	@Override
	// 이름에 맞는 회원정보 가져오기- ajax
	public List<MemberVO> getMemberInfoByName(String name) {
		return sqlsession.selectList(NAMESPACE+"getMemberInfoByName", name);
	}

	@Override
	// 창고 정보 가져오기(main)
	public List<WarehouseVO> getWarehouseListMain() {
		return sqlsession.selectList(NAMESPACE+"getWarehouseMainList");
	}

	@Override
	// 특정 창고 정보 가져오기 - ajax
	public WarehouseVO getWarehouseInfo(WarehouseVO vo) {
		return sqlsession.selectOne(NAMESPACE+"getWarehouseInfo", vo);
	}

	@Override
	// 특정 창고 정보 가져오기(세션 아이디에 해당하는 회원정보)
	public MemberVO getWarehouseInfo(int no) {
		return sqlsession.selectOne(NAMESPACE+"getWarehouseAdminInfo", no);
	}

	@Override
	// 창고 등록
	public void insertWarehouse(WarehouseVO vo) {
		sqlsession.insert(NAMESPACE+"insertWarehouse", vo);
	}
	
	@Override
	// 창고 수정
	public void updateDetailInfo(WarehouseVO vo) {
		sqlsession.update(NAMESPACE+"updateDetailInfo", vo);
	}

	@Override
	// 창고 삭제
	public void deleteWarehouse(int[] warehouse_no) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("warehouse_no", warehouse_no);
		sqlsession.delete(NAMESPACE+"deleteWarehouse",paramMap);
	}

	@Override
	// 입출고 정보 테이블 모두 조회
	public List<StockInfoVO> getStockInfo() {
		logger.debug("dao - "+sqlsession.selectList(NAMESPACE+"getStockInfo"));
		return sqlsession.selectList(NAMESPACE+"getStockInfo");
	}
	
	@Override
	// 식별코드에 해당하는 입출고 정보 갯수(식별코드 존재 여부에 사용)
	public int countIdentifyCode(String identifyCode) {
		return sqlsession.selectOne(NAMESPACE+"countIdentifyCode",identifyCode);
	}

	@Override
	// 생산에 해당하는 완재품 정보 리스트 받아오기
	public List<StockInfoVO> getStockOfFinishedProduct() {
		return sqlsession.selectList(NAMESPACE+"getStockOfFinishedProduct");
	}


	@Override
	// 자재입고에 해당하는 완재품 정보 리스트 받아오기
	public List<StockInfoVO> getStockOfMaterial() {
		return sqlsession.selectList(NAMESPACE+"getStockOfMaterial");
	}

	@Override
	// 서비스에서 받아온 완재품 입고 정보를 테이블에 insert
	public void insertStockInfoList(StockInfoVO vo) {
		sqlsession.insert(NAMESPACE+"insertStockInfo", vo);
	}

	@Override
	// 창고재고 정보 갯수(창고 재고 존재 여부에 사용)
	public int countStock() {
		return sqlsession.selectOne(NAMESPACE+"countStock");
	}
	
	
	

}
