package lotte.com.toy.controller;

import lotte.com.toy.dao.QnaDao;
import lotte.com.toy.dto.*;
import lotte.com.toy.service.CartService;
import lotte.com.toy.service.ProductService;
import lotte.com.toy.service.QnaService;
import lotte.com.toy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class QnaController {

    @Autowired
    QnaService qnaService;

    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    @RequestMapping(value = "qna.do")
    public String startQna(Model model, int productId){
        model.addAttribute("productId",productId);
        return "qna";
    }
    @RequestMapping(value = "qnaAf.do")
    public String insertQna(HttpServletRequest req, int productId, String qnaTitle, String qnaContent){
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }
        QnaSheetDto qna = new QnaSheetDto(qnaTitle,qnaContent,userDto.getUser_id(),productId);
        System.out.println(qna);
        boolean checker = qnaService.insertQna(qna);
        if(checker){
            return "main";
        }
        return "main";
    }

    @RequestMapping(value = "findQnaList.do")
    public String findQnaList(Model model,int productId){
        List<QnaListDto> qnas = qnaService.findQnaList(productId);
        ProductResponseDto productResponseDto = productService.getProductByProductId(productId);
        model.addAttribute("productResponseDto",productResponseDto);
        model.addAttribute("qnas",qnas);
        return "qnalist";
    }
}
