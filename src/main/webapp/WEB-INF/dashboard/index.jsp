<%@ include file="..//layouts/app_begin.jsp" %>

<div class="content-body">
    <div class="container-fluid mt-3">
        <div class="row">
            <div class="col-lg-4 col-sm-6">
                <div class="card gradient-1">
                    <div class="card-body">
                        <h3 class="card-title text-white">Nombre d'utilisateurs</h3>
                        <div class="d-inline-block">
                            <h2 class="text-white"><%= request.getAttribute("users-count") %></h2>
                        </div>
                        <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="card gradient-2">
                    <div class="card-body">
                        <h3 class="card-title text-white">Nombre d'auteurs</h3>
                        <div class="d-inline-block">
                            <h2 class="text-white"><%= request.getAttribute("auteurs-count") %></h2>
                        </div>
                        <span class="float-right display-5 opacity-5"><i class="fa fa-pencil"></i></span>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="card gradient-3">
                    <div class="card-body">
                        <h3 class="card-title text-white">Nombre de livres</h3>
                        <div class="d-inline-block">
                            <h2 class="text-white"><%= request.getAttribute("books-count") %></h2>
                        </div>
                        <span class="float-right display-5 opacity-5"><i class="fa fa-book"></i></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="..//layouts/app_end.jsp" %>