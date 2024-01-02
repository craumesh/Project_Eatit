package com.eatit.MaterialController;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eatit.MaterialDomain.MaterialVO;
import com.eatit.MaterialService.MaterialService;

@Controller
@RequestMapping(value = "/Material/*")
public class MaterialController {
    
    private static final Logger logger = LoggerFactory.getLogger(MaterialController.class);

    @Inject
    private MaterialService MaterialService;

    // 원자재 목록 조회(GET)
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String materialListGET(Model model) {
        logger.debug("/Material/list 호출 -> materialListGET() 실행");
        model.addAttribute("Material", MaterialService.findAllMaterials());
        return "MaterialList"; // 원자재 목록을 보여주는 뷰 페이지
    }

    // 원자재 추가(GET)
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String MaterialAddGET() {
        logger.debug("/Material/add 호출 -> MaterialAddGET() 실행");
        return "MaterialAdd"; // 원자재 추가를 위한 뷰 페이지
    }

    // 원자재 추가(POST)
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String MaterialAddPOST(MaterialVO MaterialVO) {
        logger.debug("MaterialAddPOST() 호출");
        MaterialService.addMaterial(MaterialVO);
        return "redirect:/Material/list";
    }

 // 원자재 수정을 위한 매핑 메서드
    @RequestMapping(value = "/Material/update", method = RequestMethod.POST)
    public String updateMaterial(MaterialVO MaterialVO) {
        MaterialService.updateMaterial(MaterialVO);
        return "redirect:/Material";
    }

    // 원자재 삭제를 위한 매핑 메서드
    @RequestMapping(value = "/materials/delete", method = RequestMethod.POST)
    public String deleteMaterial(@RequestParam("id") Long id) {
        MaterialService.deleteMaterial(id);
        return "redirect:/materials";
    }
}
