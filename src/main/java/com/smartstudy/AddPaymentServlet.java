package com.smartstudy;

import com.smartstudy.entity.Groups;
import com.smartstudy.entity.Payment;
import com.smartstudy.entity.Student;
import com.smartstudy.entity_managerRepos.GroupsRepo;
import com.smartstudy.entity_managerRepos.PaymentsRepo;
import com.smartstudy.entity_managerRepos.StudentRepo;
import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.smartstudy.MyListener.EMF;

@WebServlet("/addPaymentServlet")
public class AddPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String parameter = req.getParameter("student_id");
        String amount = req.getParameter("amount");
        int realAmount=Integer.parseInt(amount);
        PaymentsRepo paymentsRepo = new PaymentsRepo();
        Student student = StudentRepo.getStudentById(Integer.parseInt(parameter));
        paymentsRepo.save(new Payment(realAmount,student));
        resp.sendRedirect("/PaymentsPage.jsp");

    }
}
