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

        <!--Titulo-->
        <title>Cadastro de Ocorrências</title>
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
                    </ul><!--end nav-->

                    <!--Inicio - Menu de Cadastros-->
                    <div id="big-menu-hidden">
                        <div id="cart">
                            <div id="counter-cart">
                                <div id="btn-go-cart">	                
                                    <h3 id="li-item1" >Cadastros</h3>
                                </div>
                                <p id="btn-go-cart"><a href="CadastroBairro.jsp" title="Cadastro de novos Bairros">Bairro</a></p>
                                <p id="btn-go-cart"><a href="CadastroMunicipio.jsp" title="Cadastro de Municípios">Municípios</a></p>
                            </div>
                        </div>
                        <div id="product-list">
                            <div id="cart">
                                <span class="btn-close"><a class="cadastro-basico"href="#">close</a></span>                            
                                <div id="counter-cart">
                                    <p id="btn-go-cart"><a href="CadastroSituacao.jsp" title="Cadastro de Situação de Ocorrências">Situação</a></p>
                                    <p id="btn-go-cart"><a href="CadastroTipo.jsp" title="Cadastro de Tipo de Ocorrências">Tipo</a></p>
                                    <p id="btn-go-cart"><a href="CadastroAnalise.jsp" title="Cadastro de Análise da Ocorrência">Tipo</a></p>

                                </div>
                            </div>
                        </div>

                    </div><!--Fim Menu de Cadastros-->

                    <!--Inicio Menu de RelatÃ³rios-->

                    <div id="big-menu-hidden3">
                        <div id="cart">
                            <div id="counter-cart">
                                <div id="btn-go-cart">
                                    <h3 id="li-item1" >Tipo de OcorrÃªncia</h3>
                                </div>
                                <ul id="list-cameras">
                                    <li><a href="" title="">Fauna99</a></li>
                                    <li><a href="" title="">Flora99</a></li>
                                </ul>
                            </div>
                        </div>

                        <div id="product-list">
                            <div id="cart">
                                <div id="counter-cart">
                                    <div id="btn-go-cart">
                                        <h3 id="li-item1" >Atendimentos</h3>
                                        <ul id="list-cameras">
                                            <li><a href="" title="teste">Pendentes</a></li>
                                            <li><a href="" title="teste">Atendidos</a></li>
                                            <li class="view-all"><span><a href="#"></a></span></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!--Fim Menu de relatÃ³rios-->
                    <!--Inicio menu de Consultas-->
                    <div id="big-menu-hidden2">
                        <div id="cart">
                            <div id="counter-cart">
                                <div id="btn-go-cart">	                
                                    <h3 id="li-item1" > Consultas</h3>
                                </div>
                                <p id="btn-go-cart"><a href="" title="222Cadastro referente a Flora">222Flora</a></p>
                                <p id="btn-go-cart"><a href="" title="222Cadastro referente a Fauna">222Fauna</a></p>
                                <p id="btn-go-cart"><a href="" title="222Cadastro referente a Ordem Publica">222Ordem</a></p>

                            </div>
                        </div>
                        <div id="product-list">

                            <h2 id="li-item1" >Outros <strong>Cadastros:</strong></h2>
                            <span class="btn-close"><a class="cadastro-basico2"href="#">close</a></span>
                            <ul id="list-cameras">

                                <li><a href="endereco.jsp" title="aaaaCadastro de Localidade">222Localidade</a></li>
                                <li><a href="materiais.jsp" title="aaaaaCadastro de Materiais">22Materiais</a></li>
                                <li><a href="os.jsp" title="aaaaCadastro de Constataï¿½ï¿½oo de Ordem de Serviï¿½o">222ConstataÃ§Ã£o</a></li>
                                <li><a href="#" title="aaaaaCadastro de Infraï¿½ï¿½o">222Auto de Infraï¿½ï¿½o</a></li>
                                <li><a href="#" title="2222Cadastro de Recolhimento">222Recolhimento</a></li>
                                <li><a href="os.jsp" title="Cadastro de Ordem de ServiÃ§o">222Ordem de Serviï¿½ï¿½o</a></li>
                                <li class="view-all"><span><a href="#"></a></span></li>
                            </ul>

                        </div>
                    </div><!--Fim Menu de Consultas-->

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
                    <div class="tmplapps">

                        <div class="floatsection col0"><a href="CadastroOcorrencias.jsp"title="" style="background-image:url(img/apps_page_synotes__1339059658.png)"></a></div>
                        <div class="floatsection col0"><a href="Animais.jsp"title="" style="background-image:url(img/apps_page_birder__1339081919-1221.png)"></a></div>
                        <div class="floatsection col0"><a href="ConsultaTipo.jsp"title="" style="background-image:url(img/swapped_coming_soon_1343809493-outra%20opcion.png)"></a></div>

                    </div>	
                    <div class="clear"></div>
                    <!--  <div class="floatsection col0">
                      
                      
                      </div>-->
                    <div class="clear"></div>
                </div>
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
