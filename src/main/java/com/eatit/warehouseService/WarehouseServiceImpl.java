package com.eatit.warehouseService;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.warehouseDomain.WarehouseVO;
import com.eatit.warehousePersistence.WarehouseDAO;

@Service
public class WarehouseServiceImpl implements WarehouseService {
	
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseServiceImpl.class);
	
	@Inject
	private WarehouseDAO warehousedao;

	@Override
	public List<WarehouseVO> warehouseListAll() {
		logger.debug("S - warehouseListAll() 호출");
		
		return warehousedao.getWarehouseListAll();
	}
	
	
}
