package cn.aqqje.travel.service.impl;

import cn.aqqje.travel.dao.UserDao;
import cn.aqqje.travel.dao.impl.UserDaoImpl;
import cn.aqqje.travel.domain.User;
import cn.aqqje.travel.service.UserService;
import cn.aqqje.travel.util.MailUtils;
import cn.aqqje.travel.util.UuidUtil;

public class UserServiceImpl implements UserService {

    private UserDao dao = new UserDaoImpl();

    @Override
    public boolean register(User registerUser) {
        /*根据用户名查询用户*/
        User user = dao.findOneByUsername(registerUser.getUsername());
        if(user != null){/*存在已有用户返回false*/
            return false;
        }
        /*设置激活状态*/
        registerUser.setStatus("N");
        registerUser.setCode(UuidUtil.getUuid());
        /*不存在该用户,并保存*/
        dao.save(registerUser);
        String content = "<a href='http://localhost:8060/travel/user/active?activeCode="+ registerUser.getCode() +"'>点击激活[黑马旅游网]</a>";
        try {
            MailUtils.sendMail("1042136232@qq.com", content, "激活邮件");
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @Override
    public boolean activeUser(String activeCode) {
        /*根据activeCode查询到user*/
        User user = dao.findOneByCode(activeCode);
        /*如果user不为null设置statuso为Y返回true*/
        if(user != null){
            dao.updateStatus(user);
            return true;
        }
        /*如果为null返回false*/
        return false;
    }

    @Override
    public User loginUser(String username, String password) {
        return dao.findOneByUsernameAndPassword(username, password);
    }
}
