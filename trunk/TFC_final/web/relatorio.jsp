<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width" />
        <link rel="shortcut icon" href="images/favicon.ico" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="account_styles.css" />
        <link rel="stylesheet" type="text/css" media="all" href="styles/jquery-menu-03-styles.css" />
        <!--jquery-menu-03styles-->

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script src="js/functions.js" type="text/javascript"></script>

        <!--Titulo-->
        <title>Cadastro de Ocorrï¿½ncias</title>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

        <!--ConexÃ£o
        <%@ include file="conexao.jsp" %>
  
        <c:if test="${not empty param.Cod_ocor}">
  
            <sql:query var="MUNICIPIO" dataSource="${conexao}">
                SELECT COD_MUN,DES_MUNICIPIO FROM MUNICIPIO
                where COD_MUN = ${param.Cod_ocor}
            </sql:query>
        </c:if>
        <!--fim - conexÃ£o-->
    </head>
    <body>
        <header>
            <div id="header">
                <div id="logo"><a href="Principal.jsp"><img src="images/logo.png" alt="peterson" /></a></div>
                <div id="wrapper-menu">
                    <ul id="nav" name="nav">
                        <li id="item1" class="fade"><a class="cadastro-basico"  href="#" 
                                                       title="Cadastros Bicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20" alt="cadastro" /> Cadastro</a></li>
                        <li id="item2" class="fade"><a  class="cadastro-basico2" href="#" title="Consultas Gerenciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>
                        <li id="item3" class="fade"><a class="cadastro-basico3" href="#" title="ImpressÃ£o de RelatÃ³rios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>
                        <li id="item5" class="fade"><a href="ajuda.jsp" title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
                    </ul>
                    <!--end nav--> 

                    <!--Inicio - Menu de Cadastros-->
                    <div id="big-menu-hidden">
                        <div id="product-list"> <span class="btn-close"><a class="cadastro-basico" href="#">close</a></span>
                            <h2 id="li-item1" title="cadastro"><strong>cadastro</strong></h2>
                            <ul id="cadastro">
                                <li><a href="CadastroBairro.jsp" title="Cadastro de novos Bairros">Bairros</a></li>
                                <li><a href="CadastroMunicipio.jsp" title="Cadastro de Municï¿½pios">Municï¿½pios</a></li>
                                <li class="view-all"></li>
                            </ul>
                            <h2 id="li-item2" title="Ocorrï¿½ncia"><strong>Ocorrï¿½ncia</strong></h2>
                            <ul id="Ocorrï¿½ncia">
                                <li><a href="CadastroSituacao.jsp" title="Cadastro de Situaï¿½ï¿½o de Ocorrï¿½ncias">Situaï¿½ï¿½o</a></li>
                                <li><a href="CadastroTipo.jsp" title="Cadastro de Tipo de Ocorrï¿½ncias">Tipo</a></li>
                                <li><a href="ConsultaTipo.jsp" title="Cadastro de Anï¿½lise da Ocorrï¿½ncia">Anï¿½lise</a></li>
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
                            <h2 id="li-item1" title="Consultas"><strong>Consultas</strong></h2>
                            <ul id="Consultas">
                                <li><a href="ConsultaBairros.jsp" title="Consulta de Bairros cadastrados">Bairros</a></li>
                                <li><a href="ConsultaMunicipios.jsp" title="Consulta de Municï¿½pios cadastrados">Municï¿½pios</a></li>
                                <li><a href="ConsultaOcorrencias.jsp" title="Consulta de Ocorrï¿½ncias cadastrados">Ocorrï¿½ncias</a></li>
                                <li><a href="ConsultaTipo.jsp" title="Consulta de Tipo da Ocorrï¿½ncia">Tipo</a></li>
                                <li class="view-all"></li>
                            </ul>
                            <h2 id="li-item2" title="SEO KEYWORDS"><strong>Consultas2</strong></h2>
                            <ul id="Consultas2">
                                <li><a href="consultamateriais.jsp" title="Consulta de Materiais Apreendidos">Materiais</a></li>
                                <li><a href="consultaAnimais.jsp" title="Consulta de Animais Apreendidos">Animais</a></li>
                                <li><a href="ConsultaSituacao.jsp" title="Consulta da Situaï¿½ï¿½o da Ocorrï¿½ncia">Situaï¿½ï¿½o</a></li>
                                <li class="view-all"></li>
                            </ul>
                        </div>
                    </div>
                    <!--Fim Menu de Consultas--> 
                    <!--Inicio Menu de RelatÃ³rios-->

                    <div id="big-menu-hidden3">
                        <div id="product-list"> <span class="btn-close"><a class="cadastro-basico3" href="#">close</a></span>
                            <h2 id="li-item1" title="Tipo de OcorrÃªncia"><strong>Tipo de OcorrÃªncia</strong></h2>
                            <ul id="Consulta-Cadastrados">
                                <li><a href="#" title="flora">flora</a></li>
                                <li><a href="#" title="fauna">fauna</a></li>

                                <li class="view-all"></li>
                            </ul>
                            <h2 id="li-item2" title="Atendimentos"><strong>Atendimentos</strong></h2>
                            <ul id="Atendimentos">
                                <li><a href="#" title="Pendentes">Pendentes</a></li>
                                <li><a href="#" title="Atendidos">Atendidos</a></li>

                                <li class="view-all"></li>
                            </ul>
                        </div>

                    </div>
                    <!--Fim Menu de relatÃ³rios--> 

                    <!-- Inicio Menu de Materiais-->
                    <div id="big-menu-hidden4">
                        <div id="cart">
                            <div id="counter-cart">
                                <div id="btn-go-cart">
                                    <h3 id="li-item1" > Consultas</h3>
                                </div>
                            </div>
                        </div>
                        <div id="product-list">
                            <h2 id="li-item1" >Outros <strong>Cadastros:</strong></h2>
                            <span class="btn-close"><a class="cadastro-basico4"href="#">close</a></span>
                            <ul id="list-cameras">
                            </ul>
                        </div>
                    </div>
                    <!-- Fim Menu de Materiais--> 

                </div>
            </div>
        </header>
        <div id="content">
            <div id="content_head"></div>
            <div id="content_main">
                <div id="container">
                    <div id="content_data">
                        <h1>Relatórios</h1>

                        <div >
                            <a href="gerarRelatorio.jsp?reportName=report1.jasper"/> Relatório de Ocorrências</a>	
                            <a href="gerarRelatorio.jsp?reportName=Relatorios/RelatorioMaterial.jasper"/> Relatório de Ocorrências</a>
                        </div>


                        <div id="content_foot"></div>
                        <div class="tmplapps">
                        </div>
                        <div class="clear"></div>
                        <!--  <div class="floatsection col0">
                                          
                                          
                                          </div>-->
                    </div>
                </div>
                        <div class="clear"></div>
                    </div>
                </div>
        
                <footer>
                    <div id="footer">
                        <div id="icons"> <a href="https://www.facebook.com/"> <img src="img/facebook_icon.png" alt="Facebook" /> </a> <a href="https://twitter.com"> <img src="img/footer_twitter.png" alt="Twitter" /> </a> <a href="mailto:peh.ty2@gmail.com.br"> <img src="img/footer_email.png" alt="Email Syncode" /> </a> </div>
                        <div id="links"> </div>
                        <div id="copy"> &copy; 2012 <a href="https://www.ace.br">SISCO</a> </div>
                    </div>
                </footer>
                </body>
                </html>
