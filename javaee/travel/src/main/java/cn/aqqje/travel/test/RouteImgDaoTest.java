package cn.aqqje.travel.test;

import cn.aqqje.travel.dao.RouteImgDao;
import cn.aqqje.travel.dao.impl.RouteImgDaoImpl;
import org.junit.Test;

public class RouteImgDaoTest {

    private RouteImgDao dao = new RouteImgDaoImpl();
    @Test
    public void findByRid(){
        System.out.println(dao.findByRid(119));
    }
}
