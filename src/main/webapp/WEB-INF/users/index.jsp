<%@ page import="com.abdelkrim.sgb.Models.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.abdelkrim.sgb.Models.User" %>
<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a>Utilisateur</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <a href="${pageContext.request.contextPath}/dashboard/users/create" class="btn btn-primary float-right" role="button">Créer un utilisateur<span class="btn-icon-right"><i class="fa fa-plus"></i></span></a>
                    </div>
                    <div class="card-body">
                        <div class="card-title">
                            <h4>Table Utilisateur</h4>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nom d'utilisateur</th>
                                    <th>Le mot de passe</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% if (((ArrayList<User>) request.getAttribute("users")).size() > 0) { %>
                                    <% for (User user : (List<User>) request.getAttribute("users")) { %>
                                    <tr>
                                        <td><%= user.id %></td>
                                        <td><%= user.username %></td>
                                        <td><%= user.password %></td>
                                        <td>
                                            <div class="float-right">
                                                <form action="${pageContext.request.contextPath}/dashboard/users" method="post">
                                                    <a href='${pageContext.request.contextPath}/dashboard/users/show?id=<%= user.id %>' class="btn mb-1 btn-primary btn-sm" role="button">Voir<span class="btn-icon-right"><i class="fa fa-eye"></i></span></a>
                                                    <a href='${pageContext.request.contextPath}/dashboard/users/edit?id=<%= user.id %>' class="btn mb-1 btn-info btn-sm" role="button">Éditer<span class="btn-icon-right"><i class="fa fa-edit"></i></span></a>
                                                    <button type="submit" class="btn mb-1 btn-danger btn-sm">Supprimer<span class="btn-icon-right"><i class="fa fa-trash"></i></span></button>
                                                    <input type="hidden" name="id" value='<%= user.id %>'>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                    <% } %>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="..//layouts/app_end.jsp" %>