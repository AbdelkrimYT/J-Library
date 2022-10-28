<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Tableau de bord</title>
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/public/images/favicon.png">
    <link href="${pageContext.request.contextPath}/public/plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/public/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/public/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/public/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/public/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
</head>
<body>

<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
        </svg>
    </div>
</div>

<div id="main-wrapper">
    <div class="nav-header">
        <div class="brand-logo">
            <a>
                <b class="logo-abbr"><img src="${pageContext.request.contextPath}/public/images/logo.png" alt=""> </b>
                <span class="logo-compact"><img src="${pageContext.request.contextPath}/public/images/logo-compact.png" alt=""></span>
                <span class="brand-title">
                    <img src="${pageContext.request.contextPath}/public/images/logo-text.png" alt="">
                </span>
            </a>
        </div>
    </div>
    <%@ include file="header.jsp" %>
    <%@ include file="navigation_bar.jsp" %>