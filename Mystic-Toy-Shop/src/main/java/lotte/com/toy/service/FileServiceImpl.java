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
    FileDao fileDao;

    @Override
    public int uploadFile(FileDto dto) {
        return fileDao.uploadFile(dto);
    }

    @Override
    public List<FileDto> getFileList(List<String> fileUse) {
        return fileDao.getFileList(fileUse);
    }

    @Override
    public void deleteFileList(List<String> fileUse) {
        fileDao.deleteFileList(fileUse);
    }
}
