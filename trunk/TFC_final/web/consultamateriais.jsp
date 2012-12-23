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


        <title>Consulta de Materiais</title>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

        <%@ include file="conexao.jsp" %>
        <c:if test="${param.acao=='delete'}">
            <c:catch var="erro">
                <sql:update dataSource="${conexao}">
                    DELETE FROM MATERIAL WHERE COD_MATERIAL = ${param.id}

                </sql:update>
                <script> alert('Material  Removido')</script>
            </c:catch>

            <c:if test="${not empty erro}">
                <script> alert('Não foi possivel remover o material selecionado')</script>    
            </c:if>
        </c:if>   
        <c:if test="${not empty param.mensagem}">
            <script>
                alert('${param.mensagem}')
            </script>
        </c:if>

        <sql:query var="material" dataSource="${conexao}">
            SELECT * FROM MATERIAL
            where TIPO_MATERIAL = 'Material' 
            order by DES_MATERIAL
        </sql:query>
    </head>

    <body>
        <div id="container">
            <header>
                <div id="header">
                    <div id="logo"><a href="Principal.jsp"><img src="images/logo.png" alt="peterson" /></a></div>
                    <div id="wrapper-menu">
                        <ul id="nav" name="nav">
                            <li id="item1" class="fade"><a class="cadastro-basico"  href="#"
                                                           title="Cadastros Básicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20" alt="cadastro" /> Cadastro</a></li>
                            <li id="item2" class="fade"><a  class="cadastro-basico2" href="#" title="Consultas Gerenciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>
                            <li id="item3" class="fade"><a href="relatorio.jsp" title="Impressão de Relatórios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatórios</a></li>
                            <li id="item5" class="fade"><a href="ajuda.jsp"     title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
                        </ul>
                        <!--end nav--> 

                        <!--Inicio - Menu de Cadastros-->
                        <div id="big-menu-hidden">
                            <div id="product-list"> <span class="btn-close"><a class="cadastro-basico" href="#">close</a></span>
                                <h2 id="li-item1" title="SEO KEYWORDS"><strong>Cadastros Básicos</strong></h2>
                                <ul id="cadastro">
                                    <li><a href="CadastroBairro.jsp" title="Cadastro de novos Bairros">Bairros</a></li>
                                    <li><a href="CadastroMunicipio.jsp" title="Cadastro de Municípios">Municípios</a></li>
                                    <li><a href="CadastroAnimais.jsp" title="Cadastro de Animais">Animais</a></li>
                                    <li><a href="CadastroOcorrencias.jsp" title="Cadastro de Ocorrência">Ocorrência</a></li>
                                    <li class="view-all"></li>
                                </ul>

                                <ul id="Ocorrencia">
                                    <li><a href="CadastroSituacao.jsp" title="Cadastro de Situação de Ocorrências">Situação</a></li>
                                    <li><a href="CadastroTipo.jsp" title="Cadastro de Tipo de Ocorrências">Tipo</a></li>
                                    <li><a href="CadastroMateriais.jsp" title="Cadastro de Materiais">Materiais</a></li>

                                    <li class="view-all"></li>
                                </ul>
                            </div>
                        </div>
                        <!--Fim Menu de Cadastros--> 
                        <!--Inicio menu de Consultas-->
                        <div id="big-menu-hidden2"> 
                            <!--  <div id="cart">
                              <div id="counter-cart">
                              <p>0 items in</p>
                              <p id="btn-go-cart"><a href="" title="keywords for SEO">YOUR CART</a></p>
                             <span id="img-empty-cart"><img src="images/ico-empty-cart.png" alt="keyword for SEO" width="109" height="131"/></span> </div>
                          </div>-->
                            <div id="product-list"> <span class="btn-close"><a class="cadastro-basico2" href="#">close</a></span>
                                <h2 id="li-item1" title="SEO KEYWORDS"><strong>Consultas</strong></h2>
                                <ul id="Consultas">
                                    <li><a href="ConsultaBairros.jsp" title="Consulta de Bairros">Bairros</a></li>
                                    <li><a href="ConsultaMunicipios.jsp" title="Consulta de Municípios">Municípios</a></li>
                                    <li><a href="ConsultaOcorrencias.jsp" title="Consulta de Ocorrências">Ocorrências</a></li>
                                    <li><a href="ConsultaTipo.jsp" title="Consulta de Tipos da Ocorrência">Tipo</a></li>
                                    <li class="view-all"></li>
                                </ul>

                                <ul id="Consultas2">
                                    <li><a href="consultamateriais.jsp" title="Consulta de Materiais Apreendidos">Materiais</a></li>
                                    <li><a href="consultaAnimais.jsp" title="Consulta de Animais Apreendidos">Animais</a></li>
                                    <li><a href="ConsultaSituacao.jsp" title="Consulta de Situações da Ocorrência">Situação</a></li>
                                    <li><a href="ConsultaOS.jsp" title="Consulta de Ordens de Serviço">Ordem de Serviço</a></li>
                                    <li class="view-all"></li>
                                </ul>
                            </div>
                        </div>
                        <!--Fim Menu de Consultas-->  

                    </div>
                </div>
            </header>
            <div id="content">
                <div id="content_head"></div>
                <div id="content_main">

                    <div id="content_data">
                        <h1>Consulta de Materiais</h1>
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
                                        <p><img src="images/woofunction-icons/add_16.png" value="submit" width="20" height="20"/><a href="CadastroMateriais.jsp">Novo Material</a></p>
                                        <table width="100%" border="0">

                                            <tr>
                                                <th>Edita</th>
                                                <th>Deleta</th>
                                                <th>Descrição</th>
                                                <th>Status</th>
                                                <th>Tipo</th>
                                            </tr>
                                            <c:forEach var="material" items="${material.rows}">
                                                <tr>
                                                    <td class="td1"><a href="CadastroMateriais.jsp?id=${material.COD_MATERIAL}&acao=edit"><img src="images/woofunction-icons/pencil_32.png" value="submit" width="20" height="20"/></a></td>
                                                    <td class="td1"><a href="consultamateriais.jsp?id=${material.COD_MATERIAL}&acao=delete" onclick="return confirm('Deseja excluir o registro?')"><img src="images/woofunction-icons/close_16.png" value="submit" width="20" height="20"/></a></td>


                                                    <td class="td1"><c:out value="${material.DES_MATERIAL}"/></td>
                                                    <td class="td1"><c:out value="${material.STATUS_MATERIAL}"/></td>
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