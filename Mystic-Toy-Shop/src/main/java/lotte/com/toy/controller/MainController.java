package lotte.com.toy.controller;

import lotte.com.toy.dto.AuthDto;
import lotte.com.toy.service.AuthService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    AuthService authService;

    @GetMapping("/main.do")
    public String main(HttpServletRequest req) {
        log.info("MainController main()");

        List<AuthDto> authList = authService.authList();
        req.getSession().setAttribute("userId",1);

//        for (AuthDto dto : list) {
//            System.out.println(dto.getAuth_role());
//        }

        return "main";
    }

}
