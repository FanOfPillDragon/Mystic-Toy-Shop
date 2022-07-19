package lotte.com.toy.controller;

import lotte.com.toy.dto.CartDto;
import lotte.com.toy.dto.ProdcutDto;
import lotte.com.toy.service.CartService;
import lotte.com.toy.service.OrderService;
import lotte.com.toy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PaymentController {

    @Autowired
    CartService cartService;

    @Autowired
    ProductService productService;

    @RequestMapping(value = "ordersheet.do")
    public String startPayment(Model model, HttpServletRequest req){ // 임시test 코드
        //  필요한정보 user_id, product_id들
        List<Integer> orderCartNumList = new ArrayList<>();
        orderCartNumList.add(1);
        orderCartNumList.add(2);
        int id = (Integer)req.getSession().getAttribute("userId");
        List<CartDto> orderCartList = cartService.getCartListByUserId(id);
        List<ProdcutDto> orderProductList = new ArrayList<>();
        for(CartDto cart : orderCartList){
            orderProductList.add(productService.findByProductId(cart.getProduct_id()));
        }

        model.addAttribute("orderProductList",orderCartList);
        model.addAttribute("orderProductList",orderProductList);
        return "payment";
    }


    @RequestMapping(value = "payment.do")
    public String createPayment(){

        return "";
    }
}
