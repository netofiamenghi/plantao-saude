<%-- 
    Document   : cabecalho
    Created on : 27/10/2016, 10:07:41
    Author     : neto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Principal - Plantão Saúde</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap Core CSS -->
        <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%=request.getContextPath()%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<%=request.getContextPath()%>/css/sb-admin-2.css" rel="stylesheet">
        <!-- Morris Charts CSS -->
        <link href="<%=request.getContextPath()%>/vendor/morrisjs/morris.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="wrapper">
            <!-- Menu Superior -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!-- /.navbar-header -->
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="CarregarUsuario?id=<%=request.getSession().getAttribute("id")%>"><i class="fa fa-user fa-fw"></i> Perfil</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="Logout"><i class="fa fa-sign-out fa-fw"></i> Logar</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Menu Lateral-->
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="principal.jsp"><i class="fa fa-home"></i> Página Inicial</a>
                            </li>
                            <!-- Anúncios -->
                            <li>
                                <a href="#"><i class="fa fa-th-large fa-fw"></i> Anúncios<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="anuncio.jsp"><i class="fa fa-plus">&nbsp;</i>Inserir</a>
                                    </li>
                                    <li>
                                        <a href="listar-anuncio"><i class="fa fa-wrench">&nbsp;</i>Gerenciar</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- fim Anúncios -->
                            <!-- Categorias -->
                            <li>
                                <a href="#"><i class="fa fa-list-ol"></i> Categorias<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="categoria.jsp"><i class="fa fa-plus">&nbsp;</i>Inserir</a>
                                    </li>
                                    <li>
                                        <a href="ListarCategoria"><i class="fa fa-wrench">&nbsp;</i>Gerenciar</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- fim Categorias -->
                            <!-- Cidades -->
                            <li>
                                <a href="#"><i class="fa fa-building-o"></i> Cidades<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="cidade.jsp"><i class="fa fa-plus">&nbsp;</i>Inserir</a>
                                    </li>
                                    <li>
                                        <a href="ListarCidade"><i class="fa fa-wrench">&nbsp;</i>Gerenciar</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- fim Cidades -->
                            <!-- Contatos -->
                            <li>
                                <a href="#"><i class="fa fa-envelope-o"></i> Contatos<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ListarContato"><i class="fa fa-wrench">&nbsp;</i>Gerenciar</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- fim Contatos -->
                            <!-- Usuarios -->
                            <li>
                                <a href="#"><i class="fa fa-male fa-fw"></i> Usuários<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="usuario.jsp"><i class="fa fa-plus">&nbsp;</i>Inserir</a>
                                    </li>
                                    <li>
                                        <a href="ListarUsuario"><i class="fa fa-wrench">&nbsp;</i>Gerenciar</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- fim Usuarios -->
                        </ul>
                    </div>
                </div>
                <!-- fim Menu Lateral -->
            </nav>
            <!-- fim menu superior -->
            <!-- jQuery -->
            <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
            <!-- Bootstrap Core JavaScript -->
            <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>
            <!-- Metis Menu Plugin JavaScript -->
            <script src="<%=request.getContextPath()%>/vendor/metisMenu/metisMenu.min.js"></script>
            <!-- Morris Charts JavaScript -->
            <script src="<%=request.getContextPath()%>/vendor/raphael/raphael.min.js"></script>
            <script src="<%=request.getContextPath()%>/vendor/morrisjs/morris.min.js"></script>
            <script src="<%=request.getContextPath()%>/js/morris-data.js"></script>
            <!-- Custom Theme JavaScript -->
            <script src="<%=request.getContextPath()%>/js/sb-admin-2.js"></script>
    </body>
</html>