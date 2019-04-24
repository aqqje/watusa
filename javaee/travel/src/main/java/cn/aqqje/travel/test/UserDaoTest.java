package cn.aqqje.travel.test;

import cn.aqqje.travel.dao.UserDao;
import cn.aqqje.travel.dao.impl.UserDaoImpl;
import cn.aqqje.travel.domain.User;
import cn.aqqje.travel.service.UserService;
import cn.aqqje.travel.service.impl.UserServiceImpl;
import org.junit.Test;

public class UserDaoTest {

    private UserService service = new UserServiceImpl();
    private UserDao dao = new UserDaoImpl();
    /*根据用户名查询用户*/
    @Test
    public void testFindOneByUsername(){
        System.out.println(dao.findOneByUsername(null));
    }
    /*保证用户*/
    @Test
    public void testSave(){
        User user = new User();
        user.setUsername("useradmin2");
        user.setPassword("123456aqqje");
        user.setSex("男");
        user.setBirthday("2018-02-02");
        user.setName("欧明");
        user.setEmail("1042136232@qq.com");
        user.setTelephone("13548522461");
//        dao.save(user);
        boolean register = service.register(user);
        System.out.println(register);
    }
}
