package lotte.com.toy.controller;

import lotte.com.toy.dto.CategoryDto;
import lotte.com.toy.service.CategoryService;
import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

@Controller
public class SellerOfficeController {

    private Logger log = LoggerFactory.getLogger(SellerOfficeController.class);

    @Autowired
    CategoryService categoryservice;

    @GetMapping("/product_write.do")
    public String prodcut_write(Model model) {
        log.info("SellerOfficeController prodcut_write()");
        System.out.println("SellerOfficeController prodcut_write");

        List<CategoryDto> categoryList = categoryservice.categoryList();
        model.addAttribute("categories", categoryList);

        return "product_write";
    }

    @ResponseBody
/*    @PostMapping(value="/uploadSummernoteImageFile.do", produces = "application/json")*/
    @RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST} )
    public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
        log.info("uploadSummernoteImageFile ");
        System.out.println("SellerOfficeController uploadSummernoteImageFile");
        System.out.println("muitipartFile:" + multipartFile );


        JSONObject jsonObject = new JSONObject();

        String fileRoot = "C:\\mystic_image\\";	//저장될 외부 파일 경로
        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자

        System.out.println("1");
        System.out.println(originalFileName);
        System.out.println(extension);
        String savedFileName = UUID.randomUUID() + extension;	// 파일 이름 중복 방지 저장될 파일 명

        System.out.println(savedFileName);
        File targetFile = new File(fileRoot + savedFileName);

        System.out.println("2");
        try {
            InputStream fileStream = multipartFile.getInputStream();
            System.out.println("3");
/*            FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장*/
            FileUtils.writeByteArrayToFile(targetFile, multipartFile.getBytes());
            System.out.println("4");
            jsonObject.put("url","/mystic_image/"+savedFileName);
            System.out.println("5");
            jsonObject.put("responseCode", "success");

        } catch (IOException e) {
            System.out.println("오류");
            FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
            jsonObject.put("responseCode", "error");
            e.printStackTrace();
        }
        System.out.println(jsonObject.toString());
        String a = jsonObject.toString();

        return a;
    }
}
