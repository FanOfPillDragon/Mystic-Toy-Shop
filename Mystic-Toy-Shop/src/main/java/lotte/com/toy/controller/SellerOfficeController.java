package lotte.com.toy.controller;

import lotte.com.toy.dto.AuthDto;
import lotte.com.toy.dto.CategoryDto;
import lotte.com.toy.service.CategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class SellerOfficeController {

    private Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    CategoryService categoryservice;

    @GetMapping("/product_write.do")
    public String prodcut_write(Model model) {
        log.info("SellerOfficeController prodcut_write()");

        List<CategoryDto> categoryList = categoryservice.categoryList();
        model.addAttribute("categories", categoryList);

        return "product_write";
    }
}
