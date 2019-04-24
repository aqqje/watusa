package cn.aqqje.travel.dao;

import cn.aqqje.travel.domain.Seller;

import java.util.List;

public interface SellerDao {
    Seller findBySid(int sid);
    // 获取销售商
}
