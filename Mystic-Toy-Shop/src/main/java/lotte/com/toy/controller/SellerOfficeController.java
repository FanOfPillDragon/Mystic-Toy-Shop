package lotte.com.toy.controller;

import lotte.com.toy.dto.AuthDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class SellerOfficeController {

    private Logger log = LoggerFactory.getLogger(MainController.class);

    @GetMapping("/product_write.do")
    public String prodcut_write() {
        log.info("SellerOfficeController prodcut_write()");

        return "product_write";
    }
}
