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


        <title>Análise</title>
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
                <script> alert('Não foi possivel remover a ocorrencia selecionado')</script>    
            </c:if>
        </c:if>

        <c:if test="${param.acao=='edit'}">
            <sql:query var="editar" dataSource="${conexao}">
                COD_OCOR, COD_MATERIAL, COD_OS, COD_TIPO, COD_SITUACAO, COD_ENDERECO, DES_OCOR, DT_OCOR, COD_DENUNCIANTE FROM OCORRENCIA
                WHERE COD_OCOR = ${param.id}
            </sql:query>

        </c:if> --%>
        <c:if test="${param.acao=='analise'}">
            <sql:query var="consultaos" dataSource="${conexao}">
                SELECT ORDEMSERVICO.COD_OS,ORDEMSERVICO.DES_OS,ORDEMSERVICO.DT_GERACAO,ORDEMSERVICO.COD_OCORRENCIA,
                ORDEMSERVICO.DT_AGENDA,ORDEMSERVICO.SITUACAO,ORDEMSERVICO.DT_REALIZADA,ORDEMSERVICO.COD_MATERIAL,
                ORDEMSERVICO.RESPONSAVEL,ORDEMSERVICO.SITUACAO_ANALIZADA
                FROM ORDEMSERVICO WHERE COD_OS = ${param.id}
            </sql:query>
        </c:if>
                
        <sql:query var="material" dataSource="${conexao}">
            SELECT * FROM MATERIAL
        </sql:query> 

        <c:if test="${not empty param.des_os}">
            <sql:update dataSource="${conexao}">
                UPDATE ORDEMSERVICO SET SITUACAO_ANALIZADA = ?, DT_REALIZADA = ?, COD_MATERIAL =? , RESPONSAVEL
                WHERE COD_OCOR = ${param.id};
                <sql:param value="${param.des_ocor}" />
                <sql:param value="${param.cod_situacao}" />
                <sql:param value="${param.cod_material}" />
            </sql:update>
            <script> alert('Análise Cadastrada')</script>
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
                                                       title="Cadastros BÃ¡sicos"><img src="images/woofunction-icons/folder_add_32.png" width="20" height="20"	alt="cadastro" /> Cadastro</a></li>

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
                    <h1>Análise de Ocorrências</h1>
                    <div >
                        <form  name="form1" method="post" action="">
                            <ul>
                                <li>
                                    <label  for="email"><strong>Código Ordem de Serviço</strong></label>
                                    <input type="textarea" name="cod_os" id="cod_os" readonly="true" value="${consultaos.rows[0].COD_OS}"></input>

                                    <label  for="email"><strong>Descrição da OS</strong></label>
                                    <input type="textarea" name="des_os" id="des_os" readonly="true" value="${consultaos.rows[0].DES_OS}"></input>

                                    <label for="cometario"><strong>Data de Abertura</strong></label> 
                                    <input type="textarea" name="dt_geracao" id="dt_geracao" readonly="true" value="${consultaos.rows[0].DT_GERACAO}"></input>

                                    <label for="cometario"><strong>Código da Ocorrência</strong></label> 
                                    <input type="textarea" name="cod_ocorrencia" id="cod_ocorrencia" readonly="true" value="${consultaos.rows[0].COD_OCORRENCIA}"></input>
                                    
                                    <label for="cometario"><strong>Data Agendada</strong></label> 
                                    <input type="textarea" name="dt_agenda" id="dt_agenda" readonly="true" value="${consultaos.rows[0].DT_AGENDA}"></input>
                                    
                                    <label for="comentario" ><strong>Situação</strong></label>
                                    <div>
                                        <select name="situacao"> 
                                            <option>Pendente</option>
                                            <option>Atrasada</option>
                                            <option>Finalizada</option>
                                        </select>
                                    </div>

                                    <label for="forml" ><strong>Material</strong></label>
                                    <div class="">
                                        <select name="material" id="COD_MATERIAL"> 
                                            <c:forEach items="${material.rows}" var="material">
                                                <option value="${material.rows[0].COD_MATERIAL}" >${material.DES_MATERIAL} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    
                                    <label for="forml" ><strong>Data da Realizada</strong></label>
                                    <input type="textarea" name="dt_realizada" id="dt_realizada" value="${consultaos.rows[0].DT_REALIZADA}"></input>                                 
                                    <label for="cometario"><strong>Situação Analizada</strong></label> 
                                    <textarea class="campo" name="situacao_analizada" id="situacao_analizada" value="${consultaos.rows[0].SITUACAO_ANALIZADA}"></textarea>
                                    <label for="cometario"><strong>Responsavel</strong></label> 
                                    <input name="responsavel" id="responsavel" value="${consultaos.rows[0].RESPONSAVEL}"></input></br>

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

