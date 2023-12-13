package com.eatit.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eatit.domain.ProductVO;
import com.eatit.service.MasterDataService;

@Controller
@RequestMapping(value="/masterdata/*")
public class MasterDataController {
   private static final Logger logger = LoggerFactory.getLogger(MasterDataController.class);
   
   @Inject
   private MasterDataService mdService;
   
   
// http://localhost:8088/masterdata/BomMain
   //BOM��������â������Ʈ�ѷ�
   @RequestMapping(value = "/BomMain",method = RequestMethod.GET)
	public void mainGET() {
		
	}
   //ǰ�����������Ʈ�ѷ�
   @RequestMapping(value = "/PIM",method = RequestMethod.POST)
 	public String PIMPOST(ProductVO pvo) {
	   logger.debug("pvo"+pvo);
	   
       mdService.productInsert(pvo);
       
       return "redirect:/masterdata/PIM";
 }
   
   
   
// http://localhost:8088/masterdata/PIM
   @RequestMapping(value="/PIM",method=RequestMethod.GET)
   public void productListGET(Model model) {
	   logger.debug(" /masterdata/PIM -> ProductListGet()");
	   model.addAttribute("productList", mdService.ProductList());
   }
   
 
}
