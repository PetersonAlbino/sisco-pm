<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


        <link rel="shortcut icon" href="images/favicon.ico" />

        <link href="style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="account_styles.css" />

        <link rel="stylesheet" type="text/css" media="all" href="styles/jquery-menu-03-styles.css" /><!--jquery-menu-03 styles-->

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script src="js/functions.js" type="text/javascript"></script>


        <title>Cadastro de Tipos de Ocorrências</title>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

        <%@ include file="conexao.jsp" %>

        <c:if test="${not empty param.mensagem}">
            <script>
                alert('${param.mensagem}')
            </script>
        </c:if>

        <c:if test="${param.acao=='delete'}">
            <c:catch var="erro">
                <sql:update dataSource="${conexao}">
                    DELETE FROM TIPO WHERE COD_TIPO = ${param.id}

                </sql:update>
                <script> alert('Ocorrencia  Removido')</script>
            </c:catch>

            <c:if test="${not empty erro}">
                <script> alert('Não foi possivel remover a ocorrencia selecionado')</script>    
            </c:if>
        </c:if>



        <c:if test="${not empty param.des_tipo}">
            <c:if test="${param.alteracao=='sim'}">
                <sql:update dataSource="${conexao}">
                    UPDATE TIPO SET DES_TIPO = ? 
                    WHERE COD_TIPO = ${param.id};
                    <sql:param value="${param.des_tipo}" />
                </sql:update>
                <script> alert('Atualizado')</script>
            </c:if>
            <c:if test="${empty param.alteracao}">
                <c:catch var="erro">

                    <sql:update dataSource="${conexao}">
                        INSERT INTO TIPO (DES_TIPO) 
                        VALUES (?)
                        <sql:param value="${param.des_tipo}" />
                    </sql:update>
                    <script> alert('Tipo Cadastrado')</script>
                </c:catch>
            </c:if>



        </c:if>

        <c:if test="${param.acao=='edit'}">
            <sql:query var="editar" dataSource="${conexao}">
                SELECT COD_TIPO, DES_TIPO FROM TIPO
                WHERE COD_TIPO = ${param.id}

            </sql:query>

        </c:if>
    </head>
    <body>
        <div id="container">
            <header>
                <div id="header">

                    <div id="logo"><a href="Principal.jsp"><img src="images/logo.png" alt="peterson" /></a></div>



                    <!--Following code is all you need for the menu-->
                    <div id="wrapper-menu"><!--container for this menu. With this container you can position it where you want in your layaout-->
                        <ul id="nav" name="nav">
                            <li id="item1" class="fade"><a class="cadastro-basico"  href="#" title="Cadastros Básicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20" alt="cadastro" /> Cadastro</a></li>

                            <li id="item2" class="fade"><a  class="cadastro-basico2" href="#" title="Consultas Gerênciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>

                            <li id="item3" class="fade"><a class="big-menu-launcher" href="#" title="Impressão de Relatórios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>

                            <li id="item5" class="fade"><a href="ajuda.jsp" title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
                        </ul><!--end nav-->

                        <!--here starts hiden menus-->
                        <!--endBigMenuHidden-stores--><!--end wrapper-menu-->
                        <!--end HTML code for this menu-->

                    </div>
            </header>
            <div id="content">
                <div id="content_head"></div>
                <div id="content_main">

                    <div id="content_data">
                        <h1>Cadastro de Tipos de Ocorrências</h1>
                        <div >
                            <form  name="form1" method="post" action="">
                                <c:if test="${param.acao=='edit'}">
                                    <input type="hidden" name="id" value="${param.id}"/>
                                    <input type="hidden" name="alteracao" value="sim"/>
                                </c:if>
                                <ul>
                                    <li>

                                        <label for="email" ><strong>Descrição do Tipo de Ocorrência</strong></label>
                                        <input type="text" name="des_tipo" id="des_tipo" value="${editar.rows[0].DES_TIPO}">
                                    </li>
                                    <input name="Ok" value="Enviar" type="submit" class="buttonGradientSubmit" id="Ok" />

                                    <input name="Ok" value="Limpar" type="reset" class="buttonGradientSubmit" id="Ok" />
                                </ul>


                            </form>  
                        </div>

                    </div>

                </div>
            </div>
            <div id="content_foot"></div>
        </div>
        <footer>
            <div id="footer">
                <div id="icons">
                    <a href="https://www.facebook.com/">
                        <img src="img/facebook_icon.png" alt="Facebook" />
                    </a>
                    <a href="https://twitter.com">
                        <img src="img/footer_twitter.png" alt="Twitter" />
                    </a>
                    <a href="mailto:peh.ty2@gmail.com.br">
                        <img src="img/footer_email.png" alt="Email Syncode" />
                    </a>
                </div>
                <div id="links">

                </div>
                <div id="copy">
                    &copy; 2012 <a href="https://www.ace.br">SISCO</a>
                </div>
            </div>
        </footer>


    </body>

</html>