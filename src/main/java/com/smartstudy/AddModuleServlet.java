package com.smartstudy;


import com.smartstudy.entity.Course;
import com.smartstudy.entity.Modules;
import com.smartstudy.entity_managerRepos.CourseRepo;
import com.smartstudy.entity_managerRepos.ModuleRepo;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.smartstudy.MyListener.EMF;

@WebServlet("/addModuleServlet")
public class AddModuleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String parameter = req.getParameter("course_id");
        String module_name = req.getParameter("module_name");
        Course course = CourseRepo.getCourseById(Integer.parseInt(parameter));
        ModuleRepo moduleRepo = new ModuleRepo();
        moduleRepo.save(new Modules(module_name, course));
        resp.sendRedirect("/ModulePage.jsp");

    }
}
