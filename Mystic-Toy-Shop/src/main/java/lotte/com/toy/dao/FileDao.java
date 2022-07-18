package lotte.com.toy.dao;

import lotte.com.toy.dto.FileDto;

import java.util.List;
import java.util.Map;

public interface FileDao {
    int uploadFile(FileDto dto);
    List<FileDto> getFileList(List<String> fileUse);
    void deleteFileList(List<String>  fileUse);
}
