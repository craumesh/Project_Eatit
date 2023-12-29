package com.eatit.orderController;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eatit.orderDomain.ProductVO;
import com.eatit.orderDomain.PurchaseVO;
import com.eatit.orderService.PurchaseService;

@Controller
@RequestMapping(value = "/purchaseOrder/*")
public class PurchaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseController.class);
	
	@Inject
	private PurchaseService pService;
	
	// 발주 신청 - GET
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public void purchaseWriteFormGET() throws Exception {
		
		logger.debug("/purchase/writeForm/purchaseWriteFormGET() 호출");
		logger.debug("/purchase/writeForm.jsp 페이지 이동");
		
	}
	
	// 발주 신청 - POST
	@RequestMapping(value = "/writeForm", method = RequestMethod.POST)
	public String purchaseWriteFormPOST(PurchaseVO pvo) throws Exception {
		
		logger.debug("/purchase/writeForm/purchaseWriteFormPOST() 호출");
		
		// 전달 정보 저장, 확인
		logger.debug("pvo: " + pvo);
		
		// 서비스 - 신청서 작성 동작 호출(INSERT)
		pService.createPurchaseOrder(pvo);
		logger.debug("신청서 작성 완료");
		
		// 페이지 이동
		logger.debug("/purchase/orderList 페이지 이동");
		return "redirect:/purchaseOrder/orderList";
	}
	
	// 발주 내역 조회 - GET
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderListGET(Model model, @ModelAttribute("result") String result, HttpSession session) throws Exception {
		
		logger.debug("/purchase/orderListGET() 호출");
		
		session.setAttribute("viewcntCheck", true);
		
		// 서비스 - DB에서 저장된 신청 내역 가져오기(SELECT)
		List<PurchaseVO> purchaseVOList = pService.orderList();
		logger.debug("orderList: " + purchaseVOList);
		
		// 데이터 전달
		model.addAttribute(purchaseVOList);
		
		return "/purchaseOrder/orderList";
	}
	
	// 발주 내역 상세 조회 - GET
	@RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
	public void orderDetailGET(@RequestParam("order_id")int order_id, Model model) throws Exception {
		
		logger.debug("/purchase/orderDetailGET() 호출");
		
		// 전달 정보 저장(order_id)
		logger.debug("order_id: " + order_id);
		
		// 서비스 - 주문 번호에 해당하는 주문 상세 내역 조회
		PurchaseVO purchaseVO = pService.getOrderDetail(order_id);
		
		// 페이지 이동 시 정보 전달
		model.addAttribute(purchaseVO);
	}
	
	// 발주서 수정 - POST
	@RequestMapping(value = "/editForm", method = RequestMethod.POST)
	public String editFormPOST(PurchaseVO pvo, RedirectAttributes rttr) throws Exception {
		
		logger.debug("/purchase/editFormPOST() 호출");
		
		// 수정할 정보 확인
		logger.debug("pvo: " + pvo);
		
		// 서비스 - 신청서 수정 동작 호출(UPDATE)
		pService.editForm(pvo);
		rttr.addFlashAttribute("result", "modifyOK");
		
		return "redirect:/purchaseOrder/orderList";
	}
	
	// 발주서 삭제 - POST
	@RequestMapping(value = "/cancelForm", method = RequestMethod.POST)
	public String cancelFormPOST(@RequestParam("order_id")int order_id) throws Exception {
		
		logger.debug("/purchase/cancelFormPOST() 호출");
		
		// 서비스 - 발주서 삭제 동작 호출(DELETE)
		pService.cancelForm(order_id);
		
		return "redirect:/purchaseOrder/orderList";
	}
	
	// 상품 검색 - GET
	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public String searchProductGET(Model model) throws Exception {
		
		logger.debug("Controller: /purchaseOrder/searchProductGET()");
		logger.debug("searchProduct.jsp");
		
		// 서비스 - 기준 정보 상품 가져오기
		List<ProductVO> productVOList = pService.productList();
		logger.debug("productList: " + productVOList);
		
		// 데이터 전달
		model.addAttribute(productVOList);
		
		return "/purchaseOrder/searchProduct";
	}
	
}
