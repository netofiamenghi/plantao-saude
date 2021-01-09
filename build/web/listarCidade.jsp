<%-- 
    Document   : listarCidade
    Created on : 02/11/2016, 10:59:17
    Author     : neto
--%>

<%@page import="com.plantaosaude.modelo.Cidade"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Listar Cidades - Plantão Saúde</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="cabecalho.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Gerenciar Cidades</h1>
                    </div>
                    <div class="col-lg-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Cidades Cadastradas
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Código</th>
                                                <th>Nome</th>
                                                <th>CEP</th>
                                                <th>Estado</th>
                                                <th>Alterar</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${cidades}" var="cidade">
                                                <tr>
                                                    <td>${cidade.id}</td>
                                                    <td>${cidade.nome}</td>
                                                    <td>${cidade.cep}</td>
                                                    <td>${cidade.estado}</td>
                                                    <td><a href="CarregarCidade?id=${cidade.id}"><i class="fa fa-pencil"></i></a></td>
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
