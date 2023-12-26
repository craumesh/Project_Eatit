package com.eatit.warehouseController;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.eatit.memberDomain.MemberVO;
import com.eatit.warehouseDomain.WarehouseVO;
import com.eatit.warehouseService.WarehouseService;

@Controller
@RequestMapping(value="/warehouse/*")
public class WarehouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseController.class);
	
	@Inject
	private WarehouseService warehouseService;
	
	//http://localhost:8088/warehouse/warehouseMain
	// 창고메인
	@GetMapping(value = "/warehouseMain")
	public void warehouseMainGET(Model model,HttpSession session) {
		logger.debug("C - wareHouseMainGET() 호출");
		
		// 서비스 - 창고 리스트 가져오기(warehouseMain)
		List<WarehouseVO> warehouseListMain = warehouseService.warehouseListMain();
		logger.debug("@_@"+warehouseListMain);
		
		// ID 세션값 저장 확인
//		logger.debug("@_@"+session.getAttribute("no"));
//		logger.debug("@_@"+session.getAttribute("id"));
		
		
		// 데이터를 연결된 뷰페이지로 전달
		model.addAttribute("warehouseListMain", warehouseListMain);
	}
	
	// 창고등록
	@RequestMapping(value = "/warehouseRegist", method = RequestMethod.GET)
	public void warehouseModifyGET(@SessionAttribute("no") int no,Model model) {
		logger.debug("C - warehouseModifyGET()");
		logger.debug("no : "+ no);
		
		// 서비스 - 창고 등록 할 때 등록페이지에 로그인한 회원 정보 가져오기
		MemberVO warehouseInfo = warehouseService.warehouseInfo(no);
		logger.debug("@_@"+warehouseInfo);
		// 데이터를 연결된 뷰페이지로 전달
		model.addAttribute("warehouseAdminInfo", warehouseInfo);
	}
	
	@RequestMapping(value = "/warehouseRegist", method = RequestMethod.POST)
	public String warehouseModifyPOST(WarehouseVO vo) {
		logger.debug("C - warehouseModifyPOST()");
		logger.debug("vo : "+vo);
		
		// 서비스 - 창고 등록
		warehouseService.warehouseRegist(vo);
		
		return "redirect:/warehouse/warehouseMain";
	}
	
}
