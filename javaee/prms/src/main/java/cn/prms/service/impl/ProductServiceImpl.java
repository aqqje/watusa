package cn.prms.service.impl;

import cn.prms.dao.IProductDao;
import cn.prms.domain.Product;
import cn.prms.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao productDao;

    public List<Product> findAll(){
        return productDao.findAll();
    }
}
