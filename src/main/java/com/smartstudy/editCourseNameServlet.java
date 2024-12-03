package com.smartstudy;

import com.smartstudy.entity.Course;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.smartstudy.MyListener.EMF;

@WebServlet("/editcoursename")
public class editCourseNameServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        try(EntityManager entityManager= EMF.createEntityManager()) {
            String courseId = req.getParameter("course_id");
            String courseName = req.getParameter("name");
            entityManager.getTransaction().begin();
            Course course = entityManager.find(Course.class, Integer.parseInt(courseId));
            course.setCourse_name(courseName);
            entityManager.getTransaction().commit();
            resp.sendRedirect("CoursesPage.jsp");


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
