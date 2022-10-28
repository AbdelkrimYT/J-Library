<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Système de gestion de bibliothèque</title>
    <link href="${pageContext.request.contextPath}/public/ibtissam/css/css_index.css" rel="stylesheet" type="text/css"/>
    <style>
        body{
            background: url(${pageContext.request.contextPath}/public/ibtissam/pictures/1.jpg) no-repeat;
            background-size:cover ;
            margin: 0px;
        }
        .input-box input[type="text"],.input-box input[type="password"]{
            background: none;
            border: none;
            outline: none;
            padding: 20px;
            width: 80%;
            color: white;
            transition: 1s;
            font-size: 15px;
        }
    </style>
</head>
<body>
    <div>
        <header>
            <div>
                <ul>
                    <li><a class="active" href="${pageContext.request.contextPath}">Accueil</a></li>
                    <li><a href="${pageContext.request.contextPath}/search">Recherche</a></li>
                    <li><a href="${pageContext.request.contextPath}/login">Connexion</a></li>
                </ul>
            </div>
        </header>
    </div>
    </div>
</body>
</html>
