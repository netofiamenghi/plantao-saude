<%-- 
    Document   : categoria
    Created on : 02/11/2016, 11:57:08
    Author     : neto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Categoria - Plantão Saúde</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="cabecalho.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Categoria</h1>
                    </div>
                    <div class="col-lg-10">
                        ${mensagem}
                        <form role="form" enctype="multipart/form-data" action="CategoriaCtr" method="POST">
                            <div class="form-group">
                                <label>Código</label>
                                <input class="form-control" name="id" value="${categoria.id}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Descrição</label>
                                <input class="form-control" name="descricao" value="${categoria.descricao}" required>
                            </div>
                            <div class="form-group">
                                <label>Imagem</label>
                                <input type="file" name="imagem" value="${categoria.imagem}"/>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="optionsRadiosInline1" value="1" 
                                           ${categoria.status == '1' ? 'checked' : ''} required>Ativo
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="optionsRadiosInline2" value="0"
                                           ${categoria.status == '0' ? 'checked' : ''}>Inativo
                                </label>
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

