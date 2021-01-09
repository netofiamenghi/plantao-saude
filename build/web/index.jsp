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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <title>Plantão Saúde - Página Inicial</title>
    </head>
    <body>
        <section class="col-lg-12 topo">
            <a href="index.jsp">
                <img id="logo-topo" class="img-responsive" src="img/plantao_saude_topo.png" alt="Plantão Saúde"/>
            </a>    
            <form class="form-inline formulario" action="listar-anuncio">
                <ul>
                    <li><input type="text" class="input-lg form-control" size="50" name="pesquisa" placeholder="Médicos, Dentistas, Planos de Saúde, Farmácias..."/></li>
                    <li><button type="submit">Enviar</button></li>
                </ul>
            </form>
        </section>
        <section class="col-lg-12 conteudo">
            <c:if test="${anuncios != null}">
                <h1 class="conteudo-h1">Encontramos os seguintes resultados</h1>
            </c:if>
            <c:forEach items="${anuncios}" var="anuncio">
                <section class="linha">
                    <div class="linha-imagem">
                        <img class="img-rounded" src="img_anuncio/droga-raia.jpg"/>
                    </div>
                    <div class="linha-nome-status">
                        <ul>
                            <li><span class="linha-nome-status-nome">${anuncio.nome}</span></li>
                            <li>
                                <c:choose>
                                    <c:when test="${anuncio.aberto == true}">
                                        <span class="linha-nome-status-desc">Aberto</span>
                                        <span class="glyphicon glyphicon-ok linha-nome-status-icone-ok"></span>   
                                    </c:when>
                                    <c:otherwise>
                                        <span class="linha-nome-status-desc">Fechado</span>
                                        <span class="glyphicon glyphicon-remove linha-nome-status-icone-remove"></span>   
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>

                    </div>
                    <div class="linha-icones">
                        <c:choose>
                            <c:when test="${anuncio.site != ''}">
                                <a href="http://${anuncio.site}" target="_blank" title="Ir para o site">
                                    <span class="glyphicon glyphicon-globe site"></span>
                                </a>        
                            </c:when>
                            <c:otherwise>
                                <span class="glyphicon glyphicon-globe site-inativo"></span>
                            </c:otherwise>
                        </c:choose>

                        <a href="https://www.google.com/maps/search/?api=1&query=${anuncio.localizacao}" target="_blank" title="Localizar no mapas">
                            <span class="glyphicon glyphicon-map-marker localizacao"></span>
                        </a>
                    </div>
                    <a href="#" title="Saiba mais">
                        <span class="glyphicon glyphicon-search mais"></span>
                    </a>
                </section>
            </c:forEach>
        </section>
        <jsp:include page="rodape.jsp"></jsp:include>
    </body>
</html>