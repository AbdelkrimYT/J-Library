<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="h-100" lang="fr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Connexion</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
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
                <div class="form-input-content">
                    <div class="card login-form mb-0">
                        <div class="card-body pt-5">
                            <a class="text-center"> <h4>Système de gestion de bibliothèque</h4></a>

                            <form class="mt-5 mb-5 login-input" action="${pageContext.request.contextPath}/login" method="post">
                                <div class="form-group">
                                    <input type="text" name="username" class="form-control" placeholder="Username">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" class="form-control" placeholder="Password">
                                </div>
                                <button type="submit" class="btn login-form__btn submit w-100">Connexion</button>
                            </form>
                            <% if (request.getAttribute("error") != null) { %>
                                <p class="mt-5 login-form__footer" style="color: red"><%= request.getAttribute("error") %></p>
                            <% } %>
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
