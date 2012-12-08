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


        <title>An�lise</title>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
        <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

        <%@ include file="conexao.jsp" %>
        <%-- <c:if test="${not empty param.mensagem}">
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
                <script> alert('N�o foi possivel remover a ocorrencia selecionado')</script>    
            </c:if>
        </c:if>

        <c:if test="${param.acao=='edit'}">
            <sql:query var="editar" dataSource="${conexao}">
                COD_OCOR, COD_MATERIAL, COD_OS, COD_TIPO, COD_SITUACAO, COD_ENDERECO, DES_OCOR, DT_OCOR, COD_DENUNCIANTE FROM OCORRENCIA
                WHERE COD_OCOR = ${param.id}
            </sql:query>

        </c:if> --%>

        <sql:query var="situacao" dataSource="${conexao}">
            SELECT * FROM SITUACAO
        </sql:query>
        <sql:query var="material" dataSource="${conexao}">
            SELECT * FROM MATERIAL
        </sql:query>    

        <c:if test="${not empty param.des_ocor}">
            <sql:update dataSource="${conexao}">
                UPDATE OCORRENCIA SET DES_OCOR = ?, COD_SITUACAO = ?, COD_MATERIAL = ? 
                WHERE COD_OCOR = ${param.id};
                <sql:param value="${param.des_ocor}" />
                <sql:param value="${param.situacao}" />
                <sql:param value="${param.material}" />
            </sql:update>
            <script> alert('An�lise Alterada')</script>
        </c:if>
        <c:if test="${param.acao=='analise'}">
            <sql:query var="campos" dataSource="${conexao}">
                SELECT OCORRENCIA.COD_OCOR,OCORRENCIA.DES_OCOR,OCORRENCIA.DT_OCOR,OCORRENCIA.COD_DENUNCIANTE,
                OCORRENCIA.COD_ENDERECO,OCORRENCIA.COD_TIPO,OCORRENCIA.COD_SITUACAO,TIPO.DES_TIPO,DUNCIANTE.NM_DENUNCIANTE,DUNCIANTE.TEL_DENUNCIANTE 
                FROM OCORRENCIA LEFT JOIN TIPO ON OCORRENCIA.COD_TIPO = TIPO.COD_TIPO
                LEFT JOIN DUNCIANTE ON OCORRENCIA.COD_DENUNCIANTE = DUNCIANTE.COD_DENUNCIANTE

                WHERE COD_OCOR = ${param.id}
            </sql:query>
        </c:if>


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
                                                       title="Cadastros Básicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20"	alt="cadastro" /> Cadastro</a></li>

                        <li id="item2" class="fade"><a  class="cadastro-basico2" href="#" title="Consultas Gerenciais"><img src="images/woofunction-icons/folder_chart_32.png" width="20" height="20" alt="consulta" /> Consultas</a></li>

                        <li id="item3" class="fade"><a class="cadastro-basico3" href="#" title="Impressão de Relatorios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>

                        <li id="item5" class="fade"><a href="ajuda.jsp" title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
                    </ul><!--end nav-->

                </div>

        </header>
        <div id="content">
            <div id="content_head"></div>
            <div id="content_main">

                <div id="content_data">
                    <h1>An�lise de Ocorr�ncias</h1>
                    <div >
                        <form  name="form1" method="post" action="">
                            <ul>
                                <li>
                                    <label  for="email"><strong>C�digo Ocorr�ncia</strong></label>
                                    <input type="textarea" name="cod_ocor" id="cod_ocor" readonly="true" value="${campos.rows[0].COD_OCOR}"></input>

                                    <label  for="email"><strong>Tipo de Ocorr�ncia</strong></label>
                                    <input type="textarea" name="cod_tipo" id="cod_tipo" readonly="true" value="${campos.rows[0].DES_TIPO}"></input>

                                    <label for="cometario"><strong>Descri��o da Ocorr�ncia</strong></label> 
                                    <input type="textarea" name="des_ocor" id="des_ocor"  value="${campos.rows[0].DES_OCOR}"></input>

                                    <label for="forml" ><strong>Situa��o*</strong></label>
                                    <div class="">
                                        <select name="situacao" id="COD_SITUACAO"> 
                                            <c:forEach items="${situacao.rows}" var="situacao">
                                                <c:set var="selected" value="${ situacao.COD_SITUACAO == campos.rows[0].COD_SITUACAO ? 'selected' : ''}"/>
                                                <option value="${situacao.COD_SITUACAO}" ${selected}>${situacao.DES_SITUACAO} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <label for="forml" ><strong>Data da Ocorr�ncia</strong></label>
                                    <input type="textarea" name="dt_ocor" id="dt_ocor" readonly="true" value="${campos.rows[0].DT_OCOR}"></input>                                 
                                    <label for="cometario"><strong>Denunciante</strong></label> 
                                    <input name="cod_denunciante" id="cod_denunciante" readonly="true" value="${campos.rows[0].NM_DENUNCIANTE}"></input>
                                    <label for="cometario"><strong>Telefone Denunciante</strong></label> 
                                    <input name="tel_denunciante" id="tel_denunciante" readonly="true" value="${campos.rows[0].TEL_DENUNCIANTE}"></input></br>

                                    <label for="forml" ><strong>Material</strong></label>
                                    <div class="">
                                        <select name="material" id="COD_MATERIAL"> 
                                            <c:forEach items="${material.rows}" var="material">
                                                <option value="${material.COD_MATERIAL}" >${material.DES_MATERIAL} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        <input name="Ok" value="Enviar" type="submit" class="buttonGradientSubmit" id="Ok" />
                                        <input name="Limpar" value="Limpar" type="reset" class="buttonGradientSubmit" id="Limpar" />
                                    </div>
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

