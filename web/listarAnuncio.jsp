<%-- 
    Document   : listarAnuncio
    Created on : 07/11/2016, 16:18:50
    Author     : neto
--%>

<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Listar Anúncios - Plantão Saúde</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="cabecalho.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Gerenciar Anúncios</h1>
                    </div>
                    <div class="col-lg-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Anúncios Cadastrados
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Código</th>
                                                <th>Nome</th>
                                                <th>Alterar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${anuncios}" var="anuncio">
                                                <tr>
                                                    <td>${anuncio.id}</td>
                                                    <td>${anuncio.nome}</td>
                                                    <td><a href="CarregarAnuncio?id=${anuncio.id}"><i class="fa fa-pencil"></i></a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
