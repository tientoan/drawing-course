<%-- 
    Document   : course-details
    Created on : Sep 25, 2023, 8:33:54 AM
    Author     : Admin
--%>

<%@page import="cart.CartDAO"%>
<%@page import="users.UserDTO"%>
<%@page import="course.QuizDAO"%>
<%@page import="course.VideoDAO"%>
<%@page import="course.LessonDAO"%>
<%@page import="course.ModuleDAO"%>
<%@page import="course.CourseFeedbackDAO"%>
<%@page import="course.CourseDTO"%>
<%@page import="course.CourseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <title>ArtCenter - Online Drawing Course</title>

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
    </head>
    <jsp:include page="layout/header.jsp"/>

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





            <!-- ~~~ Hero Section ~~~ -->
            <section class="hero-section banner-overlay bg_img" data-img="assets/images/banner/banner.png">

                <div class="custom-container">
                    <div class="hero-content">
                        <h1 class="title uppercase cl-white">Course Details</h1>
                        <ul class="breadcrumb cl-white p-0 m-0">
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                Course Details
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
            <!-- ~~~ Hero Section ~~~ -->

            <%
                CourseFeedbackDAO courseFeedbackDAO = new CourseFeedbackDAO();
                ModuleDAO moduleDAO = new ModuleDAO();
                LessonDAO lessonDAO = new LessonDAO();
                VideoDAO videoDAO = new VideoDAO();
                QuizDAO quizDAO = new QuizDAO();
                CourseDAO courseDAO = new CourseDAO();
                String courseID = request.getParameter("courseID");
                CourseDTO course = courseDAO.getCourseByCourseID(courseID);
            %>

            <!-- ~~~ Course Section ~~~ -->
            <section class="course-details-section pt-120 pb-120">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <form action="MainController" method="POST">
                                <div class="course-video-area mb-lg-0">
                                    <div class="video-area bg_img" data-img="assets/images/course/course-info.png">
                                        <a href="<%= videoDAO.getLastestVideoByCourseID(course.getCourseID()).getContent()%>" class="magnific_popup video-button"><i class="flaticon-play-button-inside-a-circle"></i></a>
                                    </div>
                                    <div class="course-video-content">
                                        <h6 class="title"><%= course.getName()%></h6>
                                        <div class="ratings cl-theme">
                                            <span><i class="fas fa-star"></i></span>
                                            <span><i class="fas fa-star"></i></span>
                                            <span><i class="fas fa-star"></i></span>
                                            <span><i class="fas fa-star"></i></span>
                                            <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                            <span>(<%= courseFeedbackDAO.getAverageRate(course.getCourseID())%>/5.00)</span>
                                        </div>
                                        <ul class="course-infos">
                                            <li>
                                                <span><i class="fas fa-play-circle"></i>Total Lessons</span><span><%= lessonDAO.getTotalLessons(course.getCourseID())%></span>
                                            </li>
                                            <li>
                                                <span><i class="fas fa-clock"></i>Duration</span><span><%= course.getDuration()%></span>
                                            </li>
                                            <li>
                                                <span><i class="fas fa-brain"></i>Quizzes</span><span><%= quizDAO.getTotalOfQuizzes(course.getCourseID())%></span>
                                            </li>
                                            <li>
                                                <span><i class="fas fa-puzzle-piece"></i>Skill Level</span><span><%= courseDAO.getDescription(course.getCourseID()).getLevel()%></span>
                                            </li>
                                            <li>
                                                <span><i class="fas fa-certificate"></i>Certificate</span><span>No</span>
                                            </li>
                                        </ul>
                                        <div>
                                            <%
                                                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                                                if (loginUser == null) {
                                            %>
                                            <button class="custom-button theme-one rounded" onclick="checkLoginFunction()">Buy Now<i class="fas fa-angle-right"></i></button>
                                            <button class="custom-button theme-one rounded" onclick="checkLoginFunction()">Add To Cart<i class="fas fa-angle-right"></i></button>
                                            <button class="custom-button theme-one rounded" type="submit" name="action" value="ViewCart">View Cart<i class="fas fa-angle-right"></i></button>
                                                <%
                                                } else {
                                                %>
                                            <button class="custom-button theme-one rounded" type="submit" name="action" value="BuyNow">Buy Now<i class="fas fa-angle-right"></i></button>
                                                <%
                                                    CartDAO cartDAO = new CartDAO();
                                                    if (cartDAO.checkAlreadyAdd(courseID, loginUser.getAccountID())) {
                                                %>
                                            <button class="custom-button theme-one rounded" type="submit" name="action" value="AlreadyAddToCart">Already Add To Cart <i class="fas fa-angle-right"></i></button>
                                                <%
                                                } else {
                                                %>
                                            <button class="custom-button theme-one rounded" type="submit" name="action" value="AddToCart">Add To Cart <i class="fas fa-angle-right"></i></button>
                                                <%
                                                    }
                                                %>

                                            <button class="custom-button theme-one rounded" type="submit" name="action" value="ViewCart">View Cart<i class="fas fa-angle-right"></i></button>
                                            <input type="hidden" name="courseID" value="<%= course.getCourseID()%>">
                                            <input type="date" hidden="" name="createdDay" id="todayDate">
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-8">
                            <div class="course-details">
                                <div class="price">
                                    <%= course.getPrice()%>đ
                                </div>
                                <div class="course-header">
                                    <h4 class="title"><%= course.getName()%></h4>
                                    <div class="meta">
                                        <div class="meta-item">
                                            <i class="fas fa-user"></i>
                                            <span><%= courseDAO.getAccount(course.getCourseID()).getFullName()%></span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-photo-video"></i>
                                            <span><%= moduleDAO.getQuantityOfModules(course.getCourseID())%> Modules</span>
                                        </div>
                                        <div class="meta-item">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>20 Students</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="course-thumb">
                                    <img src="<%= courseDAO.getDescription(course.getCourseID()).getImage()%>" class="w-100" alt="course">
                                </div>
                                <div class="course-details-content section-bg">
                                    <ul class="nav nav-tabs">
                                        <li>
                                            <a href="#overview" class="active" data-bs-toggle="tab">Overview</a>
                                        </li>
                                        <li>
                                            <a href="#curriculum" data-bs-toggle="tab">Curriculum </a>
                                        </li>
                                        <li>
                                            <a href="#instructor" data-bs-toggle="tab">instructor</a>
                                        </li>
                                        <li>
                                            <a href="#reviews" data-bs-toggle="tab">reviews</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane show fade active" id="overview">
                                            <div class="overview">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
                                                    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
                                                    laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
                                                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
                                                    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
                                                    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
                                                    laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
                                                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
                                                    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                <p>roin et eros varius, ornare turpis ac, dapibus nisi. Morbi luctus arcu non massa consequat, et 
                                                    tristique velit semper. Curabitur interdum vulputate sagittis. Donec erat massa, tincidunt sed 
                                                    feugiat id, suscipit in est. Proin laoreet orci quis augue eleifend varius. Donec hendrerit ex ut 
                                                    lacus blandit euismod. </p>
                                                <div class="details-buttons-area">
                                                    <a href="#0" class="custom-button theme-one">Enroll Now <i class="fas fa-angle-right"></i></a>
                                                    <a href="#0" class="custom-button bg-white">get membership</a>
                                                    <ul class="social-icons">
                                                        <li>
                                                            <a href="#0" class="active"><i class="fab fa-facebook-f"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0"><i class="fab fa-twitter"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0"><i class="fab fa-instagram"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="curriculum">
                                            <div class="overview">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
                                                    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
                                                    laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
                                                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
                                                    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
                                                    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
                                                    laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
                                                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
                                                    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                <p>roin et eros varius, ornare turpis ac, dapibus nisi. Morbi luctus arcu non massa consequat, et 
                                                    tristique velit semper. Curabitur interdum vulputate sagittis. Donec erat massa, tincidunt sed 
                                                    feugiat id, suscipit in est. Proin laoreet orci quis augue eleifend varius. Donec hendrerit ex ut 
                                                    lacus blandit euismod. </p>
                                                <div class="details-buttons-area">
                                                    <a href="#0" class="custom-button theme-one">Enroll Now <i class="fas fa-angle-right"></i></a>
                                                    <a href="#0" class="custom-button bg-white">get membership</a>
                                                    <ul class="social-icons">
                                                        <li>
                                                            <a href="#0"><i class="fab fa-facebook-f"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0"><i class="fab fa-twitter"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0"><i class="fab fa-instagram"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="instructor">
                                            <div class="overview text-center">
                                                <div class="instructor-item">
                                                    <div class="instructor-thumb">
                                                        <a href="#0"><img src="assets/images/instructor/04.png" alt="instructor"></a>
                                                    </div>
                                                    <div class="instructor-content">
                                                        <h6 class="title"><a href="#0">Manuel Nuer</a></h6>
                                                        <span class="details">TEACHER</span>
                                                    </div>
                                                </div>
                                                <p>Sed do eiusmod tempor incididunt ut 
                                                    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
                                                    laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
                                                    voluptate velit esse cillum dolore eu fugiat nulla pariatur..</p>
                                                <div class="details-buttons-area">
                                                    <ul class="social-icons justify-content-center w-100">
                                                        <li>
                                                            <a href="#0"><i class="fab fa-facebook-f"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0" class="active"><i class="fab fa-twitter"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#0"><i class="fab fa-instagram"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="reviews">
                                            <div class="client-review">
                                                <div class="review-comments">
                                                    <h6 class="review-title">Reviews (03)</h6>
                                                    <ul class="review-contents">
                                                        <li>
                                                            <div class="thumb">
                                                                <img src="assets/images/course/client/client04.png" alt="course">
                                                            </div>
                                                            <div class="cont">
                                                                <h6 class="subtitle">Robot Smith</h6>
                                                                <div class="ratings cl-theme">
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                </div>
                                                                <p>
                                                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim unde et culpa voluptatibus repellat voluptates aliquid minima
                                                                </p>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="thumb">
                                                                <img src="assets/images/course/client/client02.png" alt="course">
                                                            </div>
                                                            <div class="cont">
                                                                <h6 class="subtitle">Nicolas Anelca</h6>
                                                                <div class="ratings cl-theme">
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span class="cl-theme-light"><i class="fas fa-star"></i></span>
                                                                </div>
                                                                <p>
                                                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim unde et culpa voluptatibus repellat voluptates aliquid minima
                                                                </p>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="thumb">
                                                                <img src="assets/images/course/client/client03.png" alt="course">
                                                            </div>
                                                            <div class="cont">
                                                                <h6 class="subtitle">Harry Johnshon</h6>
                                                                <div class="ratings cl-theme">
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                    <span><i class="fas fa-star"></i></span>
                                                                </div>
                                                                <p>
                                                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim unde et culpa voluptatibus repellat voluptates aliquid minima
                                                                </p>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="review-form">
                                                    <h6 class="review-title">Add a Review</h6>
                                                    <form class="row client-form align-items-center">
                                                        <div class="col-md-4 col-12">
                                                            <input type="text" name="name" placeholder="Full Name">
                                                        </div>
                                                        <div class="col-md-4 col-12">
                                                            <input type="text" name="email" placeholder="Email Adress">
                                                        </div>
                                                        <div class="col-md-4 col-12">
                                                            <div class="rating">
                                                                <span class="rating-title">Your Rating : </span>
                                                                <ul class="ratings">
                                                                    <li>
                                                                        <a href="#0" title="Give Me One Star"><i class="fas fa-star"></i></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#0" title="Give Me Two Star"><i class="fas fa-star"></i></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#0" title="Give Me Three Star"><i class="fas fa-star"></i></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#0" title="Give Me Four Star"><i class="fas fa-star"></i></a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#0" title="Give Me Five Star"><i class="far fa-star"></i></a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 col-12 d-inline-flex">
                                                            <textarea rows="5" placeholder="Type Here Message"></textarea>
                                                        </div>
                                                        <div class="col-12">
                                                            <button type="submit" class="custom-button rounded">Submit Review</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ~~~ Course Section ~~~ -->


            <!-- ~~~ Footer Section ~~~ -->
            <jsp:include page="layout/footer.jsp"/>
            <!-- ~~~ Footer Section ~~~ -->
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
                                                function checkLoginFunction() {
                                                    alert("Before Add to Cart, you must Login first");
                                                }
        </script>
        <script>
            document.getElementById("todayDate").valueAsDate = new Date();
        </script>
    </body>

</html>