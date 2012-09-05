<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>



<link rel="shortcut icon" href="images/favicon.ico" />

   <link href="style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="account_styles.css" />

<link rel="stylesheet" type="text/css" media="all" href="styles/jquery-menu-03-styles.css" /><!--jquery-menu-03 styles-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script src="js/functions.js" type="text/javascript"></script>


<title>e-commerce menu - jQuery menu03</title>
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

                    <div id="logo"><a href="inicio.jsp"><img src="images/logo.png" alt="SISCO" /></a></div>
                                        
  
		
	<!--Following code is all you need for the menu-->
			<div id="wrapper-menu"><!--container for this menu. With this container you can position it where you want in your layaout-->
			  <ul id="nav" name="nav">
					<li id="item1" class="fade"><a href="teste.jsp" title="keywords for SEO">Cadastro</a></li>
					<li id="item2" class="fade"><a href="#" title="keywords for SEO">Consultas</a></li>
					<li id="item3" class="fade"><a class="big-menu-launcher" href="#" title="keywords for SEO">Relatórios</a></li>
					<li id="item4" class="fade"><a class="big-menu-launcher-stores" href="#" title="keywords for SEO">Materiais</a></li>
					<li id="item5" class="fade"><a href="#" title="keywords for SEO">Ajuda</a></li>
				</ul><!--end nav-->
				
			<!--here starts hiden menus-->
			<div id="big-menu-hidden">
				<div id="cart">
					<div id="counter-cart">
						<p>0 items in</p>
						<p id="btn-go-cart"><a href="" title="keywords for SEO">YOUR CART</a></p>
						<span id="img-empty-cart"><img src="images/ico-empty-cart.png" alt="keyword for SEO" width="109" height="131"/></span>
					</div>
				</div>
				<div id="product-list">
					<span class="btn-close"><a class="big-menu-launcher" href="#">close</a></span>
					<h2 id="li-item1" title="SEO KEYWORDS">digital<strong>cameras</strong></h2>
					<ul id="list-cameras">
						<li><a href="#" title="keyword for SEO">canon</a></li>
						<li><a href="#" title="keyword for SEO">nikkon</a></li>
						<li><a href="#" title="keyword for SEO">hasselband</a></li>
						<li><a href="#" title="keyword for SEO">leica</a></li>
						<li><a href="#" title="keyword for SEO">sony</a></li>
						<li><a href="#" title="keyword for SEO">lomo like</a></li>
						<li class="view-all"><span><a href="#" title="keywords for SEO">view all</a></span></li>
					</ul>
					<h2 id="li-item2" title="SEO KEYWORDS">personal<strong>computers</strong></h2>
					<ul id="list-laptops">
						<li><a href="#" title="keyword for SEO">apple</a></li>
						<li><a href="#" title="keyword for SEO">hp</a></li>
						<li><a href="#" title="keyword for SEO">sony</a></li>
						<li><a href="#" title="keyword for SEO">dell</a></li>
						<li><a href="#" title="keyword for SEO">acer</a></li>
						<li><a href="#" title="keyword for SEO">ibm</a></li>
						<li class="view-all"><span><a href="#" title="keywords for SEO">view all</a></span></li>

					</ul>
					<h2 id="li-item3" title="SEO KEYWORDS">smart<strong>phones</strong></h2>
					<ul id="list-phones">
						<li><a href="#" title="keyword for SEO">apple</a></li>
						<li><a href="#" title="keyword for SEO">htc</a></li>
						<li><a href="#" title="keyword for SEO">sony</a></li>
						<li><a href="#" title="keyword for SEO">samsung</a></li>
						<li><a href="#" title="keyword for SEO">motorola</a></li>
						<li><a href="#" title="keyword for SEO">alcatel</a></li>
						<li class="view-all"><span><a href="#" title="keywords for SEO">view all</a></span></li>

					</ul>
				</div>
			</div><!--endBigMenuHidden-->
			
			<div id="big-menu-hidden-stores">
				<div id="stores">
					<span class="btn-close"><a class="big-menu-launcher-stores" href="#">close</a></span>
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


                    <div id="heading"><h1><span>Get in touch...</span></h1></div>

                    <div id="content_data">
                        <h1>Cadastro</h1>

                        <div >


                            <form  name="form1" method="post" action="">
                                <ul>
                                    <li>

                                        <label for="email" >Cod Ocorrencia </label>
                                        <input type="text" name="Cod_ocor" id="Cod_ocor" value="${MUNICIPIO.rows[0].DES_MUNICIPIO}">




                                            <input class="buttonGradientSubmit"   type="submit" />
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
