<%-- 
    Document   : listarUsuario
    Created on : 27/10/2016, 10:00:04
    Author     : neto
--%>
<%@page import="com.plantaosaude.modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Listar Usuários - Plantão Saúde</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="cabecalho.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Gerenciar Usuários</h1>
                    </div>
                    <div class="col-lg-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Usuários Cadastrados
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Código</th>
                                                <th>Nome</th>
                                                <th>Tipo</th>
                                                <th>Status</th>
                                                <th>Alterar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${usuarios}" var="usuario">
                                                <tr>
                                                    <td>${usuario.id}</td>
                                                    <td>${usuario.nome}</td>
                                                    <td>${usuario.tipo}</td>
                                                    <td>${usuario.status == '1' ? '<i class="fa fa-check"></i>':'<i class="fa fa-times"></i>'}</td>
                                                    <td><a href="CarregarUsuario?id=${usuario.id}"><i class="fa fa-pencil"></i></a></td>
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
