<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Système de gestion de bibliothèque - E404</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/public/images/favicon.png">
    <link href="${pageContext.request.contextPath}/public/css/style.css" rel="stylesheet">
    
</head>

<body class="h-100">
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
        </svg>
    </div>
</div>
<div class="login-form-bg h-100">
    <div class="container h-100">
        <div class="row justify-content-center h-100">
            <div class="col-xl-6">
                <div class="error-content">
                    <div class="card mb-0">
                        <div class="card-body text-center pt-5">
                            <h1 class="error-text text-primary">404</h1>
                            <h4 class="mt-4"><i class="fa fa-thumbs-down text-danger"></i>Pas trouvé</h4>
                            <p>Document non trouvé</p>
                            <form class="mt-5 mb-5">
                                <div class="text-center mb-4 mt-4"><a href="${pageContext.request.contextPath}" class="btn btn-primary">Retour à la page d'accueil</a></div>
                            </form>
                            <div class="text-center">
                                <ul class="list-inline">
                                    <li class="list-inline-item"><a href="https://www.facebook.com/QAbdelkrimYT" class="btn btn-facebook"><i class="fa fa-facebook"></i></a></li>
                                    <li class="list-inline-item"><a href="https://github.com/AbdelkrimYT" class="btn btn-linkedin"><i class="fa fa-github"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/public/plugins/common/common.min.js"></script>
<script src="${pageContext.request.contextPath}/public/js/custom.min.js"></script>
<script src="${pageContext.request.contextPath}/public/js/settings.js"></script>
<script src="${pageContext.request.contextPath}/public/js/gleek.js"></script>
<script src="${pageContext.request.contextPath}/public/js/styleSwitcher.js"></script>
</body>
</html>





