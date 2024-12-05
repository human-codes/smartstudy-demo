<%@ page import="java.util.List" %>

<%@ page import="com.smartstudy.entity.Groups" %>
<%@ page import="com.smartstudy.entity_managerRepos.GroupsRepo" %>
<%@ page import="static com.smartstudy.entity_managerRepos.StudentRepo.currentGroupId" %>
<%@ page import="com.smartstudy.entity.Student" %>
<%@ page import="com.smartstudy.entity_managerRepos.StudentRepo" %><%--
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
    <title>Student Page</title>
</head>
<body>
<%
    StudentRepo studentRepo=new StudentRepo();
    List<Student> students = studentRepo.findAll();
    String group_id = request.getParameter("group_id");
    if (group_id!=null){
        currentGroupId= Integer.parseInt(group_id);
    }
%>
<div class="container-fluid vh-100 d-flex flex-column">
    <div class="row flex-grow-1 overflow-auto">

        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Students List</h4>
                </div>
                <div class="card-body">
                    <%
                        if (students.isEmpty()) {
                    %>
                    <div class="alert alert-warning text-center" role="alert">
                        <h4 class="alert-heading">No Students Available!</h4>
                        <p>It seems like there are no Students available at the moment. Please check back later or add a new student to get started.</p>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                            <tr class="text-center">
                                <th scope="col">Student ID</th>
                                <th scope="col">Student fullname</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (Student student : students) {
                                    if (student.getGroups().getId()==currentGroupId){
                            %>
                            <tr>
                                <td><%= student.getId()%></td>
                                <td><%= student.getName() %></td>
                                <td>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <form action="PaymentsPage.jsp" method="post" style="display: inline;">
                                            <input type="hidden" name="student_id" value="<%= student.getId() %>">
                                            <button type="submit" class="btn btn-success btn-sm mx-2">Payments</button>
                                        </form>
                                        <form action="editStudent.jsp" method="post" style="display: inline;">
                                            <input type="hidden" name="student_id" value="<%= student.getId() %>">
                                            <button type="submit" class="btn btn-primary btn-sm mx-2">Edit</button>
                                        </form>
                                        <form action="deleteStudent" method="post" style="display: inline;">
                                            <input type="hidden" name="group_id" value="<%= student.getId() %>">
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
                    <h4 class="mb-0">Add New Student</h4>
                </div>
                <div class="card-body">
                    <form action="addStudentServlet" method="post">
                        <div class="input-group">
                            <input type="hidden" name="group_id" value="<%=currentGroupId%>">
                            <input type="text" class="form-control" name="student_fullName" placeholder="Enter new student fullname" required>
                            <button type="submit" class="btn btn-success">Add Student</button>
                        </div>
                        <div class="mt-3">
                            <a href="GroupsPage.jsp" class="btn btn-secondary">Go Back</a>
                        </div>
                        <div class="mt-3">
                            <a href="CoursesPage.jsp" class="btn btn-secondary">Main Courses Page</a>
                        </div>
                        <div class="mt-3">
                            <a href="ModulePage.jsp" class="btn btn-secondary">Modules Page</a>
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