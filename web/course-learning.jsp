<%-- 
    Document   : course-learning
    Created on : Nov 1, 2023, 9:59:51 AM
    Author     : HOANG DUNG
--%>

<%@page import="users.UserDTO"%>
<%@page import="course.LessonDTO"%>
<%@page import="course.ModuleDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="course.ModuleDAO"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Learning Course</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/all.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/odometer.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/owl.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <!-- Pheasant Buttons -->
        <!-- Pheasant Demure Buttons Reset: Optional -->
        <link rel="stylesheet" href="./dist/css/pheasant-demure-buttons-reset.css" type="text/css" media="all" />
        <!-- Pheasant Demure Buttons Layout: Optional -->
        <link rel="stylesheet" href="./dist/css/pheasant-demure-buttons-layout.css" type="text/css" media="all" />
        <!-- Pheasant Demure Buttons: Required -->
        <link rel="stylesheet" href="./dist/css/pheasant-demure-buttons.css" type="text/css" media="all" />
        <link href="assets/css/main2.css" rel="stylesheet" type="text/css"/>

        <link rel="shortcut icon" href="assets/images/art1.png" type="image/x-icon">

        <style>
            .nav-bar{
                width: 100vw;
                background-color: white;
                height: 90px;
            }
            .navbar-learning{
                padding: 50px;
            }
            .learning-container{
                width: 100vw;
                justify-content: space-between;
            }
            .learning-right{
                width: 70%;
                height: 80vh;
                position: absolute;
            }
            .module-title{
                background-color: rgba(88,100,125,255);
                padding: 10px;
                padding-left: 30px;
            }
            .module-title a {
                color: white;
                font-size: 20px;
            }
            .module-title a:hover {
                color: white;
                font-size: 20px;
            }
            .navbar-learning a{
                color: black;
                font-size: 20px;
            }
            .navbar-learning{
                border-top: 1px solid gray;
            }
            .lesson-title:hover{
                background-color: rgb(230, 228, 228);
                border-left: 10px solid rgb(21,76,121);
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

            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null) {
                    loginUser = new UserDTO();
                }
                if (loginUser.getRole() != "") {
                    String title = (String) request.getAttribute("TITLE");
                    String description = (String) request.getAttribute("DESCRIPTION");
                    String video = (String) request.getAttribute("VIDEO");
                    String courseID = (String) request.getAttribute("COURSEID");

            %>
            <div class="learning-right" style="position: absolute; top: 27%; right:-10px;">
                <div style="margin-bottom: 20px; justify-content: space-between ;display: flex;width: 90% ">
                    <h1><%=title%></h1>
                    <a href="">Next <i class="fa fa-solid fa-arrow-right"></i></a>
                </div>
                <iframe width="90%" height="80%" src="<%=video%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                <div style="margin-top: 30px">
                    <h4 style="margin-bottom: 20px">Description</h4>
                    <p style="background-color: rgb(240, 238, 238); width: 90%; padding: 50px; font-size: 17px">
                        <%=description%>
                    </p>
                </div>
            </div>
            <%
                List<ModuleDTO> listModule = (List<ModuleDTO>) request.getAttribute("LIST_MODULE");
            %>

            <div class="navbar-learning">
                <a href="customer.jsp"><i class="fa fa-solid fa-house-user"></i> Home</a>
                <a href="MainController?action=learning"> &nbsp; &nbsp; <i class="fa fa-solid fa-caret-left"></i> Learning</a>
                <a href=""> &nbsp; &nbsp; <i class="fa fa-solid fa-caret-left"></i> <%=title%></a>
            </div>

            <%
                int count1 = 0;
                int count2 = 0;
                for (ModuleDTO module : listModule) {
            %>
            <div class="learning-container">
                <div class="learning-left">
                    <div class="module-title" style="width: 25%">
                        <a href=""><%=module.getTitle()%></a>
                    </div>
                    <%
                        List<LessonDTO> listLesson = (List<LessonDTO>) request.getAttribute("LIST_LESSON_" + count1);
                        count1++;
                        for (LessonDTO lesson : listLesson) {
                            video = (String) request.getAttribute("LESSON_VIDEO_" + count2);
                    %>
                    <div style="width: 25%">
                        <%
                            if (lesson.getTitle().equals(title)) {
                        %>
                        <div name="lessonList" value="<%=lesson.getLessonID()%>" class="lesson-title" style="font-size: 17px; color: black; padding: 10px; padding-left: 30%; background-color: rgb(230, 228, 228);border-left: 10px solid rgb(21,76,121);">
                            <a href="ViewVideoController?title=<%=lesson.getTitle()%>&description=<%=lesson.getDescription()%>&video=<%=video%>&courseID=<%=courseID%>" style="width: 100%; color:black;"><%=lesson.getTitle()%></a>
                        </div>
                        <%
                        } else {
                        %>
                        <div name="lessonList" value="<%=lesson.getLessonID()%>" class="lesson-title" style="font-size: 17px; color: black; padding: 10px; padding-left: 30%">
                            <a href="ViewVideoController?title=<%=lesson.getTitle()%>&description=<%=lesson.getDescription()%>&video=<%=video%>&courseID=<%=courseID%>" style="width: 100%; color:black"><%=lesson.getTitle()%></a>
                        </div>
                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
            <%
                            count2++;
                        }
                    }
                }
            %>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"></script>

        <script data-cfasync="false" src="../../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/magnific-popup.min.js"></script>

        <script src="assets/js/odometer.min.js"></script>
        <script src="assets/js/viewport.jquery.js"></script>
        <script src="assets/js/nice-select.js"></script>
        <script src="assets/js/owl.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/odometer.min.js"></script>
        <script src="assets/js/viewport.jquery.js"></script>
        <script src="assets/js/nice-select.js"></script>
        <script src="assets/js/owl.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
