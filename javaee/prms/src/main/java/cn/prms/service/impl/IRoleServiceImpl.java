package cn.prms.service.impl;

import cn.prms.dao.IRoleDao;
import cn.prms.domain.Role;
import cn.prms.service.IRoleService;
import cn.prms.utils.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class IRoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;

    @Override
    public List<Role> findAll() throws Exception{
        return roleDao.findAll();
    }

    @Override
    public void save(Role role) throws Exception {
        role.setId(UuidUtil.getUuid());
        roleDao.save(role);
    }

    @Override
    public List<Role> findOthersByUserId(String userId) throws  Exception {
        return roleDao.findOthersByUserId(userId);
    }
}
