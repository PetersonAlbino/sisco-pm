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


<title>Cadastro de Ocorr�ncias</title>
<!--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

        <%@ include file="conexao.jsp" %>

        <c:if test="${not empty param.Cod_ocor}">

            <sql:query var="MUNICIPIO" dataSource="${conexao}">
                SELECT COD_MUN,DES_MUNICIPIO FROM MUNICIPIO
                where COD_MUN = ${param.Cod_ocor}
            </sql:query>
        </c:if>
-->
</head>

	<body>
     <div id="container">
     <header>
                <div id="header">

                    <div id="logo"><a href="inicio.jsp"><img src="images/logo.png" alt="peterson" /></a></div>
                                        
  
		
	<!--Following code is all you need for the menu-->
			<div id="wrapper-menu"><!--container for this menu. With this container you can position it where you want in your layaout-->
			  <ul id="nav" name="nav">
					<li id="item1" class="fade"><a class="big-menu-launcher" <a href="#" title="Cadastros Básicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20" alt="cadastro" /> Cadastro</a></li>
					<li id="item2" class="fade"><a href="consulta.jsp" title="Consultas Gerenciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>
					<li id="item3" class="fade"><a class="big-menu-launcher-2" title="Impressão de Relatórios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>
					<li id="item4" class="fade"><a href="materiais.jsp" title="Cadastro de Materiais"><img src="images/woofunction-icons/basket_add_32.png" width="20" height="20" alt="materiais" /> Materiais</a></li>
					<li id="item5" class="fade"><a href="ajuda.jsp" title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
				</ul>
                            <!--end nav-->
				
			<!--here starts hiden menus-->
			<div id="big-menu-hidden">
				<div id="cart">
					<div id="counter-cart">
    					<div id="btn-go-cart">	                
                    	<h3 id="li-item1" > Cadastro de Ocorr�ncias</h3>
                        </div>
						<p id="btn-go-cart"><a href="" title="Cadastro referente a Flora">Flora</a></p>
						<p id="btn-go-cart"><a href="" title="Cadastro referente a Fauna">Fauna</a></p>
                        <p id="btn-go-cart"><a href="" title="Cadastro referente a Ordem Publica">Ordem</a></p>
						<span id="planeta_terra"><img src="images/planeta_terra.png" width="200" height="131"/></span>
					</div>
				</div>
                
                
			  <div id="product-list">
                
					<h2 id="li-item1" >Outros <strong>Cadastros:</strong></h2>
                    <span class="btn-close"><a class="big-menu-launcher"href="#">close</a></span>
					<ul id="list-cameras">

						<li><a href="endereco.jsp" title="Cadastro de Localidade">Localidade</a></li>
						<li><a href="materiais.jsp" title="Cadastro de Materiais">Materiais</a></li>
						<li><a href="os.jsp" title="Cadastro de Constata��oo de Ordem de Servi�o">Constatação</a></li>
                        <li><a href="#" title="Cadastro de Infra��o">Auto de Infra��o</a></li>
                        <li><a href="#" title="Cadastro de Recolhimento">Recolhimento</a></li>
                        <li><a href="os.jsp" title="Cadastro de Ordem de Serviço">Ordem de Servi��o</a></li>
						<li class="view-all"><span><a href="#"></a></span></li>
					</ul>

				</div>
			</div><!--endBigMenuHidden-->
            
          
            
            
         
            
            
			<div id="big-menu-hidden-stores">
				<div id="stores">
					<span class="btn-close-2"><a class="big-menu-launcher-stores" href="#">close</a></span>
					<div id="loc01">
						<h2 class="tit-loc">Los &Aacute;ngeles, CA</h2>
						<span class="map-loc"><a href="#" title="SEO Keywords">Map with some keyword for location</a></span>
						<p class="address">St. Flower Street</p>
						<p class="phone-contact">(555)-555 555 555</p>
						<span class="view-map"><a href="#" title="SEO KEYWORDS">view map</a></span>
					</div>
					<div id="loc02">
						<h2 class="tit-loc">San Francisco, CA</h2>
						<span class="map-loc"><a href="#" title="SEO Keywords">Map with some keyword for location</a></span>
						<p class="address">St. Flower Street</p>
						<p class="phone-contact">(555)-555 555 555</p>
						<span class="view-map"><a href="#" title="SEO KEYWORDS">view map</a></span>
					</div>
					<div id="loc03">
						<h2 class="tit-loc">San Jos&eacute;, CA</h2>
						<span class="map-loc"><a href="#" title="SEO Keywords">Map with some keyword for location</a></span>
						<p class="address">Sunol Midtown</p>
						<p class="phone-contact">(555)-555 555 555</p>
						<span class="view-map"><a href="#" title="SEO KEYWORDS">view map</a></span>
					</div>
				</div>
			</div><!--endBigMenuHidden-stores--><!--end wrapper-menu-->
		<!--end HTML code for this menu-->
			
	</div>
        
      </header>
      <div id="content">
                <div id="content_head"></div>
                <div id="content_main">

                    <div id="content_data">
                        <h1>Consultas</h1>

                        <div >
							<a href="#">Teste</a>	 
                        </div>

                    </div>

                </div>
            </div>
            <div id="content_foot"></div>
        </div>
        <footer>
            <div id="footer">
                <div id="icons">
                    <a href="https://www.facebook.com/pages/Syncode/118722130954">
                        <img src="https://www.syncode.co.uk/img/facebook_icon.png" alt="Facebook" />
                    </a>
                    <a href="https://twitter.com/petersonalbino">
                        <img src="https://www.syncode.co.uk/img/footer_twitter.png" alt="Twitter" />
                    </a>
                    <a href="mailto:peh.ty2@gmail.com">
                        <img src="https://www.syncode.co.uk/img/footer_email.png" alt="Email Syncode" />
                    </a>
                    <a href="https://www.syncode.co.uk/files/prkit.zip">
                        <img src="https://www.syncode.co.uk/img/footer_pr.png" alt="PR Kit" />
                    </a>
                </div>
                <div id="links">
                    <a href="https://www.syncode.co.uk/terms.html">Terms and conditions</a> | <a href="https://www.syncode.co.uk/privacy.html">Privacy policy</a> | <a href="https://www.syncode.co.uk/cookies.html">Cookie policy</a>
                </div>
                <div id="copy">
                    &copy; 2012 <a href="https://www.syncode.co.uk">Syncode</a>, a division of <a href="http://www.vpltd.com">Virtual Programming Ltd</a>
                </div>
            </div>
        </footer>

        </div>
	</body>

</html>
