package lotte.com.toy.controller;

import lotte.com.toy.dto.FileDto;
import lotte.com.toy.service.FileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class FileController {
    Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    FileService service;

    @RequestMapping(value = "fileupload.do", method = RequestMethod.POST)
    public String fileupload(FileDto filedto,
                             @RequestParam(value = "fileload", required = false)
                             MultipartFile fileload) {

        logger.info("FileController fileupload() " + new Date());

        // 1. url인지 file인지 검사
        // 2. file명/
        service.uploadFile(filedto);

        return "redirect:/main.do";
    }
}
