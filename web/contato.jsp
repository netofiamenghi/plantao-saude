<%-- 
    Document   : index
    Created on : 24/11/2016, 10:00:12
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
        <title>Plantão Saúde - Contato</title>
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
            <h1 class="page-header">Contato</h1>
            <h3 class="text-success">${mensagem}</h3>
            <form action="ContatoCtr" method="POST">
                <div class="form-group">
                    <label for="nome">Nome</label>
                    <input class="form-control" name="nome" id="nome" value="${contato.nome}" required="true"/>
                </div>
                <div class="form-group">
                    <label for="telefone">Telefone</label>
                    <input type="tel" class="form-control" name="telefone" id="telefone" value="${contato.telefone}" required="true"/>
                </div>
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <input type="email" class="form-control" name="email" id="email" value="${contato.email}" required="true"/>
                </div>
                <div class="form-group">
                    <label for="mensagem">Mensagem</label>
                    <textarea name="mensagem" id="mensagem" class="form-control" rows="5" required="true">${contato.mensagem}</textarea>
                </div>
                <input type="submit" class="btn btn-default" value="Enviar"/>
                <input type="reset" class="btn btn-default" value="Limpar"/>
            </form>
        </section>
        <jsp:include page="rodape.jsp"></jsp:include>
    </body>
</html>
