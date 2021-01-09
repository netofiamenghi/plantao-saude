<%-- 
    Document   : como-funciona
    Created on : 19/06/2017, 10:42:12
    Author     : neto fiamenghi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="img/plantao_saude.png"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <title>Plantão Saúde - Como Funciona</title>
    </head>
    <body>
        <section class="col-lg-12 topo">
            <a href="index.jsp">
                <img id="logo-topo" src="img/plantao_saude_topo.png" alt="Plantão Saúde"/>
            </a>    
            <form class="form-inline formulario" action="listar-anuncio">
                <ul>
                    <li><input type="text" class="input-lg form-control" size="50" name="pesquisa" placeholder="Médicos, Dentistas, Planos de Saúde, Farmácias..."/></li>
                    <li><button type="submit">Enviar</button></li>
                </ul>
            </form>
        </section>
        <section class="col-lg-offset-3 col-lg-6 form-conteudo">
            <h1 class="page-header">Como funciona</h1>
        </section>
        <jsp:include page="rodape.jsp"></jsp:include>
    </body>
</html>