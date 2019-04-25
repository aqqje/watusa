package cn.prms.dao;

import cn.prms.domain.Member;
import cn.prms.domain.Orders;
import cn.prms.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IOrdersDao {
    /*订单列表*/
    @Select("select * from orders")
    @Results({@Result(id=true, column = "id", property = "id"),
            @Result(column = "orderNum", property = "orderNum"),
            @Result(column = "orderTime", property = "orderTime"),
            @Result(column = "orderStatus", property = "orderStatus"),
            @Result(column = "productId", property = "product", javaType = Product.class,one = @One(select = "cn.prms.dao.IProductDao.findById"))})
    List<Orders> findAll();

    /*One 订单 by id*/
    @Select("select * from orders where id = #{ordersId}")
    @Results({@Result(id=true, column = "id", property = "id"),
            @Result(column = "orderNum", property = "orderNum"),
            @Result(column = "orderTime", property = "orderTime"),
            @Result(column = "orderStatus", property = "orderStatus"),
            @Result(column = "peopleCount", property = "peopleCount"),
            @Result(column = "payType", property = "payType"),
            @Result(column = "orderDesc", property = "orderDesc"),
            @Result(column = "peopleCount", property = "peopleCount"),
            @Result(column = "productId", property = "product", javaType = Product.class, one = @One(select = "cn.prms.dao.IProductDao.findById")),
            @Result(column = "id", property = "travellers", javaType = java.util.List.class, many = @Many (select = "cn.prms.dao.ITravellersDao.findByOrdersId")),
            @Result(column = "memberId", property = "member", javaType = Member.class, one = @One(select = "cn.prms.dao.IMemberDao.findById")),
            })
    Orders findById(String ordersId);
}
