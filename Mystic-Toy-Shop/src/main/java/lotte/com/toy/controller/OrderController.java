package lotte.com.toy.controller;

import lotte.com.toy.dto.OrderDateDto;
import lotte.com.toy.dto.OrderDetailDto;
import lotte.com.toy.dto.OrderGroupDto;
import lotte.com.toy.dto.UserDto;
import lotte.com.toy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    OrderService orderService;

    @RequestMapping(value = "orderlist.do", method = RequestMethod.GET)
    public String findAllOrder(Model model, HttpServletRequest req){
        /*
        로그인 검증 코드 들어가야 함
         */
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }

        int userId = userDto.getUser_id();

        List<Integer> orderGroupList = orderService.findOrderGroupList();
        System.out.println(orderGroupList + " : dtoorderGroupList");
        if(orderGroupList.isEmpty()){
                System.out.println("데이터없음!");
            return "orderempty";
        }
        List<List<OrderDetailDto>> list = new ArrayList<>();
        for(Integer i : orderGroupList){
            List<OrderDetailDto> orderList = orderService.orderFindAll(new OrderGroupDto(userId,i));
            list.add(orderList);
        }
        model.addAttribute("orderList",list);
        model.addAttribute("orderGroupList",orderGroupList);
        return "order";
    }

    @RequestMapping(value = "orderDetail.do", method = RequestMethod.GET)
    public String findOrder(Model model, int orderId){
        OrderDetailDto order = orderService.orderFind(orderId);
        if(order == null){
            System.out.println("주문없음!!!!");
            return "order";
        }
        model.addAttribute("order",order);
        return "orderdetail";
    }

    @RequestMapping(value = "orderDateList.do", method = RequestMethod.GET)
    public String findDateOrderList(String startDate, String endDate,Model model,HttpServletRequest req){
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }

        int userId = userDto.getUser_id();

        Timestamp sDate = Timestamp.valueOf(startDate+" 00:00:00");
        Timestamp eDate = Timestamp.valueOf(endDate+" 00:00:00");
        OrderDateDto orderDate = new OrderDateDto(sDate,eDate,userId);
        List<Integer> orderDateGroup = orderService.findOrderGroupDateList(orderDate);
        if(orderDateGroup.isEmpty()){
            System.out.println("데이터없음!");
            return "orderempty";
        }
        List<List<OrderDetailDto>> dateList = new ArrayList<>();
        for(Integer i : orderDateGroup){
            List<OrderDetailDto> orderList = orderService.orderFindAll(new OrderGroupDto(userId,i));
            dateList.add(orderList);
        }
        model.addAttribute("dateList",dateList);
        model.addAttribute("orderDateGroup",orderDateGroup);
        return "orderdate";
    }
}
