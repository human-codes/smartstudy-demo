<%@ page import="com.smartstudy.entity.Course" %>
<%@ page import="com.smartstudy.entity_managerRepos.CourseRepo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String courseId = request.getParameter("course_id");
    Course course = null;
    if (courseId != null) {
        course = CourseRepo.getCourseById(Integer.parseInt(courseId));
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Course</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
        }
    </style>
</head>

<body>
<div class="container vh-100 d-flex align-items-center justify-content-center">
    <div class="row w-100 justify-content-center">
        <div class="col-12 col-md-6">
            <div class="card sticky-top" style="top: 20px;">
                <div class="card-header bg-success text-white">
                    <h4 class="mb-0 text-center">Manage Course</h4>
                </div>
                <div class="card-body">
                    <form action="editcoursename" method="post">
                        <div class="mb-3">
                            <label for="courseName" class="form-label">Course Name</label>
                            <input type="hidden" name="course_id" value="<%=course.getId()%>">
                            <input type="text" class="form-control" name="name"
                                   id="courseName" placeholder="Enter course name"
                                   value="<%= course == null ? "" : course.getCourse_name() %>" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success btn-lg">
                                save
                            </button>
                        </div>
                    </form>
                </div>
                <% if (course != null) { %>
                <div class="card-footer text-center">
                    <small class="text-muted">Editing Course: <strong><%= course.getCourse_name() %></strong></small>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoXQFynE2yIdHwt/xS3dwX3jtQ7B3V6EzSBaFltHy1qy6O9" crossorigin="anonymous"></script>
</body>
</html>
