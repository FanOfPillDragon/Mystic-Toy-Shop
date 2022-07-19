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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FileController {
    Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    FileService fileService;

    @GetMapping("/file.do")
    public String fileDetail(Model model) {
        logger.info("FileController");
        System.out.println("FileController");

        List<FileDto> fileList = fileService.getFileList();

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("file_where_use", "1");
        map.put("file_use_id", 1);

        List<FileDto> fileListByFileWhereUse = fileService.getFileListByFileWhereUse(map);
/*        for (FileDto dto : fileList) {
            System.out.println(dto.getFile_name());
        }*/

        for (FileDto dto : fileListByFileWhereUse) {
            System.out.println(dto.getFile_name());
        }
        model.addAttribute("fileList", fileList);
        model.addAttribute("fileListByFileWhereUse", fileListByFileWhereUse);

        return "filedetail";
    }
}
