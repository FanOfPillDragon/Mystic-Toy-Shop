package lotte.com.toy.service;

import lotte.com.toy.dao.FileDao;
import lotte.com.toy.dto.FileDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public interface FileService {
    List<FileDto> getFileList();

    List<FileDto> getFileListByFileUseId(Map<Character, Integer> whereUseId);

    int insertFile(FileDto fileDto);

    int deleteFileByFileUseId(Map<Character, Integer> whereUseId);
}
