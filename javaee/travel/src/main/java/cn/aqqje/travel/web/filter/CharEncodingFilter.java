package cn.aqqje.travel.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class CharEncodingFilter implements Filter {
    public void destroy() {
    }
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        /*将父接口转换成子接口*/
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        /*获取请求*/
        String method = request.getMethod();
        if(method.equalsIgnoreCase("post")){
            /*设置参数字符集*/
            request.setCharacterEncoding("utf-8");
        }
        /*设置响应处理字符集*/
        response.setContentType("text/html;charset=utf-8");
        /*放行*/
        chain.doFilter(request, response);
    }
    public void init(FilterConfig config) throws ServletException {
    }

}
