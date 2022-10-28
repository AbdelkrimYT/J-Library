<%@ page import="com.abdelkrim.sgb.Models.User" %>
<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/dashboard/users">Utilisateurs</a></li>
                <li class="breadcrumb-item active"><a>Éditer</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Éditer utilisateur</h4>
                        <div class="basic-form">
                            <form action='${pageContext.request.contextPath}/dashboard/users/edit?id=<%= request.getParameter("id") %>' method="post">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">ID</label>
                                    <div class="col-sm-10">
                                        <label class="col-sm-2 col-form-label"><%= request.getParameter("id") %></label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Nom d'utilisateur</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="username" class="form-control" placeholder="Nom d'utilisateur" value='<%= ((User) request.getAttribute("user")).username %>' autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Le mot de passe</label>
                                    <div class="col-sm-10">
                                        <input type="password" name="password" class="form-control" min="0" placeholder="Le mot de passe" value='<%= ((User) request.getAttribute("user")).password %>' autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-dark">Éditer</button>
                                        <a class="btn btn-light" href="${pageContext.request.contextPath}/dashboard/users">Annuler</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="..//layouts/app_end.jsp" %>