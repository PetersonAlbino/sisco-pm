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


        <%@ include file="conexao.jsp" %>
  
        <c:if test="${not empty param.Cod_ocor}">
  
            <sql:query var="MUNICIPIO" dataSource="${conexao}">
                SELECT COD_MUN,DES_MUNICIPIO FROM MUNICIPIO
                where COD_MUN = ${param.Cod_ocor}
            </sql:query>
        </c:if>

    </head>
    <body>
        <div id="container">
            <header>
                <div id="header">
                    <div id="logo"><a href="Principal.jsp"><img src="images/logo.png" alt="peterson" /></a></div>
                    <div id="wrapper-menu">
                        <ul id="nav" name="nav">
                            <li id="item1" class="fade"><a class="cadastro-basico"  href="#" 
                                                           title="Cadastros Básicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20" 							                alt="cadastro" /> Cadastro</a></li>

                            <li id="item2" class="fade"><a  class="cadastro-basico2" href="#" title="Consultas Gerenciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>

                          <li id="item3" class="fade"><a class="cadastro-basico3" href="#" title="Impressão de Relatórios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>

                            <li id="item4" class="fade"><a  class="cadastro-basico4" href="#" title="Cadastro de Materiais"><img src="images/woofunction-icons/basket_add_32.png" width="20" height="20" alt="materiais" /> Materiais</a></li>

                            <li id="item5" class="fade"><a href="ajuda.jsp" title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
                        </ul><!--end nav-->

                        <!--Inicio - Menu de Cadastros-->
                        <div id="big-menu-hidden">
                            <div id="cart">
                                <div id="counter-cart">
                                    <div id="btn-go-cart">	                
                                        <h3 id="li-item1" >Cadastro de Ocorrências</h3>
                                    </div>
                                    <p id="btn-go-cart"><a href="" title="Cadastro de novos Bairros">Bairro</a></p>
                                    <p id="btn-go-cart"><a href="" title="Cadastro de materiais apreendidos por Ocorrência">Apreensão</a></p>
                                    <p id="btn-go-cart"><a href="" title="Cadastro de novos Municípios">Municipio</a></p>
                                </div>
                            </div>
                            <div id="product-list">
                                <h2 id="li-item1" >Outros <strong>Cadastros:</strong></h2>
                                <span class="btn-close"><a class="cadastro-basico"href="#">close</a></span>
                                <ul id="list-cameras">
                                    <li><a href="endereco.jsp" title="Cadastro de Localidade">Localidade</a></li>
                                    <li><a href="materiais.jsp" title="Cadastro de Materiais">Materiais</a></li>
                                    <li><a href="os.jsp" title="Cadastro de Constata��oo de Ordem de Servi�o">Constatação</a></li>
                                    <li><a href="#" title="Cadastro de Infra��o">Auto de Infração</a></li>
                                    <li><a href="#" title="Cadastro de Recolhimento">Recolhimento</a></li>
                                    <li><a href="os.jsp" title="Cadastro de Ordem de Serviço">Ordem de Serviço</a></li>
                                    <li class="view-all"><span><a href="#"></a></span></li>
                                </ul>
                            </div>
                        </div><!--Fim Menu de Cadastros-->

                        <!--Inicio Menu de Relatórios-->

                        <div id="big-menu-hidden3">
                        <div id="cart">
                            <div id="counter-cart">
                            <div id="btn-go-cart">
                            <h3 id="li-item1" >Tipo de Ocorrência</h3>
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
                        </div><!--Fim Menu de relatórios-->
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
                                    <li><a href="os.jsp" title="aaaaCadastro de Constata��oo de Ordem de Servi�o">222Constatação</a></li>
                                    <li><a href="#" title="aaaaaCadastro de Infra��o">222Auto de Infra��o</a></li>
                                    <li><a href="#" title="2222Cadastro de Recolhimento">222Recolhimento</a></li>
                                    <li><a href="os.jsp" title="Cadastro de Ordem de Serviço">222Ordem de Servi��o</a></li>
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
                    <div class="tmplapps">
                        <c:forEach var="municipio" begin="0" items="${MUNICIPIO.rows}">
                <form name="teste" action="index.jsp"><ol>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>C�digo</th>
                                    <th>MUNICIPIO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${municipio.COD_MUN}</td>
                                    <td>${municipio.DES_MUN}</td>
                                </tr>
                                <tr>
                                    <td>${municipio.COD_MUN}</td>
                                    <td>${municipio.DES_MUN}</td>
                                </tr>
                            </tbody>
                        </table>
                     
                    </ol>
                                     
                </form>
                
            
        </c:forEach>
                        
                        
                        <div class="clear"></div>
                        <div class="floatsection col0"></div>
                        <div class="clear"></div>
                    </div>
                </div>	

                <footer>
                    <div id="footer">
                        <div id="icons">
                            <a href="https://www.facebook.com/">
                                <img src="https://www.syncode.co.uk/img/facebook_icon.png" alt="Facebook" />
                            </a>
                            <a href="https://twitter.com">
                                <img src="https://www.syncode.co.uk/img/footer_twitter.png" alt="Twitter" />
                            </a>
                            <a href="mailto:peh.ty2@gmail.com.br">
                                <img src="https://www.syncode.co.uk/img/footer_email.png" alt="Email Syncode" />
                            </a>
                         </div>
                        <div id="links">
                           
                        </div>
                        <div id="copy">
                            &copy; 2012 <a href="https://www.ace.br">SISCO</a>
                        </div>
                    </div>
                </footer>

            </div>
    </body>

</html>