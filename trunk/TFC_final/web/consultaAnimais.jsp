<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width" />
        <link rel="shortcut icon" href="images/favicon.ico" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="account_styles.css" />
        <link rel="stylesheet" type="text/css" media="all" href="styles/jquery-menu-03-styles.css" />					<!--jquery-menu-03styles-->

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script src="js/functions.js" type="text/javascript"></script>


        <title>Cadastro de Animais Apreendidos</title>
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
                    DELETE FROM MATERIAL WHERE COD_MATERIAL = ${param.id}

                </sql:update>
                <script> alert('Animal Removido')</script>
            </c:catch>

            <c:if test="${not empty erro}">
                <script> alert('Não foi possivel remover o material selecionado')</script>    
            </c:if>


        </c:if>

        <sql:query var="material" dataSource="${conexao}">
            SELECT * FROM MATERIAL
            where TIPO_MATERIAL = 'Animal'
            order by DES_MATERIAL
        </sql:query>
    </head>

    <body>
        <div id="container">
            <header>
                <div id="header">

                    <div id="logo"><a href="Principal.jsp"><img src="images/logo.png" alt="peterson" /></a></div>



                    <!--Following code is all you need for the menu-->
                    <div id="wrapper-menu"><!--container for this menu. With this container you can position it where you want in your layaout-->
                        <ul id="nav" name="nav">
                            <li id="item1" class="fade"><a class="cadastro-basico"  href="#" title="Cadastros BÃ¡sicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20" alt="cadastro" /> Cadastro</a></li>

                            <li id="item2" class="fade"><a  class="cadastro-basico2" href="#" title="Consultas Gerenciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>

                            <li id="item3" class="fade"><a class="big-menu-launcher" href="#" title="ImpressÃ£o de RelatÃ³rios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>

                            <li id="item5" class="fade"><a href="ajuda.jsp" title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
                        </ul><!--end nav-->


                    </div>
            </header>
            <div id="content">
                <div id="content_head"></div>
                <div id="content_main">

                    <div id="content_data">
                        <h1>Consulta de Animais Apreendidos</h1>
                        <div >
                            <form  name="form1" method="post" action="">
                                <ul>
                                    <li>
                                        <table width="100%" height="100%" border="0">
                                            <caption class="TableTitle1">
                                            </caption>
                                        </table>  
                                        <table width="100%" border="0">
                                            <caption class="TableTitle2">
                                                <br/>
                                                <br/>
                                            </caption>
                                        </table>
                                        <p><img src="images/woofunction-icons/add_16.png" value="submit" width="20" height="20"/><a href="CadastroAnimais.jsp">Novo Animal</a></p>
                                        <table width="100%" border="0">

                                            <tr>
                                                <th>Edita</th>
                                                <th>Deleta</th>
                                                <th>Descrição</th>
                                                <th>Status</th>
                                                <th>Raça</th>
                                                <th>Especie</th>
                                                <th>Sexo</th>
                                                <th>Tipo</th>
                                            </tr>
                                            <c:forEach var="material" items="${material.rows}">
                                                <tr>
                                                    <td class="td1"><a href="CadastroAnimais.jsp?id=${material.COD_MATERIAL}&acao=edit"><img src="images/woofunction-icons/pencil_32.png" value="submit" width="20" height="20"/></a></td>
                                                    <td class="td1"><a href="ConsultaAnimais.jsp?id=${material.COD_MATERIAL}&acao=delete"><img src="images/woofunction-icons/close_16.png" value="submit" width="20" height="20"/></a></td>
                                                    <td class="td1"><c:out value="${material.DES_MATERIAL}"/></td>
                                                    <td class="td1"><c:out value="${material.STATUS_MATERIAL}"/></td>
                                                    <td class="td1"><c:out value="${material.RACA}"/></td>
                                                    <td class="td1"><c:out value="${material.ESPECIE}"/></td>
                                                    <td class="td1"><c:out value="${material.SEXO}"/></td>
                                                    <td class="td1"><c:out value="${material.TIPO_MATERIAL}"/></td>
                                                </tr>
                                            </c:forEach> 

                                        </table>   
                                        <table>
                                            <tr>
                                                <td class="td2"><a href="Principal.jsp"><img src="images/woofunction-icons/arrow_left_16.png" value="submit" width="20" height="20"/></a></td>
                                            </tr>
                                        </table>
                                        <table width="100%" border="0">
                                        </table>



                                    </li>
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