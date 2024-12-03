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

@WebServlet("/deleteCourse")
public class deleteCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (EntityManager entityManager = EMF.createEntityManager()) {
            String id = req.getParameter("course_id");
            int courseID = Integer.parseInt(id);
            entityManager.getTransaction().begin();
            Course course = entityManager.find(Course.class, courseID);
            entityManager.remove(course);
            entityManager.getTransaction().commit();
            resp.sendRedirect("CoursesPage.jsp");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
