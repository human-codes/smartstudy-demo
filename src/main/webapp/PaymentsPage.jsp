<%@ page import="java.util.List" %>

<%@ page import="static com.smartstudy.entity_managerRepos.StudentRepo.currentGroupId" %>
<%@ page import="com.smartstudy.entity.Payment" %>
<%@ page import="com.smartstudy.entity_managerRepos.PaymentsRepo" %>
<%@ page import="static com.smartstudy.entity_managerRepos.PaymentsRepo.currentStudentId" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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
    <title>Payments Page</title>
</head>
<body>
<%
    PaymentsRepo paymentRepo=new PaymentsRepo();
    List<Payment> payments = paymentRepo.findAll(0,10);
    String student_id = request.getParameter("student_id");
    if (student_id!=null){
        currentStudentId= Integer.parseInt(student_id);
    }
%>
<div class="container-fluid vh-100 d-flex flex-column">
    <div class="row flex-grow-1 overflow-auto">

        <div class="col-12 col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Payments List</h4>
                </div>
                <div class="card-body">
                    <%
                        if (payments.isEmpty()) {
                    %>
                    <div class="alert alert-warning text-center" role="alert">
                        <h4 class="alert-heading">No payments Available!</h4>
                        <p>It seems like there are no payments available at the moment. Please check back later or add a new payment to get started.</p>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                            <tr class="text-center">
                                <th scope="col">Payment ID</th>
                                <th scope="col">Payment amount</th>
                                <th scope="col">Payment date</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                for (Payment payment : payments) {
                                    if (payment.getStudent().getId()==currentStudentId){
                                        java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
                            %>
                            <tr>
                                <td><%= payment.getId()%></td>
                                <td><%= payment.getAmount() %>$</td>
                                <td><%= payment.getPaymentDate().format(formatter)%></td>
                                <td>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <form action="editPayment.jsp" method="post" style="display: inline;">
                                            <input type="hidden" name="payment_id" value="<%= payment.getId() %>">
                                            <button type="submit" class="btn btn-primary btn-sm mx-2">Edit</button>
                                        </form>
                                        <form action="deletePayment" method="post" style="display: inline;">
                                            <input type="hidden" name="payment_id" value="<%= payment.getId() %>">
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
                    <h4 class="mb-0">Add New payment</h4>
                </div>
                <div class="card-body">
                    <form action="addPaymentServlet" method="post">
                        <div class="input-group">
                            <input type="hidden" name="student_id" value="<%=currentStudentId%>">
                            <input type="number" step="0.001" min="0" name="amount" placeholder="Enter amount" required>

                            <button type="submit" class="btn btn-success">Add new payment</button>
                        </div>
                        <div class="mt-3">
                            <a href="StudentPage.jsp" class="btn btn-secondary">Go Back</a>
                        </div>
                        <div class="mt-3">
                            <a href="GroupsPage.jsp" class="btn btn-secondary">Groups Page</a>
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
