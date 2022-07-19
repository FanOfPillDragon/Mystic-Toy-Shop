package lotte.com.toy.controller;

import lotte.com.toy.dto.CartDto;
import lotte.com.toy.dto.CartUserProductDto;
import lotte.com.toy.dto.UserDto;
import lotte.com.toy.service.CartService;
import lotte.com.toy.util.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class CartController {
    private Logger log = LoggerFactory.getLogger(CartController.class);

    @Autowired
    CartService cartService;

    @GetMapping("/cart.do")
    public String cartDetail(Model model, HttpServletRequest req, HttpServletResponse response) throws IOException { //, int userId
        log.info("CartController cartDetail()");

        UserDto userDto = (UserDto)req.getSession().getAttribute("login");
        if(userDto == null){
            response.sendRedirect("/userLogin.do");
            return "userLogin";
        }
        int userId = userDto.getUser_id();

        List<CartUserProductDto> cartUserProductDtoList = cartService.getCartUserProductDtoByUserId(userId);

        model.addAttribute("cartUserProductDtoList", cartUserProductDtoList);
        model.addAttribute("totalPrice", Utility.getTotalPrice(cartUserProductDtoList));
        return "cartdetail";
    }

    @ResponseBody
    @GetMapping("/cartinsert.do")
    public String cartInsert(CartDto cartDto) {
        log.info("CartController cartInsert()");

        String msg = "삽입 실패";

        if (cartService.insertCart(cartDto)) {
            msg = "삽입 성공";
        }

        return msg;
    }

    @ResponseBody
    @GetMapping("/cartupdate.do")
    public String cartUpdate(CartDto cartDto) {
        log.info("CartController cartUpdate()");
        String msg = "수정 실패";

        if (cartService.updateCart(cartDto)) {
            msg = "수정 성공";
        }

        return msg;
    }

    @ResponseBody
    @GetMapping("/cartdelete.do")
    public String cartDelete(int cartId) {
        log.info("CartController cartDelete()");
        String msg = "삭제 실패";

        if (cartService.deleteCartByCartId(cartId)) {
            msg = "삭제 성공";
        }

        return msg;
    }
}
