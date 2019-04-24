package cn.aqqje.travel.test;

import cn.aqqje.travel.dao.CategoryDao;
import cn.aqqje.travel.dao.impl.CategoryDaoImpl;
import org.junit.Test;

public class CategoryDaoTest {
    private CategoryDao dao = new CategoryDaoImpl();
    @Test
    public void findAll(){
        System.out.println(dao.findAll());
    }
}
