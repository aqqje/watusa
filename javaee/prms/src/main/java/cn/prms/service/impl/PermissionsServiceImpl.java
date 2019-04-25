package cn.prms.service.impl;

import cn.prms.dao.IPermissionsDao;
import cn.prms.domain.Permission;
import cn.prms.service.IPermissionsService;
import cn.prms.utils.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Controller
@Transactional
public class PermissionsServiceImpl implements IPermissionsService {

    @Autowired
    private IPermissionsDao permissionsDao;

    @Override
    public List<Permission> findAll() throws Exception {
        return permissionsDao.findAll();
    }

    @Override
    public void save(Permission permission) throws Exception {
        permission.setId(UuidUtil.getUuid());
        permissionsDao.save(permission);
    }

    @Override
    public List<Permission> findOtherByRoleId(String roleId) throws Exception {
        return permissionsDao.findOtherByRoleId(roleId);
    }
}
