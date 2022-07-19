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
    public List<FileDto> getFileList() {
        return session.selectList(nameSpace+"getFileList");
    }

    @Override
    public List<FileDto> getFileListByFileWhereUse(Map<String, Object> whereUseId) {
        return session.selectList(nameSpace+"getFileListByFileUseId", whereUseId);
    }

    @Override
    public int insertFile(FileDto fileDto) {
        return session.insert(nameSpace+"insertFile", fileDto);
    }

    @Override
    public int deleteFileByFileUseId(Map<Character, Integer> whereUseId) {
        return session.delete(nameSpace+"deleteCartByCartId", whereUseId);
    }
}
