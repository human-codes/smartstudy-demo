package com.smartstudy;

import com.smartstudy.entity.Groups;
import com.smartstudy.entity.Modules;
import com.smartstudy.entity.Student;
import com.smartstudy.entity_managerRepos.GroupsRepo;
import com.smartstudy.entity_managerRepos.ModuleRepo;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.smartstudy.MyListener.EMF;

@WebServlet("/addStudentServlet")
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String parameter = req.getParameter("group_id");
        String studentName = req.getParameter("student_fullName");

        Groups group = GroupsRepo.getGroupById(Integer.parseInt(parameter));
        try (EntityManager entityManager = EMF.createEntityManager()){
            entityManager.getTransaction().begin();
            entityManager.persist(new Student(studentName,group));
            entityManager.getTransaction().commit();
            resp.sendRedirect("/StudentPage.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
