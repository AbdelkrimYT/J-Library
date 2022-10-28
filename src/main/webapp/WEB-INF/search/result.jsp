<%@ page import="com.abdelkrim.sgb.Models.SearchResult" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat|Open+Sans|Roboto');

        body {
            background-image: url("${pageContext.request.contextPath}/public/ibtissam/picture/1.jpg");
        }

        * {
            margin:0;
            padding: 0;
            outline: 0;
        }

        .filter{
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            right: 0;
            z-index: 1;
            opacity: .7;
        }

        table {
            position: absolute;
            z-index: 2;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            box-shadow: 0 2px 15px rgba(64,64,64,.7);
            border-radius: 12px 12px 0 0;
            overflow: hidden;

        }

        td , th{
            padding: 5px 20px;
            text-align: center;


        }

        th{
            background-color: #E1701A;
            color: #fafafa;
            font-family: 'Open Sans',Sans-serif;
            font-weight: 200;
            text-transform: uppercase;
            width: fit-content;
        }

        tr{
            width: 100%;
            background-color: #fafafa;
            font-family: 'Montserrat', sans-serif;
        }

        tr:nth-child(even){
            background-color: #eeeeee;
        }

        h1{
            font-size:30px;text-align:center;
            letter-spacing:4px;max-width:390px;margin:0 auto;line-height:45px;padding:30px 0 0 0;
            color:#A5A5A5;text-shadow:1px 1px rgba(255, 255, 255, 0.34),-1px -1px #727272;border-bottom:1px dashed #A3A3A3;
            background-color:rgba(255,255,255,0.4);
        }
    </style>
</head>

<body>
<i class="fas fa-book-open"></i>
<h1>Resultat de votre Recherche:</h1>

<table>
    <thead>
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Date de naissance</th>
            <th>Titre</th>
            <th>Domaine</th>
            <th>Résumé</th>
            <th>Nombre du page</th>
        </tr>
    </thead>
    <tbody>
    <tr>
        <% if (((List<SearchResult>) request.getAttribute("search-results")).size() > 0) { %>
            <% for (SearchResult searchResult : (List<SearchResult>) request.getAttribute("search-results")) { %>
                <tr>
                    <td><%= searchResult.authorLastName %></td>
                    <td><%= searchResult.authorFirstName %></td>
                    <td><%= searchResult.authorDateOfBirth %></td>
                    <td><%= searchResult.bookTitle %></td>
                    <td><%= searchResult.bookDomain %></td>
                    <td><%= searchResult.bookResume %></td>
                    <td><%= searchResult.bookNumberOfPages %></td>
                <tr>
            <% } %>
        <% } %>
    </tr>
    </tbody>
</table>

</body>
</html>
