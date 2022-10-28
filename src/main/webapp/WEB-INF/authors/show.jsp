<%@ page import="com.abdelkrim.sgb.Models.Author" %>
<%@ page import="com.abdelkrim.sgb.Models.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/dashboard/authors">Auteurs</a></li>
                <li class="breadcrumb-item active"><a>Voir</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <h4>Détails de l'auteur</h4>
                        </div>
                        <div class="basic-form">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">ID</label>
                                <div class="col-sm-10">
                                    <label class="col-sm-2 col-form-label"><%= request.getParameter("id") %></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Nom</label>
                                <div class="col-sm-10">
                                    <label class="col-sm-2 col-form-label"><%= ((Author) request.getAttribute("author")).lastName %></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Prénom</label>
                                <div class="col-sm-10">
                                    <label class="col-sm-2 col-form-label"><%= ((Author) request.getAttribute("author")).firstName %></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Date de naissance</label>
                                <div class="col-sm-10">
                                    <label class="col-sm-2 col-form-label"><%= ((Author) request.getAttribute("author")).dateOfBirth %></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
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
                                </tr>
                                </thead>
                                <tbody>
                                <% if (((ArrayList<Book>) request.getAttribute("author-books")).size() > 0) { %>
                                    <% for (Book book : (List<Book>) request.getAttribute("author-books")) { %>
                                    <tr>
                                        <td><%= book.id %></td>
                                        <td><%= book.title %></td>
                                        <td><%= book.domain %></td>
                                        <td><%= book.numberOfPages %></td>
                                        <td><%= book.resume %></td>
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