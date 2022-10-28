<%@ page import="com.abdelkrim.sgb.Models.Author" %>
<%@ page import="com.abdelkrim.sgb.Models.Book" %>
<%@ page import="java.util.List" %>
<%@ include file="..//layouts/app_begin.jsp"%>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/dashboard/books">Livres</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <h4>Attacher un auteur</h4>
                        </div>
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
                                <label class="col-sm-2 col-form-label">Résumé</label>
                                <div class="col-sm-10">
                                    <label class="col-form-label"><%= ((Book) request.getAttribute("book")).resume %></label>
                                </div>
                            </div>
                            <form action='${pageContext.request.contextPath}/dashboard/attachment?action=attach' method="post">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Sélectionner un livre</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="author-id">
                                            <% for (Author author : (List<Author>) request.getAttribute("author-to")) { %>
                                                <option value='<%= author.id %>'><%= author.lastName + ", " + author.lastName %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <input type="hidden" name="book-id" value='<%= request.getAttribute("book-id") %>'>
                                    <button type="submit" class="btn btn-primary">Attacher<span class="btn-icon-right"><i class="fa fa-link"></i></span></button>
                                    <a class="btn btn-light" href='${pageContext.request.contextPath}/dashboard/books/edit?id=<%= request.getParameter("id") %>'>Annuler</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="..//layouts/app_end.jsp"%>