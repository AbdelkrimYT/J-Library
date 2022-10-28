<%@ page import="com.abdelkrim.sgb.Models.Author" %>
<%@ page import="com.abdelkrim.sgb.Models.Book" %>
<%@ page import="java.util.List" %>
<%@ include file="..//layouts/app_begin.jsp"%>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/dashboard/auteurs">Auteurs</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <h4>Attacher un livre</h4>
                        </div>
                        <div class="basic-form">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">ID</label>
                                <div class="col-sm-10">
                                    <label class="col-form-label"><%= request.getParameter("id") %></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Nom</label>
                                <div class="col-sm-10">
                                    <label class="col-form-label"><%= ((Author) request.getAttribute("author")).lastName %></label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Prénom</label>
                                <div class="col-sm-10">
                                    <label class="col-form-label"><%= ((Author) request.getAttribute("author")).firstName %></label>
                                </div>
                            </div>
                            <form action='${pageContext.request.contextPath}/dashboard/attachment?action=attach' method="post">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Sélectionner un livre</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="book-id">
                                            <% for (Book book : (List<Book>) request.getAttribute("books-to")) { %>
                                                <option value='<%= book.id %>'><%= book.title + ", " + book.domain %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <input type="hidden" name="author-id" value='<%= request.getAttribute("author-id") %>'>
                                    <button type="submit" class="btn btn-primary">Attacher<span class="btn-icon-right"><i class="fa fa-link"></i></span></button>
                                    <a class="btn btn-light" href='${pageContext.request.contextPath}/dashboard/authors/edit?id=<%= request.getParameter("id") %>'>Annuler</a>
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