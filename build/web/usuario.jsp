<%-- 
    Document   : usuario
    Created on : 27/10/2016, 10:00:04
    Author     : neto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Usuário - Plantão Saúde</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="cabecalho.jsp"/>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Usuário</h1>
                    </div>
                    <div class="col-lg-6">
                        ${mensagem}
                        <form role="form" action="UsuarioCtr" method="POST">
                            <div class="form-group">
                                <label>Código</label>
                                <input class="form-control" name="id" value="${usuario.id}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Nome</label>
                                <input class="form-control" name="nome" value="${usuario.nome}" required>
                            </div>
                            <div class="form-group">
                                <label>E-mail</label>
                                <input type="email" class="form-control" name="email" value="${usuario.email}" required>
                            </div>
                            <div class="form-group">
                                <label>Login</label>
                                <input class="form-control" name="login" value="${usuario.login}" required>
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <input type="password" class="form-control" name="senha" value="${usuario.senha}" required>
                            </div>
                            <div class="form-group">
                                <label>Tipo</label>
                                <label class="radio-inline">
                                    <input type="radio" name="tipo" id="optionsRadiosInline1" value="administrador"
                                           ${usuario.tipo == 'administrador' ? 'checked' : ''} required>Administrador
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="tipo" id="optionsRadiosInline2" value="usuario" 
                                           ${usuario.tipo == 'usuario' ? 'checked' : ''}>Usuário
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="optionsRadiosInline1" value="1" 
                                           ${usuario.status == '1' ? 'checked' : ''} required>Ativo
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" id="optionsRadiosInline2" value="0"
                                           ${usuario.status == '0' ? 'checked' : ''}>Inativo
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
