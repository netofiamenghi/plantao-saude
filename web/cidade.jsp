<%-- 
    Document   : cidade
    Created on : 31/10/2016, 16:18:56
    Author     : neto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cidade - Plantão Saúde</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="cabecalho.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Cidade</h1>
                    </div>
                    <div class="col-lg-6">
                        ${mensagem}
                        <form role="form" action="CidadeCtr" method="POST">
                            <div class="form-group">
                                <label>Código</label>
                                <input class="form-control" name="id" value="${cidade.id}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Nome</label>
                                <input class="form-control" name="nome" value="${cidade.nome}" required>
                            </div>
                            <div class="form-group">
                                <label>CEP</label>
                                <input type="text" class="form-control" name="cep" value="${cidade.cep}" required>
                            </div>
                            <div class="form-group">
                                <label>Estado</label>
                                <select name="estado" class="form-control">
                                    <option value="AC" ${cidade.estado == 'AC' ? 'selected' : ''}>Acre</option>
                                    <option value="AL" ${cidade.estado == 'AL' ? 'selected' : ''}>Alagoas</option>
                                    <option value="AP" ${cidade.estado == 'AP' ? 'selected' : ''}>Amapá</option>
                                    <option value="AM" ${cidade.estado == 'AM' ? 'selected' : ''}>Amazonas</option>
                                    <option value="BA" ${cidade.estado == 'BA' ? 'selected' : ''}>Bahia</option>
                                    <option value="CE" ${cidade.estado == 'CE' ? 'selected' : ''}>Ceará</option>
                                    <option value="DF" ${cidade.estado == 'DF' ? 'selected' : ''}>Distrito Federal</option>
                                    <option value="ES" ${cidade.estado == 'ES' ? 'selected' : ''}>Espírito Santo</option>
                                    <option value="GO" ${cidade.estado == 'GO' ? 'selected' : ''}>Goiás</option>
                                    <option value="MA" ${cidade.estado == 'MA' ? 'selected' : ''}>Maranhão</option>
                                    <option value="MT" ${cidade.estado == 'MT' ? 'selected' : ''}>Mato Grosso</option>
                                    <option value="MS" ${cidade.estado == 'MS' ? 'selected' : ''}>Mato Grosso do Sul</option>
                                    <option value="MG" ${cidade.estado == 'MG' ? 'selected' : ''}>Minas Gerais</option>
                                    <option value="PA" ${cidade.estado == 'PA' ? 'selected' : ''}>Pará</option>
                                    <option value="PB" ${cidade.estado == 'PB' ? 'selected' : ''}>Paraíba</option>
                                    <option value="PR" ${cidade.estado == 'PR' ? 'selected' : ''}>Paraná</option>
                                    <option value="PE" ${cidade.estado == 'PE' ? 'selected' : ''}>Pernambuco</option>
                                    <option value="PI" ${cidade.estado == 'PI' ? 'selected' : ''}>Piauí</option>
                                    <option value="RJ" ${cidade.estado == 'RJ' ? 'selected' : ''}>Rio de Janeiro</option>
                                    <option value="RN" ${cidade.estado == 'RN' ? 'selected' : ''}>Rio Grande do Norte</option>
                                    <option value="RS" ${cidade.estado == 'RS' ? 'selected' : ''}>Rio Grande do Sul</option>
                                    <option value="RO" ${cidade.estado == 'RO' ? 'selected' : ''}>Rondônia</option>
                                    <option value="RR" ${cidade.estado == 'RR' ? 'selected' : ''}>Roraima</option>
                                    <option value="SC" ${cidade.estado == 'SC' ? 'selected' : ''}>Santa Catarina</option>
                                    <option value="SP" ${cidade.estado == 'SP' ? 'selected' : ''}>São Paulo</option>
                                    <option value="SE" ${cidade.estado == 'SE' ? 'selected' : ''}>Sergipe</option>
                                    <option value="TO" ${cidade.estado == 'TO' ? 'selected' : ''}>Tocantins</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-default">Enviar</button>
                            <button type="reset" class="btn btn-default">Limpar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
