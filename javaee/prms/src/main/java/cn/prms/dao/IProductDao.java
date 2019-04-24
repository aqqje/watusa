package cn.prms.dao;

import cn.prms.domain.Product;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IProductDao {

    @Select("select * from product")
    List<Product> findAll();
}
