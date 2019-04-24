package cn.aqqje.travel.test;

import cn.aqqje.travel.dao.SellerDao;
import cn.aqqje.travel.dao.impl.SellerDaoImpl;
import org.junit.Test;

public class SellerDaoTest {

    private SellerDao dao = new SellerDaoImpl();

    @Test
    public void findByRid(){
        System.out.println(dao.findBySid(1));
    }
}
