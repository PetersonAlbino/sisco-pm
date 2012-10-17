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

        
        <title>Cadastro de Materiais</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

        <%@ include file="conexao.jsp" %>

         <c:if test="${not empty param.cod_material}">
             <sql:update dataSource="${conexao}">
                INSERT INTO MATERIAL (COD_MATERIAL,DES_MATERIAL,STATUS_MATERIAL) 
            VALUES (?,?,?)
                <sql:param value="${param.cod_material}" />
                <sql:param value="${param.des_material}" />
                <sql:param value="${param.status_material}" />
               
            </sql:update> 
        </c:if>

</head>

	<body>
     <div id="container">
     <header>
                <div id="header">

                    <div id="logo"><a href="inicio.jsp"><img src="images/logo.png" alt="peterson" /></a></div>
                                        
  
		
  <!--Following code is all you need for the menu-->
          <div id="wrapper-menu"><!--container for this menu. With this container you can position it where you want in your layaout-->
            <ul id="nav" name="nav">
                  <li id="item1" class="fade"><a class="cadastro-basico"  href="#" title="Cadastros Básicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20" alt="cadastro" /> Cadastro</a></li>
                  
                  <li id="item2" class="fade"><a  class="cadastro-basico2" href="#" title="Consultas Gerenciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>
                  
                  <li id="item3" class="fade"><a class="big-menu-launcher" href="#" title="Impressão de Relatórios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>
                  
                  <li id="item4" class="fade"><a  class="big-menu-launcher" href="#" title="Cadastro de Materiais"><img src="images/woofunction-icons/basket_add_32.png" width="20" height="20" alt="materiais" /> Materiais</a></li>
                  
                  <li id="item5" class="fade"><a href="ajuda.jsp" title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
              </ul><!--end nav-->
		

	</div>
      </header>
      <div id="content">
                <div id="content_head"></div>
                <div id="content_main">

                    <div id="content_data">
                        <h1>Cadastro de Materiais</h1>

                        <div >


                            <form  name="form1" method="post" action="">
                                <ul>
                                    <li>

                                       
                    <label for="código" ><Strong>Código</Strong></label>
                    
                    <input type="codigo" name="cod_material" id="cod_material"  value="${material.rows[0].COD_MATERIAL}">
                    <label for="radioButton1"> <input type="radio" name="radioButton" id="radioButton1" />Tipo</label> 
					<label for="email" ><strong>Descricao</strong></label> <input type="text" name="des_material" id="des_material" value="${material.rows[0].DES_MATERIAL}">
                    <label for="email" ><strong>Status</strong></label> <input type="text" name="status_material" id="status_material" value="${material.row[0].STATUS_MATERIAL}">
                    <input name="Salvar"  type="submit" class="buttonGradientSubmit" id="salvar" />
                    <input name="Salvar"  type="submit" class="buttonGradientSubmit" id="salvar" />
                    <input name="Salvar"  type="submit" class="buttonGradientSubmit" id="salvar" />
                    
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
