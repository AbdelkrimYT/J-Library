<%@ page import="com.abdelkrim.sgb.Models.Author" %>
<%@ page import="com.abdelkrim.sgb.Models.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/dashboard/authors">Auteurs</a></li>
                <li class="breadcrumb-item active"><a>Éditer</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Éditer auteur</h4>
                        <div class="basic-form">
                            <form action='${pageContext.request.contextPath}/dashboard/authors/edit?id=<%= request.getParameter("id") %>' method="post">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">ID</label>
                                    <div class="col-sm-10">
                                        <label><%= request.getParameter("id") %></label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Nom</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="author-last-name" class="form-control" placeholder="Nom" value='<%= ((Author) request.getAttribute("author")).lastName %>' autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Prénom</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="author-first-name" class="form-control" placeholder="Prénom" value='<%= ((Author) request.getAttribute("author")).firstName %>' autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Date de naissance</label>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <input type="text" name="author-date-of-birth" class="form-control mydatepicker" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd" value='<%= ((Author) request.getAttribute("author")).dateOfBirth %>' autocomplete="off">
                                            <span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-dark">Éditer</button>
                                        <a class="btn btn-light" href="${pageContext.request.contextPath}/dashboard/authors">Annuler</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <a href='${pageContext.request.contextPath}/dashboard/attachment?view=author&id=<%= request.getParameter("id") %>' class="btn btn-primary float-right" role="button">Attacher un livre<span class="btn-icon-right"><i class="fa fa-link"></i></span></a>
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
                                <% if (((ArrayList<Book>) request.getAttribute("author-books")).size() > 0) { %>
                                    <% for (Book book : (List<Book>) request.getAttribute("author-books")) { %>
                                    <tr>
                                        <td><%= book.id %></td>
                                        <td><%= book.title %></td>
                                        <td><%= book.domain %></td>
                                        <td><%= book.numberOfPages %></td>
                                        <td><%= book.resume %></td>
                                        <td>
                                            <div class="float-right">
                                                <form action='${pageContext.request.contextPath}/dashboard/attachment?action=unattach' method="post">
                                                    <input type="hidden" name="book-id" value='<%= book.id %>'>
                                                    <input type="hidden" name="author-id" value='<%= request.getAttribute("author-id") %>'>
                                                    <button type="submit" class="btn mb-1 btn-danger btn-sm">Détacher<span class="btn-icon-right"><i class="fa fa-unlink"></i></span></button>
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