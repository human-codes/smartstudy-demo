<%@ page import="java.util.List" %>
<%@ page import="static com.smartstudy.entity_managerRepos.GroupsRepo.currentModuleId" %>
<%@ page import="com.smartstudy.entity.Groups" %>
<%@ page import="com.smartstudy.entity_managerRepos.GroupsRepo" %><%--
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
    <title>Group Page</title>
</head>
<body>
<%
    List<Groups> groups = GroupsRepo.getGroups();
    String parameter = request.getParameter("module_id");
    if (parameter!=null){
        currentModuleId= Integer.parseInt(parameter);
    }
%>
<div class="container-fluid vh-100 d-flex flex-column">
    <div class="row flex-grow-1 overflow-auto">

        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Groups List</h4>
                </div>
                <div class="card-body">
                    <%
                        if (groups.isEmpty()) {
                    %>
                    <div class="alert alert-warning text-center" role="alert">
                        <h4 class="alert-heading">No Groups Available!</h4>
                        <p>It seems like there are no Groups available at the moment. Please check back later or add a new module to get started.</p>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                            <tr class="text-center">
                                <th scope="col">Group ID</th>
                                <th scope="col">Group Name</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (Groups group : groups) {
                                    if (group.getModules().getId()==currentModuleId){
                            %>
                            <tr>
                                <td><%= group.getId()%></td>
                                <td><%= group.getGroup_name() %></td>
                                <td>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <form action="StudentPage.jsp" method="post" style="display: inline;">
                                            <input type="hidden" name="group_id" value="<%= group.getId() %>">
                                            <button type="submit" class="btn btn-success btn-sm mx-2">Students</button>
                                        </form>
                                        <form action="editGroup.jsp" method="post" style="display: inline;">
                                            <input type="hidden" name="group_id" value="<%= group.getId() %>">
                                            <button type="submit" class="btn btn-primary btn-sm mx-2">Edit</button>
                                        </form>
                                        <form action="deleteGroup" method="post" style="display: inline;">
                                            <input type="hidden" name="group_id" value="<%= group.getId() %>">
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
                    <h4 class="mb-0">Add New Group</h4>
                </div>
                <div class="card-body">
                    <form action="addGroupServlet" method="post">
                        <div class="input-group">
                            <input type="hidden" name="module_id" value="<%=currentModuleId%>">
                            <input type="text" class="form-control" name="group_name" placeholder="Enter new group name" required>
                            <button type="submit" class="btn btn-success">Add Group</button>
                        </div>
                        <div class="mt-3">
                            <a href="ModulePage.jsp" class="btn btn-secondary">Go Back</a>
                        </div>
                        <div class="mt-3">
                            <a href="CoursesPage.jsp" class="btn btn-secondary">Courses Page</a>
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