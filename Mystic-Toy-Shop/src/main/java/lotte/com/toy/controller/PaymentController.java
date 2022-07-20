package lotte.com.toy.controller;

import lotte.com.toy.dto.CartDto;
import lotte.com.toy.dto.CartProductDto;
import lotte.com.toy.dto.ProdcutDto;
import lotte.com.toy.dto.UserDto;
import lotte.com.toy.service.CartService;
import lotte.com.toy.service.OrderService;
import lotte.com.toy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String startPayment(Model model, HttpServletRequest req) { // 임시test 코드
        //  필요한정보 user_id, product_id들
        List<Integer> orderCartNumList = new ArrayList<>();
        orderCartNumList.add(1);
        orderCartNumList.add(2);
        UserDto userDto = (UserDto) req.getSession().getAttribute("login");
        int userId = userDto.getUser_id();
        List<CartDto> orderCartList = cartService.getCartListByUserId(userId);
        List<ProdcutDto> orderProductList = new ArrayList<>();
        List<CartProductDto> cartProductList = new ArrayList<>();
        for (CartDto cart : orderCartList) {
            ProdcutDto product = productService.findByProductId(cart.getProduct_id());
            cartProductList.add(new CartProductDto(product.getProduct_img(), product.getProduct_name(), product.getProduct_cost(), cart.getCart_quantity()));
        }

        model.addAttribute("cartProductList", cartProductList);

        return "payment";
    }


    @RequestMapping(value = "payment.do")
    public String createPayment() {

        return "";
    }

    @GetMapping("/orderbyproduct.do")
    public String orderByProductId(Model model, int productId, int quantity) {
        ProdcutDto prodcutDto = productService.findByProductId(productId);

        model.addAttribute("productId", productId);

        String msg = "재고 부족으로 현재 선택하신 수량만큼 구매할 수 없습니다";
        if (prodcutDto.getProduct_stock() < quantity) {
            model.addAttribute("msg", msg);

            return "payMessage";
        }

        model.addAttribute("prodcutDto", prodcutDto);
        model.addAttribute("quantity", quantity);

        return "orderByProduct";
    }


}