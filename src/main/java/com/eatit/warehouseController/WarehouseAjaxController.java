package com.eatit.warehouseController;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.eatit.warehouseDomain.WarehouseVO;
import com.eatit.warehouseService.WarehouseService;

@RestController
public class WarehouseAjaxController {

	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private WarehouseService warehouseService;
	
	@RequestMapping(value = "/warehouseContent", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public WarehouseVO wareContentGET(WarehouseVO vo, Model model) {
		logger.debug("C - wareContentGET() 실행 ");
		logger.debug("vo : "+vo);
		
		// 서비스
		return warehouseService.warehouseInfo(vo);
	}
	
}
