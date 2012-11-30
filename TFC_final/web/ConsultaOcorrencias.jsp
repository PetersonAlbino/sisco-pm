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


        <title>Cadastro de Ocorrências</title>
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
                    DELETE FROM OCORRENCIA WHERE COD_OCOR = ${param.id}

                </sql:update>
                <script> alert('Ocorrencia  Removido')</script>
            </c:catch>

            <c:if test="${not empty erro}">
                <script> alert('Não foi possivel remover a ocorrencia selecionado')</script>    
            </c:if>
        </c:if>

        <c:if test="${param.acao=='edit'}">
            <sql:query var="editar" dataSource="${conexao}">
                COD_OCOR, COD_MATERIAL, COD_OS, COD_TIPO, COD_SITUACAO, COD_ENDERECO, DES_OCOR, DT_OCOR, COD_DENUNCIANTE FROM OCORRENCIA
                WHERE COD_OCOR = ${param.id}
            </sql:query>

        </c:if>


        <sql:query var="situacao" dataSource="${conexao}">
            SELECT  COD_SITUACAO, DES_SITUACAO FROM SITUACAO
        </sql:query>
        <sql:query var="ocorrencia" dataSource="${conexao}">
            SELECT OCORRENCIA.COD_OCOR,OCORRENCIA.DT_OCOR,TIPO.DES_TIPO,SITUACAO.DES_SITUACAO,MUNICIPIO.DES_MUN 
            FROM OCORRENCIA LEFT JOIN TIPO 
            ON OCORRENCIA.COD_TIPO = TIPO.COD_TIPO
            LEFT JOIN SITUACAO
            ON OCORRENCIA.COD_SITUACAO = SITUACAO.COD_SITUACAO
            LEFT JOIN ENDERECO
            ON OCORRENCIA.COD_ENDERECO = ENDERECO.COD_ENDERECO
            LEFT JOIN MUNICIPIO
            ON ENDERECO.COD_MUN = MUNICIPIO.COD_MUN
            order by COD_OCOR
        </sql:query>


    </head>                

</head>

<body>
    <div id="container">
        <header>
            <div id="header">

                <div id="logo"><a href="Principal.jsp"><img src="images/logo.png" alt="peterson" /></a></div>



                <div id="wrapper-menu">
                    <ul id="nav" name="nav">
                        <li id="item1" class="fade"><a class="cadastro-basico"  href="#" 
                                                       title="Cadastros BÃ¡sicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20" 							                alt="cadastro" /> Cadastro</a></li>

                        <li id="item2" class="fade"><a  class="cadastro-basico2" href="#" title="Consultas Gerenciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>

                        <li id="item3" class="fade"><a class="cadastro-basico3" href="#" title="ImpressÃ£o de Relatorios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>

                        <li id="item5" class="fade"><a href="ajuda.jsp" title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
                    </ul><!--end nav-->

                </div>
        </header>
        <div id="content">
            <div id="content_head"></div>
            <div id="content_main">

                <div id="content_data">
                    <h1>Consulta de Ocorrências</h1>
                    <div >
                        <form  name="form1" method="post" action="">
                            <ul>
                                <li>
                                    <table width="100%" height="100%" border="0">
                                        <caption class="TableTitle1">
                                            <br/>
                                            <br/>
                                            <br/>
                                        </caption>
                                    </table>  
                                    <table width="100%" border="0">
                                        <caption class="TableTitle2">
                                            <br/>
                                            <br/>
                                        </caption>
                                    </table>
                                    <p><img src="images/woofunction-icons/add_16.png" value="submit" width="20" height="20"/><a href="CadastroOcorrencias.jsp">Nova Ocorrência</a></p>
                                    <table width="100%" border="0">

                                        <tr>
                                            <th>Edita</th>
                                            <th>Deleta</th>
                                            <th>Emitir OS</th>
                                            <th>Analise</th>
                                            <th>Tipo</th>
                                            <th>Situação</th>
                                            <th>Endereco</th>
                                            <th>Data</th>
                                            <th>Denunciante</th>

                                        </tr>
                                        <c:forEach var="ocorrencia" items="${ocorrencia.rows}">
                                            <tr>
                                                <td class="td1"><a href="CadastroOcorrencias.jsp?id=${ocorrencia.COD_OCOR}"><img src="images/woofunction-icons/pencil_32.png" value="submit" width="20" height="20"/></a></td>
                                                <td class="td1"><a href="ConsultaOcorrencias.jsp?id=${ocorrencia.COD_OCOR}&acao=delete"><img src="images/woofunction-icons/close_16.png" value="submit" width="20" height="20"/></a></td>
                                                <td class="td1"><a href="ordemdeservico.jsp?id=${ocorrencia.COD_OCOR}&acao=geraos"><img src="images/woofunction-icons/page_table_add_32.png" value="submit" width="20" height="20"/></a></td>
                                                <td class="td1"><a href="CadastroAnalise.jsp?id=${ocorrencia.COD_OCOR}&acao=analise"><img src="images/woofunction-icons/book_add_32.png" value="submit" width="20" height="20"/></a></td>
                                                <td class="td1"><c:out value="${ocorrencia.DES_TIPO}"/></td>
                                                <%--<td class="td1"><c:out value="${ocorrencia.COD_OS}"/></td>--%>
                                                <td class="td1"><c:out value="${ocorrencia.DES_SITUACAO}"/></td>
                                                <td class="td1"><c:out value="${ocorrencia.DES_MUN}"/></td>
                                                <td class="td1"><c:out value="${ocorrencia.DT_OCOR}"/></td>
                                                <td class="td1"><c:out value="${ocorrencia.COD_DENUNCIANTE}"/></td>

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
