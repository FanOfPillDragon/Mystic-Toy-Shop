package lotte.com.toy.controller;

import lotte.com.toy.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

    @Autowired
    MypageService mypageservice;

    @GetMapping("/mypage.do")
    public String mypage() {

        return "order";
    }

}
