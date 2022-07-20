package lotte.com.toy.controller;

import lotte.com.toy.dto.SellerDto;
import lotte.com.toy.dto.UserDto;
import lotte.com.toy.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

@Controller
public class UserController {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    UserService service;

    //    회원가입
    @GetMapping("/signup.do")
    public String signup() {
        log.info("MemberController signup()");
        return "signup";
    }
    //    로그인
    @GetMapping("/login.do")
    public String login() {
        log.info("MemberController login()");
        return "login";
    }

    //    유저 로그인
    @GetMapping("/userLogin.do")
    public String userLogin() {
        log.info("MemberController userLogin()");
        return "userLogin";
    }

    @PostMapping("/userLoginAf.do")
    public String userLoginAf(HttpServletRequest req, UserDto dto, HttpSession session) {
        log.info("MemberController userLoginAf()");
        UserDto rDto = service.userLogin(dto);
        if (rDto != null) {
            req.getSession().setAttribute("login", rDto);
            session.setAttribute("login", rDto);
            return "redirect:/main.do";
        } else {
            return "userLogin";
        }
    }

    //    유저 회원가입 view
    @GetMapping("/userSignup.do")
    public String userSignup() {
        log.info("MemberController userSignup()");
        return "userSignup";
    }

    //    유저 아이디 체크
    @ResponseBody
    @PostMapping("/userIdCheck.do")
    public String getUserId(String user_id) {
        log.info("MemberController getUserId()");
        String str = service.getUserId(user_id);
        return str;
    }

    //    유저 회원가입 추가
    @PostMapping("/addUser.do")
    public String addUser(Model model, UserDto dto) {
        log.info("MemberController addUser()");

        boolean b = service.addUser(dto);

        model.addAttribute("msg", b);
        model.addAttribute("process", "login");

        return "userLogin";
    }

    //    판매자 로그인
    @GetMapping("/sellerLogin.do")
    public String sellerLogin() {
        log.info("MemberController sellerLogin()");
        return "sellerLogin";
    }

    @PostMapping("/sellerLoginAf.do")
    public String sellerLoginAf(HttpServletRequest req, SellerDto dto) {
        log.info("MemberController sellerLoginAf()");
        System.out.println(dto.getSeller_email() + " " + dto.getSeller_password());
        SellerDto rDto = service.sellerLogin(dto);
        if (rDto != null) {
            req.getSession().setAttribute("sellerLogin", rDto);
            return "redirect:/main.do";
        } else {
            return "sellerLogin";
        }
    }

    //    판매자 회원가입 view
    @GetMapping("/sellerSignup.do")
    public String sellerSignup() {
        log.info("MemberController sellerSignup()");
        return "sellerSignup";
    }

    //    판매자 아이디 체크
    @ResponseBody
    @PostMapping("/sellerIdCheck.do")
    public String getSellerId(String seller_id) {
        log.info("MemberController getSellerId()");
        String str = service.getSellerId(seller_id);
        return str;
    }

    //    판매자 회원가입 추가
    @PostMapping("/addSeller.do")
    public String addSeller(Model model, SellerDto dto, HttpServletRequest req) {
        log.info("MemberController addSeller()");
        boolean b = service.addSeller(dto);

        model.addAttribute("msg", b);
        model.addAttribute("process", "login");

        return "sellerLogin";
    }
}
