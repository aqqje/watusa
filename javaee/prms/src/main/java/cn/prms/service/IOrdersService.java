package cn.prms.service;

import cn.prms.domain.Orders;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface IOrdersService {

    List<Orders> findAll(int page, int size);

    Orders findById(String ordersId);
}
