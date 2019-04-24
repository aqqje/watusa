package cn.prms.service;

import cn.prms.domain.Product;
import org.springframework.stereotype.Service;

import java.util.List;


public interface IProductService {

    public List<Product> findAll();
}
