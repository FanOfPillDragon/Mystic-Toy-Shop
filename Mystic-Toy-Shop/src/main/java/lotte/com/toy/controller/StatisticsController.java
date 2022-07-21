package lotte.com.toy.controller;

import lotte.com.toy.dao.OrderStatsDao;
import lotte.com.toy.dto.OrderStatsDto;
import lotte.com.toy.dto.UserDto;
import lotte.com.toy.dto.WeeklyStatsDto;
import lotte.com.toy.service.OrderStatsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StatisticsController {
    Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    OrderStatsService orderStatsService;

    @GetMapping("/orderstats.do")
    public String OrderStatsDetail(HttpServletRequest req, Model model) {
        logger.info("StatisticsController OrderStatsService");


/*        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
            return "redirect:/userLogin.do";
        }*/

/*
        HttpSession session = req.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userLogin");

        System.out.println(userDto.getUser_email());*/
        // 세션 seller id, 오늘 날짜 넣기
        int sellerId = 1;
        String inputDate = "2022-07-19";
        OrderStatsDto today = orderStatsService.getOrderStatsByDate(sellerId, inputDate);
        OrderStatsDto week = orderStatsService.getOrderStatsWeek(sellerId);
        OrderStatsDto month = orderStatsService.getOrderStatsMonth(sellerId);

        List<OrderStatsDto> weeklyList = orderStatsService.getOrderStatsListWeekly(sellerId);

        List<OrderStatsDto> catTodayList = orderStatsService.getOrderStatsByCatsDate(sellerId, inputDate);
        List<OrderStatsDto> catWeekList = orderStatsService.getOrderStatsByCatsWeek(sellerId);
        List<OrderStatsDto> catMonthList = orderStatsService.getOrderStatsByCatsMonth(sellerId);

        List<WeeklyStatsDto> weeklyStatsDtoList = orderStatsService.getWeeklyAll(sellerId);

        model.addAttribute("today", today);
        model.addAttribute("week", week);
        model.addAttribute("month", month);

        model.addAttribute("weeklyList", weeklyList);

        model.addAttribute("catToday", catTodayList.get(0));
        model.addAttribute("catWeeks", catWeekList);
        model.addAttribute("catWeek", catWeekList.get(0));

        model.addAttribute("catMonth", catMonthList);

        model.addAttribute("weeklyStatsDtoList", weeklyStatsDtoList);

        return "orderstatistics";
    }

    @GetMapping("/userstats.do")
    public String CustomerStatsDetail(HttpServletRequest req, Model model) {
        logger.info("StatisticsController CustomerStatsDetail");
        System.out.println("StatisticsController CustomerStatsDetail");


        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        /*if (userDto == null) {
            return "redirect:/userLogin.do";
        }*/


        //System.out.println(userDto.getUser_email());

        // 세션 seller id
        //int sellerId = userDto.getUser_id();
        int sellerId = 1;
        List<OrderStatsDto> MostReviewedCat = orderStatsService.getMostReviewedCat(sellerId);
        List<OrderStatsDto> MostReviewedProduct = orderStatsService.getMostReviewedProduct(sellerId);
        List<OrderStatsDto> TopRatedProduct = orderStatsService.getTopRatedProduct(sellerId);

        model.addAttribute("MostReviewedCat", MostReviewedCat);
        model.addAttribute("MostReviewedProduct", MostReviewedProduct.get(0));
        model.addAttribute("MostReviewedProducts", MostReviewedProduct);

        model.addAttribute("TopRatedProduct", TopRatedProduct);

        return "customerstatistics";
    }

}
