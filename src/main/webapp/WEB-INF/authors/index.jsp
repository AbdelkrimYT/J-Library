<%@ page import="com.abdelkrim.sgb.Models.Author" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a>Auteurs</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <a href="${pageContext.request.contextPath}/dashboard/authors/create" class="btn btn-primary float-right" role="button">Créer Auteur<span class="btn-icon-right"><i class="fa fa-plus"></i></span></a>
                    </div>
                    <div class="card-body">
                        <div class="card-title">
                            <h4>Table Auteurs</h4>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Date de Naissance</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% if (((ArrayList<Author>) request.getAttribute("auteurs")).size() > 0) { %>
                                    <% for (Author author : (List<Author>) request.getAttribute("auteurs")) { %>
                                    <tr>
                                        <td><%= author.id %></td>
                                        <td><%= author.lastName %></td>
                                        <td><%= author.firstName %></td>
                                        <td><%= author.dateOfBirth %></td>
                                        <td>
                                            <div class="float-right">
                                                <form action="${pageContext.request.contextPath}/dashboard/authors" method="post">
                                                    <a href='${pageContext.request.contextPath}/dashboard/authors/show?id=<%= author.id %>' class="btn mb-1 btn-primary btn-sm" role="button">Voir<span class="btn-icon-right"><i class="fa fa-eye"></i></span></a>
                                                    <a href='${pageContext.request.contextPath}/dashboard/authors/edit?id=<%= author.id %>' class="btn mb-1 btn-info btn-sm" role="button">Éditer<span class="btn-icon-right"><i class="fa fa-edit"></i></span></a>
                                                    <button type="submit" class="btn mb-1 btn-danger btn-sm">Supprimer<span class="btn-icon-right"><i class="fa fa-trash"></i></span></button>
                                                    <input type="hidden" name="id" value='<%= author.id %>'>
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