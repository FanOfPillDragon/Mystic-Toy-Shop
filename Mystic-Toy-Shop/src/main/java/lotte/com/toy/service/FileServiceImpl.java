package lotte.com.toy.service;

import lotte.com.toy.dao.FileDao;
import lotte.com.toy.dto.FileDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FileServiceImpl implements FileService{


    @Autowired
    FileDao fileDao ;

    @Override
    public List<FileDto> getFileList() {
        return fileDao.getFileList();
    }

    @Override
    public List<FileDto> getFileListByFileUseId(Map<Character, Integer> whereUseId) {
        return fileDao.getFileListByFileUseId(whereUseId);
    }

    @Override
    public int insertFile(FileDto fileDto) {
        return fileDao.insertFile(fileDto);
    }

    @Override
    public int deleteFileByFileUseId(Map<Character, Integer> whereUseId) {
        return fileDao.deleteFileByFileUseId(whereUseId);
    }
}
