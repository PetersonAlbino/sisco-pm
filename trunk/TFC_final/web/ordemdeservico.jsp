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


        <title>Cadastro de Ocorrencias</title>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

        <%@ include file="conexao.jsp" %>

        <c:if test="${not empty param.des_os}">
            <sql:update dataSource="${conexao}">
                INSERT INTO ORDEMSERVICO (DES_OS,DT_GERACAO,SITUACAO,COD_OCORRENCIA,DT_AGENDA,RESPONSAVEL)
                VALUES (?,?,?,?,?,?)
                <sql:param value="${param.des_os}" />
                <sql:param value="${param.dt_geracao}"/>
                <sql:param value="${param.situacao}"/>
                <sql:param value="${param.cod_ocorrencia}"/>
                <sql:param value="${param.dt_agenda}"/>
                <sql:param value="${param.responsavel}"/>
            </sql:update> 
        </c:if>
                
        <c:if test="${param.acao=='geraos'}">
            <sql:query var="gerar" dataSource="${conexao}">
                SELECT OCORRENCIA.COD_OCOR,OCORRENCIA.DES_OCOR FROM OCORRENCIA
                WHERE COD_OCOR = ${param.id}
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
                            <li id="item1" class="fade"><a class="cadastro-basico"  href="#" title="Cadastros Basicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20" alt="cadastro" /> Cadastro</a></li>

                            <li id="item2" class="fade"><a  class="cadastro-basico2" href="#" title="Consultas Gerenciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>

                            <li id="item3" class="fade"><a class="big-menu-launcher" href="#" title="Impressão de Relatorios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>

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
                        <h1>Cadastro de Ordens de Servi�os</h1>
                        <div >
                            <form  name="form1" method="post" action="">
                                <ul>
                                    <li>
                                        <label for="comentario" ><Strong>Descri��o</Strong></label>
                                        <textarea name="des_os" id="des_os" value="${gerar.rows[10].DES_OCOR}" class="campo"></textarea>  
                                        <label for="forml" ><strong>Data Gera��o</strong></label>
                                        <input type="date" name="dt_geracao" id="dt_geracao"></input>
                                        <label for="comentario" ><strong>Situa��o</strong></label>
                                        <div>
                                            <select name="situacao"> 
                                                <option>Pendente</option>
                                                <option>Atrasada</option>
                                                <option>Finalizada</option>
                                            </select>
                                        </div>
                                        
                                        <label for="comentario" ><strong>C�digo da Ocorr�ncia</strong></label>
                                        <input for="comentario" name="cod_ocorrencia" id="cod_ocorrencia" readonly="true" value="${gerar.rows[0].COD_OCOR}"></input>
                                        <label for="forml" ><strong>Data Agendada</strong></label>
                                        <input type="date" name="dt_agenda" id="dt_agenda"></input>
                                        <label for="comentario" ><strong>Respons�vel</strong></label>
                                        <input for="comentario" name="responsavel" id="responsavel"></input>
                                    </li>
                                    <input name="Ok" value="Enviar" type="submit" class="buttonGradientSubmit" id="Ok" />
                                    <input name="Ok" value="Limpar" type="submit" class="buttonGradientSubmit" id="Ok" />
                                    <input name="Ok" value="Cancelar" type="submit" class="buttonGradientSubmit" id="Ok" />

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