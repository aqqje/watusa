package cn.aqqje.travel.test;

import cn.aqqje.travel.dao.RouteDao;
import cn.aqqje.travel.dao.impl.RouteDaoImpl;
import org.junit.Test;

/**
 * RouteDao 测试类
 */
public class RouteDaoTest {
    private RouteDao dao = new RouteDaoImpl();

    @Test
    public void totalCount(){
        System.out.println(dao.totalCount(5, "西安"));
    }
    @Test
    public void findPageList(){
        System.out.println(dao.findPageList(5,2, 8, "西安"));
    }
}
