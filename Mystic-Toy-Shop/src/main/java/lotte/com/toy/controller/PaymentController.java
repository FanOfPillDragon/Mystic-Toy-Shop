package lotte.com.toy.controller;

import lotte.com.toy.dto.*;
import lotte.com.toy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PaymentController {

    @Autowired
    CartService cartService;

    @Autowired
    ProductService productService;

    @Autowired
    PaymentService paymentService;

    @Autowired
    OrderService orderService;


    @RequestMapping(value = "ordersheet.do")
    public String startPayment(Model model, HttpServletRequest req){ // 임시test 코드
        //  필요한정보 user_id, product_id들
        List<Integer> orderCartNumList = new ArrayList<>();
        orderCartNumList.add(1);
        orderCartNumList.add(2);
        int id = (Integer)req.getSession().getAttribute("userId");
        List<CartDto> orderCartList = cartService.getCartListByUserId(id);
        List<ProdcutDto> orderProductList = new ArrayList<>();
        List<CartProductDto> cartProductList = new ArrayList<>();
        for(CartDto cart : orderCartList){
            ProdcutDto product = productService.findByProductId(cart.getProduct_id());
            cartProductList.add(new CartProductDto(id, product.getProduct_id(), product.getProduct_img(), product.getProduct_name(),product.getProduct_cost(),cart.getCart_quantity()));
        }

        model.addAttribute("cartProductList",cartProductList);
        return "payment";
    }

    @RequestMapping(value = "payment.do")
    public String createPayment(HttpServletRequest req, String orderName,String orderAddress,String orderPhone,String orderComment){
        int id = (Integer)req.getSession().getAttribute("userId");
        int orderGroup = orderService.findByOrderGroup();
        List<CartDto> orderCartList = cartService.getCartListByUserId(id);
        for(CartDto cart : orderCartList){
            ProdcutDto product = productService.findByProductId(cart.getProduct_id());
            OrderDto order = new OrderDto(orderName,orderAddress,orderPhone,orderComment,id,product.getProduct_id(),cart.getCart_quantity(),product.getProduct_cost(),orderGroup+1);
            boolean orderChecker = orderService.insertOrder(order);
            int orderId = orderService.findByLastRowId();
            PaymentDto payment = new PaymentDto(product.getProduct_id(),orderId,'0');
            boolean paymentChecker = paymentService.insertPayment(payment);
            if(!orderChecker&&!paymentChecker){
                return "redirect:/main.do";
            }
        }
        return "redirect:/main.do";
    }


}
