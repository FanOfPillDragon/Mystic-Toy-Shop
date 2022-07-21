package lotte.com.toy.controller;

import lotte.com.toy.dto.CreateReviewDto;
import lotte.com.toy.dto.ReviewListDto;
import lotte.com.toy.dto.UserDto;
import lotte.com.toy.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @RequestMapping(value = "review.do")
    public String startReview(Model model, int productId){
        model.addAttribute("productId",productId);
        return "review";
    }

    @RequestMapping(value = "reviewAf.do")
    public String insertReview(HttpServletRequest req, int productId, String reviewTitle, String reviewContent, String reviewRate){
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }
        int userId = userDto.getUser_id();
        int IntreviewRate = Integer.parseInt(reviewRate); // 지울 것
        CreateReviewDto review = new CreateReviewDto(reviewTitle,reviewContent,userId,IntreviewRate,productId);
        boolean checker = reviewService.insertReview(review);
        if(checker){
            return "main";
        }
        return "main";
    }

    @RequestMapping(value = "findReviewList.do")
    public String findReviewList(Model model,int productId){
        List<ReviewListDto> reviews = reviewService.findReviewList(productId);
        model.addAttribute("reviews",reviews);
        return "reviewlist";
    }

}
