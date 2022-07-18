package lotte.com.toy.controller;

import lotte.com.toy.dto.CartDto;
import lotte.com.toy.service.CartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CartController {
    private Logger log = LoggerFactory.getLogger(CartController.class);

    @Autowired
    CartService cartService;

    @GetMapping("/cart.do")
    public String cartDetail(Model model) { //, int userId
        log.info("CartController cartDetail()");

        List<CartDto> cartList = cartService.getCartListByUserId(1);

        for (CartDto dto : cartList) {
            System.out.println(dto.toString());
        }

        model.addAttribute("cartList", cartList);

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
    public String cartDelete(CartDto cartDto) {
        log.info("CartController cartDelete()");
        String msg = "삭제 실패";

        if (cartService.deleteCartByCartId(cartDto)) {
            msg = "삭제 성공";
        }

        return msg;
    }
}
