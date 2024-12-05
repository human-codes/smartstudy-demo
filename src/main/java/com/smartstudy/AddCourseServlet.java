package com.smartstudy;

import com.smartstudy.entity.Course;
import com.smartstudy.entity_managerRepos.CourseRepo;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.smartstudy.MyListener.EMF;

@WebServlet("/addCourseServlet")
public class AddCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String course_name = req.getParameter("course_name");
        CourseRepo cr = new CourseRepo();
        cr.save(new Course(course_name));
        resp.sendRedirect("/CoursesPage.jsp");
    }
}
