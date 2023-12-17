package com.eatit.warehouseController;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eatit.warehouseDomain.WarehouseVO;
import com.eatit.warehouseService.WarehouseService;

@Controller
@RequestMapping(value="/warehouse/*")
public class WarehouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private WarehouseService warehouseService;
	
	//http://localhost:8088/warehouse/warehouseMain
	@GetMapping(value = "/warehouseMain")
	public void wareHouseMainGET(Model model) {
		logger.debug("C - wareHouseMainGET() 호출");
		
		// 서비스 - 창고 리스트 가져오기
		List<WarehouseVO> warehouseList = warehouseService.warehouseListAll();
		logger.debug("@_@"+warehouseList);
		
		// 데이터를 연결된 뷰페이지로 전달
		model.addAttribute("warehouseList", warehouseList);
	}
}
