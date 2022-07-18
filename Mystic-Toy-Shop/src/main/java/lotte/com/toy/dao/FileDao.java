package lotte.com.toy.dao;

import lotte.com.toy.dto.FileDto;

import java.util.List;
import java.util.Map;

public interface FileDao {
    int uploadFile(FileDto dto);
    List<FileDto> getFileList(Map<Character, Integer> fileUse);
    void deleteFileList(Map<Character, Integer> fileUse);
}
