package lotte.com.toy.dao;

import lotte.com.toy.dto.FileDto;

import java.util.List;
import java.util.Map;

public interface FileDao {
    List<FileDto> getFileList();

    List<FileDto> getFileListByFileUseId(Map<Character, Integer> whereUseId);

    int insertFile(FileDto fileDto);

    int deleteFileByFileUseId(Map<Character, Integer> whereUseId);
}
