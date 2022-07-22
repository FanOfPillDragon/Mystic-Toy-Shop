package lotte.com.toy.controller;

import lotte.com.toy.dto.CategoryDto;
import lotte.com.toy.dto.ProductResponseDto;
import lotte.com.toy.service.CategoryService;
import lotte.com.toy.service.ProductService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class ProductController {

    private Logger log = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    CategoryService categoryservice;

    @Autowired
    ProductService productService;

    @GetMapping("/productList.do")
    public String productList(Model model) {
        log.info("ProductController productList()");

        List<ProductResponseDto> productResponseDtoList = productService.getProductListForMain();
        model.addAttribute("productResponseDtoList", productResponseDtoList);

        return "productList";
    }

    @GetMapping("/productDetail.do")
    public String productDetail(Model model, int productId) {
        log.info("ProductController productDetail()");

        ProductResponseDto productResponseDto = productService.getProductByProductId(productId);
        model.addAttribute("productResponseDto", productResponseDto);

        return "productDetail";
    }

    @RequestMapping(value = "/productDelete.do", method = RequestMethod.POST)
    @ResponseBody
    public String productDel(@RequestParam(value = "productIdList[]") ArrayList<Integer> product_id) {

        JSONObject jsonObject = new JSONObject();
        boolean isSuccess = productService.product_delete(product_id);

        String msg = "";
        if (isSuccess) {
            jsonObject.put("responseCode", "success");
            msg = jsonObject.toString();
            return msg;
        }
        return msg;
    }
}
