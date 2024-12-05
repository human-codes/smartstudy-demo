package com.smartstudy;

import com.smartstudy.entity.Course;
import com.smartstudy.entity.Groups;
import com.smartstudy.entity.Modules;
import com.smartstudy.entity_managerRepos.CourseRepo;
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

@WebServlet("/addGroupServlet")
public class AddGroupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String parameter = req.getParameter("module_id");
        String groupName = req.getParameter("group_name");
        GroupsRepo groupsRepo = new GroupsRepo();
        Modules module = ModuleRepo.getModuleById(Integer.parseInt(parameter));
        groupsRepo.save(new Groups(groupName,module));
        resp.sendRedirect("/GroupsPage.jsp");

    }
}
