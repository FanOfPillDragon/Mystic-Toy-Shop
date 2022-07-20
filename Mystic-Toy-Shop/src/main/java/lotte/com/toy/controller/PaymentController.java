package lotte.com.toy.controller;

import lotte.com.toy.dto.*;
import lotte.com.toy.service.CartService;
import lotte.com.toy.service.OrderService;
import lotte.com.toy.service.PaymentService;
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

    @Autowired
    PaymentService paymentService;

    @Autowired
    OrderService orderService;


    @RequestMapping(value = "ordersheet.do")
    public String startPayment(Model model, HttpServletRequest req) {

        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }

        int userId = userDto.getUser_id();
        List<CartDto> orderCartList = cartService.getCartListByUserId(userId);
        List<ProductDto> orderProductList = new ArrayList<>();
        List<CartProductDto> cartProductList = new ArrayList<>();

        for (CartDto cart : orderCartList) {
            ProductDto product = productService.findByProductId(cart.getProduct_id());
            cartProductList.add(new CartProductDto(userId, product.getProduct_id(), product.getProduct_img(), product.getProduct_name(), product.getProduct_cost(), cart.getCart_quantity()));
        }

        model.addAttribute("cartProductList", cartProductList);

        return "payment";
    }

    @RequestMapping(value = "payment.do")
    public String createPayment(HttpServletRequest req, String orderName, String orderAddress, String orderPhone, String orderComment) {
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        int userId = userDto.getUser_id();
        int orderGroup = orderService.findByOrderGroup();
        List<CartDto> orderCartList = cartService.getCartListByUserId(userId);
        for (CartDto cart : orderCartList) {
            ProductDto product = productService.findByProductId(cart.getProduct_id());
            OrderDto order = new OrderDto(orderName, orderAddress, orderPhone, orderComment, userId, product.getProduct_id(), cart.getCart_quantity(), product.getProduct_cost(), orderGroup + 1);
            boolean orderChecker = orderService.insertOrder(order);
            int orderId = orderService.findByLastRowId();
            PaymentDto payment = new PaymentDto(product.getProduct_id(), orderId, '0');
            boolean paymentChecker = paymentService.insertPayment(payment);
            if (!orderChecker && !paymentChecker) {
                return "redirect:/main.do";
            }
        }
        return "redirect:/main.do";
    }

    @GetMapping("/orderbyproduct.do")
    public String orderByProductId(Model model, int productId, int quantity) {
        ProductDto productDto = productService.findByProductId(productId);

        model.addAttribute("productId", productId);

        String msg = "재고 부족으로 현재 선택하신 수량만큼 구매할 수 없습니다";
        if (productDto.getProduct_stock() < quantity) {
            model.addAttribute("msg", msg);

            return "payMessage";
        }

        model.addAttribute("productDto", productDto);
        model.addAttribute("quantity", quantity);

        return "orderByProduct";
    }

    @RequestMapping(value = "singlepayment.do")
    public String createSinglePayment(HttpServletRequest req, String orderName, String orderAddress, String orderPhone, String orderComment, int productId, int quantity) {
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        int userId = userDto.getUser_id();
        int orderGroup = orderService.findByOrderGroup();
        ProductDto product = productService.findByProductId(productId);
        OrderDto order = new OrderDto(orderName, orderAddress, orderPhone, orderComment, userId, product.getProduct_id(), quantity, product.getProduct_cost(), orderGroup + 1);
        boolean orderChecker = orderService.insertOrder(order);
        int orderId = orderService.findByLastRowId();
        PaymentDto payment = new PaymentDto(product.getProduct_id(), orderId, '0');
        boolean paymentChecker = paymentService.insertPayment(payment);
        if (!orderChecker && !paymentChecker) {
            return "redirect:/main.do";
        }
        return "redirect:/main.do";
    }
}
