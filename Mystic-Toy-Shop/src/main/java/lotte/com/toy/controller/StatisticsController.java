package lotte.com.toy.controller;

import lotte.com.toy.dao.OrderStatsDao;
import lotte.com.toy.dto.OrderStatsDto;
import lotte.com.toy.service.OrderStatsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class StatisticsController {
    Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    OrderStatsService orderStatsService;

    @GetMapping("/orderstats.do")
    public String OrderStatsDetail(Model model) {
        logger.info("StatisticsController OrderStatsService");
        System.out.println("StatisticsController OrderStatsService");

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

        model.addAttribute("today", today);
        model.addAttribute("week", week);
        model.addAttribute("month", month);

        model.addAttribute("weeklyList", weeklyList);

        model.addAttribute("catToday", catTodayList.get(0));
        model.addAttribute("catWeek", catWeekList);
        model.addAttribute("catMonth", catMonthList);


        return "orderstatistics";
    }
}
