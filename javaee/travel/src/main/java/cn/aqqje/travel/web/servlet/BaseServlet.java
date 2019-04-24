package cn.aqqje.travel.web.servlet;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class BaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*获取请求路径*/
        String uri = req.getRequestURI();
        /*获取请求方法*/
        String methodName = uri.substring(uri.lastIndexOf("/") + 1);
        /*获取方法的Method对象*/
        try {
            Method method = this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            /*Method.invoke()反射调用*/
            method.invoke(this, req, resp);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    /**
     * 将结果转为json并传给客户端
     * @param resource
     * @param response
     * @throws IOException
     */
    public void writeValue(Object resource,HttpServletResponse response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(resource);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }

    public String writeValueAsString(Object resource) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(resource);
    }
}
