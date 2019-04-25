package cn.prms.controller;

import cn.prms.domain.Permission;
import cn.prms.domain.Role;
import cn.prms.service.IPermissionsService;
import cn.prms.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;
    @Autowired
    private IPermissionsService permissionsService;

    /*获取所有角色*/
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll();
        mv.addObject("roleList", roleList);
        mv.setViewName("role-list");
        return mv;
    }

    /*保存角色*/
    @RequestMapping("/save.do")
    public String findAll(Role role) throws Exception {
        roleService.save(role);
        return "redirect:findAll.do";
    }

    /*获取 id 中没关联的 permissoin 和 role*/
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id", required = true) String roleId) throws Exception {
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findOneById(roleId);
        List<Permission> permissionList = permissionsService.findOtherByRoleId(roleId);
        mv.addObject("role", role);
        mv.addObject("permissionList", permissionList);
        mv.setViewName("role-permission-add");
        return mv;
    }

    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name = "roleId", required = true)String roleId, @RequestParam(name = "ids", required = true)String[] lis ) throws Exception {
        roleService.addPermissionToRole(roleId, lis);
        return "redirect:findAll.do";
    }
}
