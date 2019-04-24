package cn.aqqje.travel.web.servlet;

import cn.aqqje.travel.domain.PageBean;
import cn.aqqje.travel.domain.Route;
import cn.aqqje.travel.service.RouteService;
import cn.aqqje.travel.service.impl.RouteServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/route/*")
public class RouteServlet extends BaseServlet {

    private RouteService service = new RouteServiceImpl();

    /**
     * 分页查询+条件查询
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void pageQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取当前cid,currentPage,
        String cidStr = request.getParameter("cid");
        String currentPageStr = request.getParameter("currentPage");
        String pageSizeStr = request.getParameter("pageSize");
        String rname = new String(request.getParameter("rname").getBytes("iso-8859-1"), "utf-8");
        // 设置默认cid,currentpage,pageSize
        int cid = setPageParamter(cidStr, 5);
        int currentPage = setPageParamter(currentPageStr,1);
        int pageSize = setPageParamter(pageSizeStr, 8);
        // 获取 pageBean
        PageBean pb = service.pageQuery(cid, currentPage, pageSize, rname);
        // 写回客户端
        writeValue(pb, response);
    }

    /**
     * 单个查询
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void findOne(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        String ridStr = request.getParameter("rid");
        Integer rid = setPageParamter(ridStr, 0);

        Route route = service.findOne(rid);
        writeValue(route, response);
    }

    private Integer setPageParamter(String resource, Integer def){
        if(resource != null && resource.length() > 0 && !"null".equals(resource)){
            return Integer.parseInt(resource);
        }else{
            return def;

        }
    }
}
