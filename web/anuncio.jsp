<%-- 
    Document   : anuncio
    Created on : 07/11/2016, 15:19:18
    Author     : neto
--%>
<%@page import="com.plantaosaude.dao.CategoriaDao"%>
<%@page import="java.util.List"%>
<%@page import="com.plantaosaude.modelo.Cidade"%>
<%@page import="com.plantaosaude.dao.CidadeDao"%>
<%@page import="com.plantaosaude.dao.GenericDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Anúncio - Plantão Saúde</title>
        <script src="js/jquery.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            GenericDao cidadeDao = new CidadeDao();
            List<Object> cidades = cidadeDao.listar();

            GenericDao categoriaDao = new CategoriaDao();
            List<Object> categorias = categoriaDao.listar();
        %>
        <div id="wrapper">
            <jsp:include page="cabecalho.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Anúncio</h1>
                    </div>
                    <div class="col-lg-6">
                        ${mensagem}
                        <form role="form" action="AnuncioCtr" method="POST">
                            <div class="form-group">
                                <label>Código</label>
                                <input class="form-control" name="id" value="${anuncio.id}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Nome</label>
                                <input class="form-control" name="nome" value="${anuncio.nome}" required>
                            </div>
                            <div class="form-group">
                                <label>Razão Social</label>
                                <input type="text" class="form-control" name="razaoSocial" value="${anuncio.razaoSocial}" required>
                            </div>
                            <div class="form-group">
                                <label>CNPJ</label>
                                <input type="text" class="form-control" name="cnpj" value="${anuncio.cnpj}" required>
                            </div>
                            <div class="form-group">
                                <label>Endereço</label>
                                <input type="text" class="form-control" name="endereco" value="${anuncio.endereco}" required>
                            </div>
                            <div class="form-group">
                                <label>Número</label>
                                <input type="text" class="form-control" name="numero" value="${anuncio.numero}" required>
                            </div>
                            <div class="form-group">
                                <label>Bairro</label>
                                <input type="text" class="form-control" name="bairro" value="${anuncio.bairro}" required>
                            </div>
                            <div class="form-group">
                                <label>Complemento</label>
                                <input type="text" class="form-control" name="complemento" value="${anuncio.complemento}">
                            </div>
                            <div class="form-group">
                                <label>Cidade</label>
                                <select name="cidade" class="form-control">
                                    <c:forEach items="<%=cidades%>" var="cidade">
                                        <option value="${cidade.id}" ${cidade.id == anuncio.cidade.id ? 'selected' : ''}>${cidade.nome}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Localização (Ex: latitude,longetude)</label>
                                <input type="text" class="form-control" name="localizacao" value="${anuncio.localizacao}" required>
                            </div>
                            <div class="form-group">
                                <label>E-mail</label>
                                <input type="email" class="form-control" name="email" value="${anuncio.email}">
                            </div>
                            <div class="form-group">
                                <label>Site</label>
                                <input type="text" class="form-control" name="site" value="${anuncio.site}">
                            </div>
                            <div class="form-group">
                                <label>Imagem</label>
                                <input type="file" id="imagem" name="imagem" value="${anuncio.imagem}" onchange="uploadLogo('#img-imagem', '#imagem');">
                                <img src="" id="img-imagem" width="200" height="200"/>
                            </div>
                            <div class="form-group">
                                <label>Logo</label>
                                <input type="file" id="logo" name="logo" value="${anuncio.logo}" onchange="uploadLogo('#img-logo', '#logo');" required>
                                <img src="" id="img-logo" width="200" height="200"/>
                            </div>
                            <div class="form-group">
                                <label>Categoria</label>
                                <select name="categoria" class="form-control">
                                    <c:forEach items="<%=categorias%>" var="categoria">
                                        <option value="${categoria.id}" ${categoria.id == anuncio.categoria.id ? 'selected' : ''}>${categoria.descricao}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Domingo - Início</label>
                                <select name="domingo_inicio" class="form-control">
                                    <option value="1" ${anuncio.domingoInicio == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.domingoInicio == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.domingoInicio == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.domingoInicio == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.domingoInicio == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.domingoInicio == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.domingoInicio == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.domingoInicio == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.domingoInicio == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.domingoInicio == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.domingoInicio == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.domingoInicio == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.domingoInicio == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.domingoInicio == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.domingoInicio == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.domingoInicio == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.domingoInicio == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.domingoInicio == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.domingoInicio == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.domingoInicio == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.domingoInicio == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.domingoInicio == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.domingoInicio == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.domingoInicio == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Domingo - Término</label>
                                <select name="domingo_termino" class="form-control">
                                    <option value="1" ${anuncio.domingoTermino == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.domingoTermino == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.domingoTermino == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.domingoTermino == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.domingoTermino == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.domingoTermino == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.domingoTermino == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.domingoTermino == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.domingoTermino == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.domingoTermino == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.domingoTermino == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.domingoTermino == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.domingoTermino == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.domingoTermino == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.domingoTermino == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.domingoTermino == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.domingoTermino == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.domingoTermino == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.domingoTermino == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.domingoTermino == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.domingoTermino == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.domingoTermino == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.domingoTermino == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.domingoTermino == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Segunda - Início</label>
                                <select name="segunda_inicio" class="form-control">
                                    <option value="1" ${anuncio.segundaInicio == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.segundaInicio == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.segundaInicio == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.segundaInicio == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.segundaInicio == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.segundaInicio == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.segundaInicio == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.segundaInicio == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.segundaInicio == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.segundaInicio == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.segundaInicio == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.segundaInicio == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.segundaInicio == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.segundaInicio == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.segundaInicio == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.segundaInicio == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.segundaInicio == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.segundaInicio == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.segundaInicio == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.segundaInicio == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.segundaInicio == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.segundaInicio == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.segundaInicio == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.segundaInicio == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Segunda - Término</label>
                                <select name="segunda_termino" class="form-control">
                                    <option value="1" ${anuncio.segundaTermino == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.segundaTermino == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.segundaTermino == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.segundaTermino == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.segundaTermino == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.segundaTermino == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.segundaTermino == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.segundaTermino == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.segundaTermino == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.segundaTermino == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.segundaTermino == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.segundaTermino == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.segundaTermino == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.segundaTermino == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.segundaTermino == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.segundaTermino == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.segundaTermino == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.segundaTermino == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.segundaTermino == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.segundaTermino == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.segundaTermino == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.segundaTermino == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.segundaTermino == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.segundaTermino == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Terça - Início</label>
                                <select name="terca_inicio" class="form-control">
                                    <option value="1" ${anuncio.tercaInicio == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.tercaInicio == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.tercaInicio == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.tercaInicio == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.tercaInicio == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.tercaInicio == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.tercaInicio == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.tercaInicio == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.tercaInicio == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.tercaInicio == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.tercaInicio == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.tercaInicio == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.tercaInicio == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.tercaInicio == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.tercaInicio == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.tercaInicio == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.tercaInicio == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.tercaInicio == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.tercaInicio == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.tercaInicio == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.tercaInicio == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.tercaInicio == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.tercaInicio == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.tercaInicio == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Terça - Término</label>
                                <select name="terca_termino" class="form-control">
                                    <option value="1" ${anuncio.tercaTermino == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.tercaTermino == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.tercaTermino == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.tercaTermino == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.tercaTermino == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.tercaTermino == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.tercaTermino == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.tercaTermino == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.tercaTermino == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.tercaTermino == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.tercaTermino == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.tercaTermino == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.tercaTermino == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.tercaTermino == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.tercaTermino == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.tercaTermino == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.tercaTermino == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.tercaTermino == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.tercaTermino == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.tercaTermino == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.tercaTermino == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.tercaTermino == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.tercaTermino == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.tercaTermino == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Quarta - Início</label>
                                <select name="quarta_inicio" class="form-control">
                                    <option value="1" ${anuncio.quartaInicio == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.quartaInicio == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.quartaInicio == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.quartaInicio == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.quartaInicio == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.quartaInicio == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.quartaInicio == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.quartaInicio == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.quartaInicio == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.quartaInicio == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.quartaInicio == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.quartaInicio == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.quartaInicio == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.quartaInicio == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.quartaInicio == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.quartaInicio == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.quartaInicio == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.quartaInicio == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.quartaInicio == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.quartaInicio == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.quartaInicio == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.quartaInicio == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.quartaInicio == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.quartaInicio == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Quarta - Término</label>
                                <select name="quarta_termino" class="form-control">
                                    <option value="1" ${anuncio.quartaTermino == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.quartaTermino == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.quartaTermino == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.quartaTermino == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.quartaTermino == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.quartaTermino == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.quartaTermino == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.quartaTermino == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.quartaTermino == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.quartaTermino == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.quartaTermino == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.quartaTermino == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.quartaTermino == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.quartaTermino == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.quartaTermino == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.quartaTermino == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.quartaTermino == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.quartaTermino == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.quartaTermino == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.quartaTermino == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.quartaTermino == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.quartaTermino == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.quartaTermino == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.quartaTermino == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Quinta - Início</label>
                                <select name="quinta_inicio" class="form-control">
                                    <option value="1" ${anuncio.quintaInicio == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.quintaInicio == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.quintaInicio == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.quintaInicio == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.quintaInicio == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.quintaInicio == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.quintaInicio == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.quintaInicio == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.quintaInicio == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.quintaInicio == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.quintaInicio == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.quintaInicio == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.quintaInicio == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.quintaInicio == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.quintaInicio == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.quintaInicio == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.quintaInicio == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.quintaInicio == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.quintaInicio == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.quintaInicio == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.quintaInicio == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.quintaInicio == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.quintaInicio == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.quintaInicio == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Quinta - Término</label>
                                <select name="quinta_termino" class="form-control">
                                    <option value="1" ${anuncio.quintaTermino == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.quintaTermino == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.quintaTermino == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.quintaTermino == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.quintaTermino == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.quintaTermino == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.quintaTermino == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.quintaTermino == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.quintaTermino == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.quintaTermino == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.quintaTermino == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.quintaTermino == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.quintaTermino == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.quintaTermino == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.quintaTermino == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.quintaTermino == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.quintaTermino == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.quintaTermino == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.quintaTermino == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.quintaTermino == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.quintaTermino == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.quintaTermino == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.quintaTermino == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.quintaTermino == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sexta - Início</label>
                                <select name="sexta_inicio" class="form-control">
                                    <option value="1" ${anuncio.sextaInicio == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.sextaInicio == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.sextaInicio == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.sextaInicio == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.sextaInicio == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.sextaInicio == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.sextaInicio == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.sextaInicio == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.sextaInicio == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.sextaInicio == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.sextaInicio == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.sextaInicio == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.sextaInicio == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.sextaInicio == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.sextaInicio == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.sextaInicio == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.sextaInicio == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.sextaInicio == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.sextaInicio == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.sextaInicio == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.sextaInicio == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.sextaInicio == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.sextaInicio == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.sextaInicio == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sexta - Término</label>
                                <select name="sexta_termino" class="form-control">
                                    <option value="1" ${anuncio.sextaTermino == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.sextaTermino == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.sextaTermino == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.sextaTermino == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.sextaTermino == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.sextaTermino == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.sextaTermino == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.sextaTermino == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.sextaTermino == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.sextaTermino == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.sextaTermino == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.sextaTermino == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.sextaTermino == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.sextaTermino == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.sextaTermino == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.sextaTermino == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.sextaTermino == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.sextaTermino == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.sextaTermino == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.sextaTermino == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.sextaTermino == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.sextaTermino == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.sextaTermino == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.sextaTermino == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sábado - Início</label>
                                <select name="sabado_inicio" class="form-control">
                                    <option value="1" ${anuncio.sabadoInicio == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.sabadoInicio == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.sabadoInicio == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.sabadoInicio == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.sabadoInicio == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.sabadoInicio == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.sabadoInicio == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.sabadoInicio == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.sabadoInicio == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.sabadoInicio == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.sabadoInicio == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.sabadoInicio == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.sabadoInicio == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.sabadoInicio == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.sabadoInicio == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.sabadoInicio == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.sabadoInicio == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.sabadoInicio == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.sabadoInicio == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.sabadoInicio == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.sabadoInicio == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.sabadoInicio == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.sabadoInicio == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.sabadoInicio == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sábado - Término</label>
                                <select name="sabado_termino" class="form-control">
                                    <option value="1" ${anuncio.sabadoTermino == "1" ? "selected" : ""}>01h</option>
                                    <option value="2" ${anuncio.sabadoTermino == "2" ? "selected" : ""}>02h</option>
                                    <option value="3" ${anuncio.sabadoTermino == "3" ? "selected" : ""}>03h</option>
                                    <option value="4" ${anuncio.sabadoTermino == "4" ? "selected" : ""}>04h</option>
                                    <option value="5" ${anuncio.sabadoTermino == "5" ? "selected" : ""}>05h</option>
                                    <option value="6" ${anuncio.sabadoTermino == "6" ? "selected" : ""}>06h</option>
                                    <option value="7" ${anuncio.sabadoTermino == "7" ? "selected" : ""}>07h</option>
                                    <option value="8" ${anuncio.sabadoTermino == "8" ? "selected" : ""}>08h</option>
                                    <option value="9" ${anuncio.sabadoTermino == "9" ? "selected" : ""}>09h</option>
                                    <option value="10" ${anuncio.sabadoTermino == "10" ? "selected" : ""}>10h</option>
                                    <option value="11" ${anuncio.sabadoTermino == "11" ? "selected" : ""}>11h</option>
                                    <option value="12" ${anuncio.sabadoTermino == "12" ? "selected" : ""}>12h</option>
                                    <option value="13" ${anuncio.sabadoTermino == "13" ? "selected" : ""}>13h</option>
                                    <option value="14" ${anuncio.sabadoTermino == "14" ? "selected" : ""}>14h</option>
                                    <option value="15" ${anuncio.sabadoTermino == "15" ? "selected" : ""}>15h</option>
                                    <option value="16" ${anuncio.sabadoTermino == "16" ? "selected" : ""}>16h</option>
                                    <option value="17" ${anuncio.sabadoTermino == "17" ? "selected" : ""}>17h</option>
                                    <option value="18" ${anuncio.sabadoTermino == "18" ? "selected" : ""}>18h</option>
                                    <option value="19" ${anuncio.sabadoTermino == "19" ? "selected" : ""}>19h</option>
                                    <option value="20" ${anuncio.sabadoTermino == "20" ? "selected" : ""}>20h</option>
                                    <option value="21" ${anuncio.sabadoTermino == "21" ? "selected" : ""}>21h</option>
                                    <option value="22" ${anuncio.sabadoTermino == "22" ? "selected" : ""}>22h</option>
                                    <option value="23" ${anuncio.sabadoTermino == "23" ? "selected" : ""}>23h</option>
                                    <option value="24" ${anuncio.sabadoTermino == "24" ? "selected" : ""}>24h</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="optionsRadiosInline1" value="1" 
                                           ${anuncio.status == '1' ? 'checked' : ''} required>Ativo
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="optionsRadiosInline2" value="0"
                                           ${anuncio.status == '0' ? 'checked' : ''}>Inativo
                                </label>
                            </div>
                            <button type="submit" class="btn btn-default">Enviar</button>
                            <button type="reset" class="btn btn-default">Limpar</button>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                function uploadLogo(img, arquivo) {
                    var target = document.querySelector(img);
                    var file = document.querySelector(arquivo).files[0];
                    var reader = new FileReader();

                    reader.onloadend = function () {
                        target.src = reader.result;
                    };

                    if (file) {
                        reader.readAsDataURL(file);

                        // upload ajax
                        // método ajax do jquery
                        $.ajax({
                            method: "POST",
                            url: "fileUpload",
                            data: { fileUpload: target.src }
                        }).done(function (response) {
                            alert("Sucesso " + response);
                        }).fail(function (xhr, status, errorThrown) {
                            alert("Error " + xhr.responseText);
                        });
                        // fim upload ajax
                        
                    } else {
                        target.src = "";
                    }
                }
            </script>
    </body>
</html>