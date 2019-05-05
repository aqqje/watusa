package dao;

import cn.aqqje.ssm.dao.IAccountDao;
import cn.aqqje.ssm.domain.Account;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.aspectj.lang.annotation.AfterThrowing;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class AccontDaoTest {

    private InputStream in;
    private SqlSession session;
    private IAccountDao accountDao;

    @Before
    public void init() throws IOException {
        in = Resources.getResourceAsStream("sqlmapconfig.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        session = factory.openSession();
        accountDao = session.getMapper(IAccountDao.class);
    }

    @Test
    public void findAllTest(){
        List<Account> list = accountDao.findAll();
        for (Account account: list) {
            System.out.println(account);
        }
    }


    @After
    public void destroy() throws IOException {
        session.commit();
        session.close();
        if(in != null){
            in.close();
        }
    }
}
