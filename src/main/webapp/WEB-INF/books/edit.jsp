<%@ page import="com.abdelkrim.sgb.Models.Author" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.abdelkrim.sgb.Models.Book" %>
<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/dashboard/books">Livres</a></li>
                <li class="breadcrumb-item active"><a>Éditer</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Éditer livre</h4>
                        <div class="basic-form">
                            <form action='${pageContext.request.contextPath}/dashboard/books/edit?id=<%= request.getParameter("id") %>' method="post">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">ISSN</label>
                                    <div class="col-sm-10">
                                        <label><%= request.getParameter("id") %></label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Titre</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="book-title" class="form-control" placeholder="Titre" value='<%= ((Book) request.getAttribute("book")).title %>' autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Domaine</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="book-domain" class="form-control" placeholder="Domaine" value='<%= ((Book) request.getAttribute("book")).domain %>' autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Nombre de Pages</label>
                                    <div class="col-sm-10">
                                        <input type="number" name="book-number-of-pages" class="form-control" min="0" placeholder="Nombre de Pages" value='<%= ((Book) request.getAttribute("book")).numberOfPages %>' autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Résumé</label>
                                    <div class="col-sm-10">
                                        <textarea name="book-resume" class="form-control h-150px" rows="6" id="comment" autocomplete="off"><%= ((Book) request.getAttribute("book")).resume %></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-dark">Éditer</button>
                                        <a class="btn btn-light" href="${pageContext.request.contextPath}/dashboard/books">Annuler</a>
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
                        <a href='${pageContext.request.contextPath}/dashboard/attachment?view=book&id=<%= request.getParameter("id") %>' class="btn btn-primary float-right" role="button">Attacher un livre<span class="btn-icon-right"><i class="fa fa-link"></i></span></a>
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
                                <% if (((ArrayList<Author>) request.getAttribute("book-authors")).size() > 0) { %>
                                    <% for (Author author : (List<Author>) request.getAttribute("book-authors")) { %>
                                        <tr>
                                            <td><%= author.id %></td>
                                            <td><%= author.lastName %></td>
                                            <td><%= author.firstName %></td>
                                            <td><%= author.dateOfBirth %></td>
                                            <td>
                                                <div class="float-right">
                                                    <form action='${pageContext.request.contextPath}/dashboard/attachment?action=unattach' method="post">
                                                        <input type="hidden" name="author-id" value='<%= author.id %>'>
                                                        <input type="hidden" name="book-id" value='<%= ((Book) request.getAttribute("book")).id %>'>
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