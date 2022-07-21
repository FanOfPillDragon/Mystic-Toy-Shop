package lotte.com.toy.service;

import lotte.com.toy.dao.ProductDao;

import lotte.com.toy.dto.ProductDto;
import lotte.com.toy.dto.ProductResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao productDao;

    @Override
    public ProductDto findByProductId(int productId) {
        return productDao.findByProductId(productId);
    }

    @Override
    public List<ProductResponseDto> getProductList() {
        return productDao.getProductList();
    }

    @Override
    public ProductResponseDto getProductByProductId(int productId) {
        return productDao.getProductByProductId(productId);
    }

    @Override
    public List<ProductResponseDto> getProductListByCategoryId(int categoryId) {
        return productDao.getProductListByCategoryId(categoryId);
    }

    @Override
    public boolean product_write(ProductDto dto) {
        return productDao.product_write(dto) > 0 ? true : false;

    }

    @Override
    public List<ProductResponseDto> getProductListForMain() {
        return productDao.getProductListForMain();
    }
}
