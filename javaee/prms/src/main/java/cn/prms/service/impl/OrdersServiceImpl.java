package cn.prms.service.impl;

import cn.prms.dao.IOrdersDao;
import cn.prms.domain.Orders;
import cn.prms.service.IOrdersService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService {

    @Autowired
    private IOrdersDao ordersDao;

    @Override
    public List<Orders> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(String ordersId) {
        return ordersDao.findById(ordersId);
    }
}
