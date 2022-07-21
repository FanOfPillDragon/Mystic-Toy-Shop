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

        List<ProductResponseDto> mainList = productService.getProductListForMain();
        model.addAttribute("mainList",mainList);

        return "main";
    }

    @RequestMapping("**/favicon.ico")
    public String favIconForward(){
        return "/favicon.ico";
    }


}
