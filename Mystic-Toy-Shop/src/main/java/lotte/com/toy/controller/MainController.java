package lotte.com.toy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @GetMapping("/main.do")
    public String main(){
        log.info("MainController main()");
        return "main";
    }

}
