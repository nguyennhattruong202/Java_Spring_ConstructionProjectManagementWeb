<%-- 
    Document   : baseLayout
    Created on : Sep 16, 2022, 11:45:46 AM
    Author     : ACER
--%>

<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <tiles:insertAttribute name="title"/>
        </title>

        <!-- Begin W3.css -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <!-- End W3.css -->

        <!-- Begin Bootstrap 5 cdn -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- End Bootstrap 5 cdn -->

        <!-- Begin font and icon cdn -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css" integrity="sha512-5PV92qsds/16vyYIJo3T/As4m2d8b6oWYfoqV+vtizRB6KhF1F9kYzWzQmsO6T3z3QG2Xdhrx7FQ+5R1LiQdUA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- End font and icon cdn -->

        <!-- Begin java script of this project -->
        <script src="<c:url value="/js/baseLayout.js"/>"></script>
        <!-- End java script of this project -->
    </head>
    <body>
        <div class="container-fluid">
            <tiles:insertAttribute name="leftSidebar"/>
            <div id="mainContent">
                <tiles:insertAttribute name="headerLayout"/>
                <tiles:insertAttribute name="content"/>
                <tiles:insertAttribute name="footerLayout"/>
            </div>
        </div>
    </body>
</html>