<%@ page import="com.abdelkrim.sgb.Models.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a>Livres</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <a href="${pageContext.request.contextPath}/dashboard/books/create" class="btn btn-primary float-right" role="button">Créer Livre<span class="btn-icon-right"><i class="fa fa-plus"></i></span></a>
                    </div>
                    <div class="card-body">
                        <div class="card-title">
                            <h4>Table Livres</h4>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Titre</th>
                                    <th>Domaine</th>
                                    <th>Nombre de Pages</th>
                                    <th>Résumé</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <% if (((ArrayList<Book>) request.getAttribute("books")).size() > 0) { %>
                                    <% for (Book book : (List<Book>) request.getAttribute("books")) { %>
                                        <tr>
                                            <td><%= book.id %></td>
                                            <td><%= book.title %></td>
                                            <td><%= book.domain %></td>
                                            <td><%= book.numberOfPages %></td>
                                            <td><%= book.resume %></td>
                                            <td>
                                                <div class="float-right">
                                                    <form action="${pageContext.request.contextPath}/dashboard/books" method="post">
                                                        <a href='${pageContext.request.contextPath}/dashboard/books/show?id=<%= book.id %>' class="btn mb-1 btn-primary btn-sm" role="button">Voir<span class="btn-icon-right"><i class="fa fa-eye"></i></span></a>
                                                        <a href='${pageContext.request.contextPath}/dashboard/books/edit?id=<%= book.id %>' class="btn mb-1 btn-info btn-sm" role="button">Éditer<span class="btn-icon-right"><i class="fa fa-edit"></i></span></a>
                                                        <button type="submit" class="btn mb-1 btn-danger btn-sm">Supprimer<span class="btn-icon-right"><i class="fa fa-trash"></i></span></button>
                                                        <input type="hidden" name="id" value='<%= book.id %>'>
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