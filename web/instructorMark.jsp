<%@page import="submisson.SubmissionDTO"%>
<%@page import="users.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="course.BillDTO"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instructor Grading</title>

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/odometer.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/owl.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/main2.css">

        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">
        <style>
            .nav-bar{
                width: 100vw;
                background-color: white;
            }
            .banner-overlay::before {
                left: 0;
                bottom: 0;
                top: 0;
                right: 0;
                background: rgba(59, 65, 66, 0.5);
            }
            #fullImageOverlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.8);
                justify-content: center;
                align-items: center;
                z-index: 2; /* Đảm bảo overlay nằm trên cùng */
            }

            #fullImageOverlay img {
                max-width: 80%;
                max-height: 80%;
            }

            #fullImageCheckbox:checked + #fullImageOverlay {
                display: flex;
            }

            /* Khi overlay được hiển thị, làm mờ phần còn lại của trang */
            #fullImageCheckbox:checked ~ .all-sections {
                filter: blur(5px); /* Điều chỉnh mức độ mờ tùy chọn */
                pointer-events: none; /* Ngăn chặn sự tương tác với phần còn lại của trang */
            }
        </style>
    </head>
    <body>
        <div class="all-sections oh">
            <!-- ~~~ Loader & Go-Top ~~~ -->
            <div class="overlayer"></div>
            <div class="loader">
                <div class="inner"></div>
            </div>
            <span class="go-top">
                <i class="fas fa-angle-up"></i>
            </span>
            <!-- ~~~ Loader & Go-Top ~~~ -->


            <div class="nav-bar">
                <jsp:include page="layout/header.jsp"/>
            </div>

            <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner-grading.avif">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Grading</h1>
                        <ul class="breadcrumb cl-white p-0 m-0" style="background-color: #e9ecef00">
                            <li>
                                <a href="instructor.jsp">Home</a>
                            </li>
                            <li>
                                Grading
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            
            <%
                List<SubmissionDTO> listSubmission = (List<SubmissionDTO>) request.getAttribute("LIST_SUBMISSION");
                if (listSubmission.size() > 0) {
            %>
            <div style="min-height: 80vh;">
                <h1 class="text-center" style="margin-top: 50px; margin-bottom: 30px">Mark for students</h1>
                <div class="d-flex justify-content-center">
                    <table class="table" style="width: 80vw;">
                        <thead style="background-color: rgb(21,76,121); color: white">
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Student Name</th>
                                <th scope="col">Course Name</th>
                                <th scope="col">Assignment Topic</th>
                                <th scope="col">Function</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (SubmissionDTO submission : listSubmission) {
                                    int count = 1;
                                    String studentName = (String) request.getAttribute("NAME_STUDENT_"+count);
                                    String courseName = (String) request.getAttribute("NAME_COURSE_"+count);
                                    String topicName = (String) request.getAttribute("NAME_TOPIC_"+count);
                            %>
                            <tr>
                                <th><%=count++%></th>
                                <th><%=studentName%></th>
                                <th><%=courseName%></th>
                                <th><%=topicName%></th>
                                <th><a href="MainController?action=gradingDetail&submissionID=<%=submission.getSubmissionID()%>&courseName=<%=courseName%>&topicName=<%=topicName%>&studentName=<%=studentName%>">Grading</a></th>
                            </tr>
                            <%
                                    
                                }
                            %>
                        </tbody>

                    </table>
                </div>
            </div>
            <%
                }
            %>

            <jsp:include page="layout/footer.jsp"/>
        </div>

        <script data-cfasync="false" src="../../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/magnific-popup.min.js"></script>

        <script src="assets/js/odometer.min.js"></script>
        <script src="assets/js/viewport.jquery.js"></script>
        <script src="assets/js/nice-select.js"></script>
        <script src="assets/js/owl.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script>
            document.getElementById('fullImageOverlay').addEventListener('click', function () {
                document.getElementById('fullImageCheckbox').checked = false;
            });
        </script>
    </body>
</html>
