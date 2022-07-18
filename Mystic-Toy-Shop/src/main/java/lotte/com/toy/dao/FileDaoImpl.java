package lotte.com.toy.dao;

import lotte.com.toy.dto.FileDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class FileDaoImpl implements FileDao {

    @Autowired
    SqlSession session;

    String nameSpace = "File.";

    @Override
    public int uploadFile(FileDto dto) {
        return session.insert(nameSpace+"uploadFile", dto);
    }

    @Override
    public List<FileDto> getFileList(Map<Character, Integer> fileUse) {
        return session.selectList(nameSpace+"uploadFile",fileUse);
    }

    @Override
    public void deleteFileList(Map<Character, Integer> fileUse) {
        session.delete(nameSpace+"deleteFileList", fileUse);
    }
}
