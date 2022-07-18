package lotte.com.toy.service;

import lotte.com.toy.dao.FileDao;
import lotte.com.toy.dto.FileDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public interface FileService {

    int uploadFile(FileDto dto);
    List<FileDto> getFileList(Map<Character, Integer> fileUse);
    void deleteFileList(Map<Character, Integer> fileUse);
}
