package cn.prms.controller;

import cn.prms.domain.Role;
import cn.prms.domain.UserInfo;
import cn.prms.service.IRoleService;
import cn.prms.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleService roleService;

    // 获取所有
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userList = userService.findAll();
        mv.addObject("userList", userList);
        mv.setViewName("user-list");
        return mv;
    }

    // 保存
    @RequestMapping("/save.do")
    public String save(UserInfo user) throws Exception {
        userService.save(user);
        return "redirect:findAll.do";
    }

    // 详情
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id", required = true)String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        UserInfo user = userService.findById(id);
        mv.addObject("user", user);
        mv.setViewName("user-show");
        return mv;
    }

    // 获取可添加的role
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id",required = true) String userId) throws Exception {
        ModelAndView mv = new ModelAndView();
        UserInfo user = userService.findById(userId);
        List<Role> roleList = roleService.findOthersByUserId(userId);
        mv.addObject("user", user);
        System.out.println(user);
        mv.addObject("roleList", roleList);
        System.out.println(roleList);
        mv.setViewName("user-role-add");
        return mv;
    }

    /*添加角色到用户中*/
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(value = "userId", required = true) String userId, @RequestParam(value = "ids", required = true)String[] lis) throws Exception {
        userService.addRoleToUser(userId, lis);
        return "redirect:findAll.do";
    }
}
