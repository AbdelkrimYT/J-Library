<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Recherche un livre</title>
    <link href="${pageContext.request.contextPath}/public/ibtissam/css/cssrecherche.css" rel="stylesheet" type="text/css"/>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Lato');
        body {
            background-image: url("${pageContext.request.contextPath}/public/ibtissam/pictures/backg.jpg");
            font: 13px 'Lucida sans', 'Arial', 'Helvetica';
        }

        a {
            color: #ccc;
        }

        .cf:before, .cf:after{
            content:"";
            display:table;
        }

        .cf:after{
            clear:both;
        }

        .cf{
            zoom:1;
        }

        /*-------------------------------------*/

        .form-wrapper {
            width: 450px;
            padding: 15px;
            margin: 150px auto 50px auto;
            background: #444;
            background: rgba(0,0,0,.2);
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
            -moz-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
            -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
            box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
        }

        .form-wrapper input {
            width: 330px;
            height: 20px;
            padding: 10px 5px;
            float: left;
            font: bold 15px 'lucida sans', 'trebuchet MS', 'Tahoma';
            border: 0;
            background: #eee;
            -moz-border-radius: 3px 0 0 3px;
            -webkit-border-radius: 3px 0 0 3px;
            border-radius: 3px 0 0 3px;
        }

        .form-wrapper input:focus {
            outline: 0;
            background: #fff;
            -moz-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
            -webkit-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
            box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
        }

        .form-wrapper input::-webkit-input-placeholder {
            color: #999;
            font-weight: normal;
            font-style: italic;
        }

        .form-wrapper input:-moz-placeholder {
            color: #999;
            font-weight: normal;
            font-style: italic;
        }

        .form-wrapper input:-ms-input-placeholder {
            color: #999;
            font-weight: normal;
            font-style: italic;
        }

        .form-wrapper button {
            overflow: visible;
            position: relative;
            float: right;
            border: 0;
            padding: 0;
            cursor: pointer;
            height: 40px;
            width: 110px;
            font: bold 15px/40px 'lucida sans', 'trebuchet MS', 'Tahoma';
            color: #fff;
            text-transform: uppercase;
            background: #d83c3c;
            -moz-border-radius: 0 3px 3px 0;
            -webkit-border-radius: 0 3px 3px 0;
            border-radius: 0 3px 3px 0;
            text-shadow: 0 -1px 0 rgba(0, 0 ,0, .3);
        }

        .form-wrapper button:hover{
            background: #e54040;
        }

        .form-wrapper button:active,
        .form-wrapper button:focus{
            background: #c42f2f;
        }

        .form-wrapper button:before {
            content: '';
            position: absolute;
            border-width: 8px 8px 8px 0;
            border-style: solid solid solid none;
            border-color: transparent #d83c3c transparent;
            top: 12px;
            left: -6px;
        }

        .form-wrapper button:hover:before{
            border-right-color: #e54040;
        }

        .form-wrapper button:focus:before{
            border-right-color: #c42f2f;
        }

        .form-wrapper button::-moz-focus-inner {
            border: 0;
            padding: 0;
        }
        .byline p{

            color:#c6c6c6;
            font: bold 18px Arial, Helvetica, Sans-serif;
            text-shadow: 0 2px 3px rgba(0,0,0,0.1);
        }

        .byline p a{
            color:#d83c3c;
            text-decoration:none;
        }

        .duu{
            background: #444;
            background: rgba(0,0,0,.2);
            text-align: center ;
            font-size: 30px;
        }
        h1{
            text-align: center;
        }

    </style>
</head>

<body>
    <h1>Rechercher un livre</h1>
    <form  action="${pageContext.request.contextPath}/search" method="get">
        <div class="form-wrapper cf">
            <input type="text" placeholder="Recherche ici..." name="search_value" required>
            <button type="submit">Recherche</button>
        </div>
        <div class="duu">


            <label for="titre">
                <input type="radio" name="search_for" value="book"  checked />
                Par Titre</label>
            <div class="check"></div>
            <br>

            <label for="auteur">
                <input type="radio" name="search_for" value="author"  checked />
                Par Auteur</label>
            <div class="check"></div>

            <br>
            <label for="domainer">
                <input type="radio" name="search_for" value="domain" checked/>
                Par Domaine</label>

            <div class="check"></div>
        </div>
    </form>
</body>
</html>
