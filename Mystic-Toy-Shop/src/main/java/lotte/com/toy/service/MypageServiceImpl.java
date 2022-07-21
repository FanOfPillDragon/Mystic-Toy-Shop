package lotte.com.toy.service;

import lotte.com.toy.dao.MypageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService{

    @Autowired
    MypageDao mypagedao;
}
