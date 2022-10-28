<%@ page import="com.abdelkrim.sgb.Models.Book" %>
<%@ page import="com.abdelkrim.sgb.Models.Author" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/dashboard/books">Livres</a></li>
                <li class="breadcrumb-item active"><a>Voir</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Détails de livre</h4>
                        <div class="basic-form">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">ISSN</label>
                                <div class="col-sm-10">
                                    <label class="col-form-label"><%= request.getParameter("id") %></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Titre</label>
                                <div class="col-sm-10">
                                    <label class="col-form-label"><%= ((Book) request.getAttribute("book")).title %></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Domaine</label>
                                <div class="col-sm-10">
                                    <label class="col-form-label"><%= ((Book) request.getAttribute("book")).domain %></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Nombre de Pages</label>
                                <div class="col-sm-10">
                                    <label class="col-form-label"><%= ((Book) request.getAttribute("book")).numberOfPages %></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Résumé</label>
                                <div class="col-sm-10">
                                    <label class="col-form-label"><%= ((Book) request.getAttribute("book")).resume %></label>
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
                                </tr>
                                </thead>
                                <tbody>
                                <% if (((ArrayList<Author>) request.getAttribute("book-auteurs")).size() > 0) { %>
                                    <% for (Author author : (List<Author>) request.getAttribute("book-auteurs")) { %>
                                    <tr>
                                        <td><%= author.id %></td>
                                        <td><%= author.lastName %></td>
                                        <td><%= author.firstName %></td>
                                        <td><%= author.dateOfBirth %></td>
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