package cn.prms.service.impl;

import cn.prms.dao.IRoleDao;
import cn.prms.dao.IUserDao;
import cn.prms.domain.Role;
import cn.prms.domain.UserInfo;
import cn.prms.service.IUserService;
import cn.prms.utils.BCryptPasswordEncoderUtil;
import cn.prms.utils.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service("userService")
@Transactional
public class IUserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;
    @Autowired
    private IRoleDao roleDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //处理自己的用户对象封装成UserDetails
        User user = new User(userInfo.getUsername(),userInfo.getPassword(),userInfo.getStatus() == 0 ? false:true,true,true,true,getAuthority(userInfo.getRoles()));
        return user;
    }
    //作用就是返回一个List集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role:roles) {
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }
        return list;
    }

    @Override
    public List<UserInfo> findAll() throws Exception{
        return userDao.findAll();
    }

    @Override
    public void save(UserInfo user) throws Exception {
        user.setPassword(BCryptPasswordEncoderUtil.encrypt(user.getPassword()));
        user.setId(UuidUtil.getUuid());
        userDao.save(user);
    }

    @Override
    public UserInfo findById(String id) throws Exception {
        return userDao.findById(id);
    }

    @Override
    public void addRoleToUser(String userId, String[] lis) throws Exception {
        for (String roleId: lis) {
            roleDao.addRoleToUser(userId, roleId);
        }
    }
}
