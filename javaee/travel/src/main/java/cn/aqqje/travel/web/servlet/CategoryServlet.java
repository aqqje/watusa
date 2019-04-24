package cn.aqqje.travel.web.servlet;

import cn.aqqje.travel.service.CategoryService;
import cn.aqqje.travel.service.impl.CategoryServletImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/category/*")
public class CategoryServlet extends BaseServlet {
    private CategoryService service = new CategoryServletImpl();
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List categorys = service.findAll();
        writeValue(categorys, response);
    }

}
