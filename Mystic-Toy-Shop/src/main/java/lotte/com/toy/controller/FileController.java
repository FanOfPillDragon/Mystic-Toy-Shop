package lotte.com.toy.controller;

import lotte.com.toy.dto.FileDto;
import lotte.com.toy.service.FileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import java.util.Date;
import java.util.List;

@Controller
public class FileController {
    Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    FileService fileService;

    @GetMapping("/file.do")
    public String fileDetail(Model model) {
        logger.info("FileController");
        System.out.println("???????????????");

        List<FileDto> fileList = fileService.getFileList();

        for (FileDto dto : fileList) {
            System.out.println(dto.getFile_name());
        }
        model.addAttribute("fileList", fileList);

        return "filedetail";
    }
}
