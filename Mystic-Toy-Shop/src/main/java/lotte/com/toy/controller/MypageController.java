package lotte.com.toy.controller;

import lotte.com.toy.dto.UserDto;
import lotte.com.toy.dto.UserUpdateName;
import lotte.com.toy.dto.UserUpdatePassword;
import lotte.com.toy.dto.UserUpdatePhone;
import lotte.com.toy.service.CartService;
import lotte.com.toy.service.MypageService;
import lotte.com.toy.service.OrderService;
import lotte.com.toy.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MypageController {

    @Autowired
    MypageService mypageservice;

    @Autowired
    CartService cartService;

    @Autowired
    PaymentService paymentService;

    @Autowired
    OrderService orderService;

    @GetMapping("/mypage.do")
    public String mypage() {

        return "order";
    }

    @RequestMapping(value = "updateUserInfo.do")
    public String startUpdateUserInfo(HttpServletRequest req){
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }
        return "updateUserInfo";
    }

    @RequestMapping(value = "updateUserInfoAf.do", method = RequestMethod.POST)
    public String UpdateUserInfo(HttpServletRequest req, Model model, String userName,String userPhone,String userPassword){
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }

        UserUpdateName userUpdateName = new UserUpdateName(userDto.getUser_id(),userName);
        UserUpdatePhone userUpdatePhone = new UserUpdatePhone(userDto.getUser_id(),userPhone);
        boolean check2 = mypageservice.updateUserPhone(userUpdatePhone);
        boolean check3 = mypageservice.updateUserName(userUpdateName);
        if(userPassword != null){
            UserUpdatePassword userUpdatePassword = new UserUpdatePassword(userDto.getUser_id(),userPassword);
            boolean check1 = mypageservice.updateUserPassword(userUpdatePassword);
            if(!check1||!check2||!check3){
                return "redirect:mypage.do";
            }
        }
        if(!check2||!check3){
            return "redirect:mypage.do";
        }

        return "redirect:main.do";
    }

    @RequestMapping(value = "deleteUserInfo.do")
    public String deleteUser(HttpServletRequest req){
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }
        boolean cartCheck = cartService.deleteCartByUserId(userDto.getUser_id());
        boolean paymentCheck = paymentService.deletePaymentByOrderId(userDto.getUser_id());
        boolean orderCheck = orderService.deleteOrderByUserId(userDto.getUser_id());
        boolean check = mypageservice.deleteUser(userDto.getUser_id());
        if(!check){
            return "redirect:mypage.do";
        }
        return "redirect:main.do";
    }

}
