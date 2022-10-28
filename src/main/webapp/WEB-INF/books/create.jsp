<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/dashboard">Tableau de bord</a></li>
                <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/dashboard/books">Livres</a></li>
                <li class="breadcrumb-item active"><a>Créer</a></li>
            </ol>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Créer un nouvel livre</h4>
                        <div class="basic-form">
                            <form action="${pageContext.request.contextPath}/dashboard/books/create" method="post">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Titre</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="book-title" class="form-control" placeholder="Titre" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Domaine</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="book-domain" class="form-control" placeholder="Domaine" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Nombre de Pages</label>
                                    <div class="col-sm-10">
                                        <input type="number" name="book-number-of-pages" class="form-control" min="0" placeholder="Nombre de Pages" autocomplete="off">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Résumé</label>
                                    <div class="col-sm-10">
                                        <textarea name="book-resume" class="form-control h-150px" rows="6" id="comment" autocomplete="off"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-dark">Créer</button>
                                        <a class="btn btn-light" href="${pageContext.request.contextPath}/dashboard/books">Annuler</a>
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