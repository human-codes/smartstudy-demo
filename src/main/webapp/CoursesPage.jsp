<%@ page import="com.smartstudy.entity_managerRepos.CourseRepo" %>
<%@ page import="com.smartstudy.entity.Course" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Courses</title>
</head>
<body>
<%
    List<Course> courses = CourseRepo.getCourses();
%>
<div class="container-fluid vh-100 d-flex flex-column">
    <div class="row flex-grow-1 overflow-auto">

        <!-- Table Display Section -->
        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Courses List</h4>
                </div>
                <div class="card-body">
                    <%
                        if (courses.isEmpty()) {
                    %>
                    <div class="alert alert-warning text-center" role="alert">
                        <h4 class="alert-heading">No Courses Available!</h4>
                        <p>It seems like there are no courses available at the moment. Please check back later or add a new course to get started.</p>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                            <tr class="text-center">
                                <th scope="col">Course ID</th>
                                <th scope="col">Course Name</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (Course course : courses) {
                            %>
                            <tr>
                                <td><%= course.getId() %></td>
                                <td><%= course.getCourse_name() %></td>
                                <td>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <form action="ModulePage.jsp" method="post" style="display: inline;">
                                            <input type="hidden" name="course_id" value="<%=course.getId()%>">
                                            <button type="submit" class="btn btn-success btn-sm mx-2">Modules</button>
                                        </form>
                                        <form action="editCourse.jsp" method="post" style="display: inline;">
                                            <input type="hidden" name="course_id" value="<%= course.getId() %>">
                                            <button type="submit" class="btn btn-primary btn-sm mx-2">Edit</button>
                                        </form>
                                        <form action="deleteCourse" method="post" style="display: inline;">
                                            <input type="hidden" name="course_id" value="<%= course.getId() %>">
                                            <button type="submit" class="btn btn-danger btn-sm mx-2">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <%
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

        <!-- Add Course Form Section -->
        <div class="col-12 col-md-6">
            <div class="card sticky-top" style="top: 20px;"> <!-- Ensures the form stays visible -->
                <div class="card-header">
                    <h4 class="mb-0">Add New Course</h4>
                </div>
                <div class="card-body">
                    <form action="addCourseServlet" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" name="course_name" placeholder="Enter new course name" required>
                            <button type="submit" class="btn btn-success">Add Course</button>
                        </div>

                        <div class="mt-3">
                            <a href="Report.jsp" class="btn btn-secondary">Report</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>


</body>
</html>
