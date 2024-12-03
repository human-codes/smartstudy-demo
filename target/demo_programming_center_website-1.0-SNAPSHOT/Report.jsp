<%@ page import="java.util.List" %>
<%@ page import="static com.smartstudy.MyListener.EMF" %>
<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="jakarta.persistence.Query" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    EntityManager entityManager = EMF.createEntityManager();
    Query nativeQuery = entityManager.createNativeQuery(
            "SELECT c.course_name, COUNT(DISTINCT s.id) AS student_count, " +
                    "       SUM(p.amount) AS total_payments " +
                    "FROM course c " +
                    "         LEFT JOIN modules m ON c.id = m.course_id " +
                    "         LEFT JOIN groups g ON m.id = g.modules_id " +
                    "         LEFT JOIN student s ON g.id = s.groups_id " +
                    "         LEFT JOIN payment p ON s.id = p.student_id " +
                    "GROUP BY c.course_name " +
                    "ORDER BY c.course_name"
    );

    List<Object[]> resultList = nativeQuery.getResultList();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report about course</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container my-5">
    <h1 class="text-center mb-4">Course Report</h1>
    <table class="table table-bordered table-hover text-center">
        <thead class="table-dark">
        <tr>
            <th>Course name</th>
            <th>Student count</th>
            <th>Sum of payments</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Object[] row : resultList) {
                String courseName = (String) row[0];
                Long studentCount = row[1] != null ? ((Number) row[1]).longValue() : 0;
                Long totalPayments = row[2] != null ? ((Number) row[2]).longValue() : 0;
        %>
        <tr>
            <td><%= courseName %></td>
            <td><%= studentCount %></td>
            <td><%= totalPayments %> $</td>
        </tr>
        <%
            }
            entityManager.close();
        %>
        </tbody>
    </table>
    <div class="text-center mt-4">
        <a href="CoursesPage.jsp" class="btn btn-secondary">Go Back</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HoA6xj2pvCtQVRaGHjyGp0yAapT0uGhY1sNB9ah53X52N0b8+6qA9LFHZzpiGTHx"
        crossorigin="anonymous"></script>
</body>
</html>
