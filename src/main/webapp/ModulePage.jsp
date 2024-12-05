<%@ page import="java.util.List" %>
<%@ page import="com.smartstudy.entity_managerRepos.ModuleRepo" %>
<%@ page import="com.smartstudy.entity.Modules" %>
<%@ page import="com.smartstudy.entity_managerRepos.CourseRepo" %>
<%@ page import="com.smartstudy.entity.Course" %>
<%@ page import="static com.smartstudy.entity_managerRepos.ModuleRepo.currentCourseId" %><%--
  Created by IntelliJ IDEA.
  User: SaRDoR
  Date: 12/3/2024
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Modules</title>
</head>
<body>
<%
    ModuleRepo moduleRepo=new ModuleRepo();
    List<Modules> modulesList = moduleRepo.findAll(0,10);
    String course_id = request.getParameter("course_id");
    if (course_id!=null){
        currentCourseId= Integer.parseInt(course_id);
    }
%>
<div class="container-fluid vh-100 d-flex flex-column">
    <div class="row flex-grow-1 overflow-auto">

        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Module List</h4>
                </div>
                <div class="card-body">
                    <%
                        if (modulesList.isEmpty()) {
                    %>
                    <div class="alert alert-warning text-center" role="alert">
                        <h4 class="alert-heading">No Modules Available!</h4>
                        <p>It seems like there are no Modules available at the moment. Please check back later or add a new module to get started.</p>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                            <tr class="text-center">
                                <th scope="col">Module ID</th>
                                <th scope="col">Module Name</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (Modules module : modulesList) {
                                    if (module.getCourse().getId()==currentCourseId){
                            %>
                            <tr>
                                <td><%= module.getId()%></td>
                                <td><%= module.getModule_name() %></td>
                                <td>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <form action="GroupsPage.jsp" method="post" style="display: inline;">
                                            <input type="hidden" name="module_id" value="<%= module.getId() %>">
                                            <button type="submit" class="btn btn-success btn-sm mx-2">Groups</button>
                                        </form>
                                        <form action="editModule.jsp" method="post" style="display: inline;">
                                            <input type="hidden" name="module_id" value="<%= module.getId() %>">
                                            <button type="submit" class="btn btn-primary btn-sm mx-2">Edit</button>
                                        </form>
                                        <form action="deleteModule" method="post" style="display: inline;">
                                            <input type="hidden" name="module_id" value="<%= module.getId() %>">
                                            <button type="submit" class="btn btn-danger btn-sm mx-2">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>


        <div class="col-12 col-md-6">
            <div class="card sticky-top" style="top: 20px;">
                <div class="card-header">
                    <h4 class="mb-0">Add New Module</h4>
                </div>
                <div class="card-body">
                    <form action="addModuleServlet" method="post">
                        <div class="input-group">
                            <input type="hidden" name="course_id" value="<%=currentCourseId%>">
                            <input type="text" class="form-control" name="module_name" placeholder="Enter new module name" required>
                            <button type="submit" class="btn btn-success">Add Module</button>
                        </div>
                        <div class="mt-3">
                            <a href="CoursesPage.jsp" class="btn btn-secondary">Go Back</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>


</body>
</html>

please add go back button to add part side