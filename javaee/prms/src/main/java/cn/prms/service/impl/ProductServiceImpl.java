package cn.prms.service.impl;

import cn.prms.dao.IProductDao;
import cn.prms.domain.Product;
import cn.prms.service.IProductService;
import cn.prms.utils.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao productDao;

    public List<Product> findAll(){
        return productDao.findAll();
    }

    @Override
    public void save(Product product) {
        product.setId(UuidUtil.getUuid());
        productDao.save(product);
    }
}
