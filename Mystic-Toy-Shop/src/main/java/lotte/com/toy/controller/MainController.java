package lotte.com.toy.controller;

import lotte.com.toy.dto.AuthDto;
import lotte.com.toy.dto.ProductResponseDto;
import lotte.com.toy.service.AuthService;
import lotte.com.toy.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainController {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    AuthService authService;

    @Autowired
    ProductService productService;

    @GetMapping("/main.do")
    public String main(Model model) {
        log.info("MainController main()");

        List<ProductResponseDto> productResponseDtoList = productService.getProductList();
        model.addAttribute("productResponseDtoList",productResponseDtoList);

        return "main";
    }

    @RequestMapping("**/favicon.ico")
    public String favIconForward(){
        return "/favicon.ico";
    }

    @RequestMapping("searchResult.do")
    public String findMainList(Model model,String productName){
        List<ProductResponseDto> searchResultList = productService.findMainList(productName);

        model.addAttribute("searchResultList",searchResultList);
        model.addAttribute("productName",productName);
        return "searchmainresult";
    }

    @RequestMapping("categoryResult.do")
    public String findProductByCategoryList(Model model, int categoryId){
        List<ProductResponseDto> findProductByCategoryListList = productService.getProductListByCategoryId(categoryId);
        System.out.println(findProductByCategoryListList.toString());
        model.addAttribute("findProductByCategoryListList",findProductByCategoryListList);
        model.addAttribute("categoryId", categoryId);
        return "categorymainresult";
    }

}
