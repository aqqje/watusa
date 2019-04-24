package cn.aqqje.travel.web.servlet;

import cn.aqqje.travel.domain.ResultInfo;
import cn.aqqje.travel.domain.User;
import cn.aqqje.travel.service.UserService;
import cn.aqqje.travel.service.impl.UserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/user/*")
public class UserServlet extends BaseServlet {
    private UserService service = new UserServiceImpl();

    /**
     * 用户注册
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*创建结果封装对象*/
        ResultInfo info = new ResultInfo();
        /*获取验证码*/
        String check = request.getParameter("check");
        HttpSession session = request.getSession();
        String check_code = (String) session.getAttribute("CHECK_CODE");
        session.removeAttribute("CHECK_CODE");
        if(check_code == null || !check.equalsIgnoreCase(check_code)){
            info.setFlag(false);
            info.setErrorMsg("验证码错误!");
            /*将结果序列化为json数据*/
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(info);
            /*设置响应请求为json格式*/
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(json);
            return;
        }
        /*获取所有的值*/
        Map<String, String[]> parameterMap = request.getParameterMap();
        /*创建 registerUser*/
        User registerUser = new User();
        try {
            /*封装到User*/
            BeanUtils.populate(registerUser, parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        /*调用register方法,并获取返回结果*/
        boolean flag = service.register(registerUser);

        if(flag){/*注册成功*/
            info.setFlag(true);
        }else{/*注册不成功*/
            info.setFlag(flag);
            info.setErrorMsg("注册失败!");
        }
        /*将结果序列化为json数据*/
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(info);
        /*设置响应请求为json格式*/
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    /**
     * 用户激活
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String activeCode = request.getParameter("activeCode");
        if(activeCode != null){/*激活码不为null激活成功*/
            boolean flag = service.activeUser(activeCode);
            String info = null;
            if(flag){
                info = "激活成功<a href='login.html'>立即登录</a>";
            }else{
                info = "激活失败,请联系管理员!";
            }
            response.getWriter().write(info);
        }
    }

    /**
     * 获取session中已登录的User
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
     public void findLoginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         /*获取已登录的用户*/
         User loginUser = (User)request.getSession().getAttribute("loginUser");

         ObjectMapper mapper = new ObjectMapper();
         response.setContentType("application/json;charset=utf-8");
         mapper.writeValue(response.getOutputStream(), loginUser);
    }

    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*将session销毁*/
        request.getSession().invalidate();
        /*将页面跳转*/
        response.sendRedirect(request.getContextPath()+"/login.html");
    }

    /**
     * 用户登录
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultInfo info = new ResultInfo();
        /*获取验证码*/
        String check = request.getParameter("check");
        HttpSession session = request.getSession();
        String check_code = (String) session.getAttribute("CHECK_CODE");
        session.removeAttribute("CHECK_CODE");
        if(check_code == null || !check.equalsIgnoreCase(check_code)){
            info.setFlag(false);
            info.setErrorMsg("验证码错误!");
            /*将结果序列化为json数据*/
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(info);
            /*设置响应请求为json格式*/
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(json);
            return;
        }

        /*获取参数*/
        Map<String, String[]> parameterMap = request.getParameterMap();
        /*封装成user*/
        User loginUser = new User();
        try {
            BeanUtils.populate(loginUser, parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        User user = service.loginUser(loginUser.getUsername(), loginUser.getPassword());
        if(user == null){
            /*user = null*/
            info.setFlag(false);
            info.setErrorMsg("用户名或密码错误!");
        }else{
            /*user != null*/
            /*将登录成功用户设置到session域中*/
            session.setAttribute("loginUser", user);
            info.setFlag(true);
            info.setData(user);
        }
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(info);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

}
