package com.smartstudy;


import com.smartstudy.entity.Course;
import com.smartstudy.entity.Modules;
import com.smartstudy.entity_managerRepos.CourseRepo;
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
        try (EntityManager entityManager = EMF.createEntityManager()){
            entityManager.getTransaction().begin();
            entityManager.persist(new Modules(module_name,course));
            entityManager.getTransaction().commit();
            resp.sendRedirect("/ModulePage.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
