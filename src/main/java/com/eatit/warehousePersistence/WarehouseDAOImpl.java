package com.eatit.warehousePersistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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
		logger.debug("DAO - getWarehouseListAll() 호출");
		return sqlsession.selectList(NAMESPACE+"getWarehouseListAll");
	}

	@Override
	// 창고 정보 가져오기(main)
	public List<WarehouseVO> getWarehouseListMain() {
		logger.debug("DAO - getWarehouseListAll() 호출");
		return sqlsession.selectList(NAMESPACE+"getWarehouseMainList");
	}

	@Override
	// 특정 창고 정보 가져오기
	public List<WarehouseVO> getWarehouseInfo(int warehouse_no) {
		logger.debug("DAO - getWarehouseInfo(int warehouse_no)");
		return sqlsession.selectOne(NAMESPACE+"getWarehouseInfo", warehouse_no);
	}
	
	

}
