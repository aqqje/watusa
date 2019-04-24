package cn.prms.service;

import cn.prms.domain.Orders;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface IOrdersService {

    List<Orders> findAll();

    Orders findById(String ordersId);
}
