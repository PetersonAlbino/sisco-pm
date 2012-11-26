<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


        <link rel="shortcut icon" href="images/favicon.ico" />

        <link href="style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="account_styles.css" />

        <link rel="stylesheet" type="text/css" media="all" href="styles/jquery-menu-03-styles.css" /><!--jquery-menu-03 styles-->

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.js"></script>
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
                <script> alert('Não foi possível remover a ocorrência selecionado')</script>    
            </c:if>
        </c:if>

        <c:if test="${param.acao=='edit'}">
            <sql:query var="editar" dataSource="${conexao}">
                COD_OCOR, COD_MATERIAL, COD_OS, COD_TIPO, COD_SITUACAO, COD_ENDERECO, DES_OCOR, DT_OCOR, COD_DENUNCIANTE FROM OCORRENCIA
                WHERE COD_OCOR = ${param.id}
            </sql:query>

        </c:if>
        <sql:query var="consulta_tipo" dataSource="${conexao}">
            SELECT  COD_TIPO, DES_TIPO FROM TIPO
        </sql:query>

        <sql:query var="situacao" dataSource="${conexao}">
            SELECT  COD_SITUACAO, DES_SITUACAO FROM SITUACAO
        </sql:query>

        <sql:query var="denunciante" dataSource="${conexao}">
            SELECT COD_DENUNCIANTE,NM_DENUNCIANTE,SEXO_DENUNCIANTE,TEL_DENUNCIANTE FROM DUNCIANTE
        </sql:query>

        <c:if test="${not empty param.nm_denunciante}">
            <%-- <c:catch var="erro"> --%>
            <sql:update dataSource="${conexao}">
                INSERT INTO DUNCIANTE (NM_DENUNCIANTE,SEXO_DENUNCIANTE,TEL_DENUNCIANTE) 
                VALUES (?,?,?)
                <sql:param value="${param.nm_denunciante}" />
                <sql:param value="${param.sexo_denunciante}"/>
                <sql:param value="${param.tel_denunciante}"/>
            </sql:update>
            <script> alert('Endereço Cadastrado')</script>
            <%--   </c:catch>--%>
        </c:if>

        <c:if test="${not empty param.municipios}">
            <%-- <c:catch var="erro"> --%>
            <sql:update dataSource="${conexao}">
                INSERT INTO ENDERECO (COD_MUN,COD_BAIRRO,NM_RUA,NUM_LOCAL,DES_LOCAL,CEP_LOCAL,QUADRA_LOCAL,LOTE_LOCAL) 
                VALUES (?,?,?,?,?,?,?,?)
                <sql:param value="${param.municipios}" />
                <sql:param value="${param.bairros}"/>
                <sql:param value="${param.rua}"/>
                <sql:param value="${param.num_local}"/>
                <sql:param value="${param.des_local}"/>
                <sql:param value="${param.cep_local}"/>
                <sql:param value="${param.quadra}"/>
                <sql:param value="${param.local}"/>
            </sql:update>
            <script> alert('Endereço Cadastrado')</script>
            <%--   </c:catch>--%>
        </c:if>

        <c:if test="${not empty param.consulta_tipo}">
            <%--<c:catch var="erro"> --%>
            <sql:update dataSource="${conexao}">

                INSERT INTO OCORRENCIA (COD_TIPO,COD_SITUACAO,COD_ENDERECO,DES_OCOR,DT_OCOR,COD_DENUNCIANTE) 
                VALUES (?,?,GEN_ID(GEN_ENDERECO_ID, 0),?,?,GEN_ID(GEN_DUNCIANTE_ID, 0))
                <sql:param value="${param.consulta_tipo}" />
                <sql:param value="${param.situacao}"/>
                <sql:param value="${param.des_ocor}"/>
                <sql:param value="${param.dt_ocor}"/>

            </sql:update>
            <script> alert('Ocorrência Cadastrada')</script>
            <%-- </c:catch> --%>
        </c:if>

        <sql:query var="municipios" dataSource="${conexao}">
            SELECT COD_MUN,DES_MUN FROM MUNICIPIO
            ORDER BY DES_MUN
        </sql:query>


        <script>
            var bairros = new Array();
            var cod_bairros = new Array();
            <c:forEach var="municipio" items="${municipios.rows}">
                <sql:query var="bairros" dataSource="${conexao}">
                    SELECT COD_BAIRRO,NOME_BAIRRO,COD_MUN FROM BAIRRO 
                    WHERE COD_MUN = ${municipio.COD_MUN} 
                    ORDER BY NOME_BAIRRO
             
                </sql:query>
                    bairros['${municipio.COD_MUN}'] = new Array(
                <c:forEach var="bairro" items="${bairros.rows}">
                    '${bairro.NOME_BAIRRO}',
                </c:forEach>
                    ''); 
                    cod_bairros['${municipio.COD_MUN}'] = new Array(
                <c:forEach var="bairro" items="${bairros.rows}">
                    '${bairro.COD_BAIRRO}',
                </c:forEach>
                    '');
            </c:forEach>

                function carregaBairros() {
                    var selCidades = document.form1.municipios;
                    var selBairros = document.form1.bairros;
                   
                    selBairros.options.length=0;
                    var nomebairro = bairros[selCidades.value];
                    var codbairro = cod_bairros[selCidades.value];
                    //alert(selCidades.value);
                    //alert(disp.length);
                    var html = '';
                    if (nomebairro != null){
                        for (i = 0; i < nomebairro.length - 1 ; i++) {
                            //alert(html);
                            html = html + '<option value="'+codbairro[i]+'">'+nomebairro[i]+'</option>';
                             
                                                  
                        }
                        //alert(html);
                        
                        $(selBairros).html(html).selectmenu('refresh', true);
                        alert(html);
                    }else{
                        html = html + '<option></option>';
                        $(selBairros).html(html).selectmenu('refresh', true);     
                    }                    
                };
        </script>


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

                            <li id="item3" class="fade"><a class="cadastro-basico3" href="#" title="ImpressÃ£o de Relatorios"><img src="images/woofunction-icons/folder_page_32.png" width="20" height="20" alt="relatorio" /> Relatorios</a></li>

                            <li id="item5" class="fade"><a href="ajuda.jsp" title="Portal de Ajuda"><img src="images/woofunction-icons/folder_warning_32.png" width="20" height="20" alt="ajuda" />Ajuda</a></li>
                        </ul><!--end nav-->

                    </div>
            </header>
            <div id="content">
                <div id="content_head"></div>
                <div id="content_main">

                    <div id="content_data">
                        <h1>Cadastro de Ocorrências</h1>
                        <div >
                            <form  name="form1" method="post" action="">
                                <ul>
                                    <li>
                                        <label for="forml" ><Strong>Tipo de Ocorrência*</Strong></label>
                                        <div class="">
                                            <select name="consulta_tipo"> 
                                                <c:forEach items="${consulta_tipo.rows}" var="consulta_tipo">
                                                    <option value="${consulta_tipo.COD_TIPO}" >${consulta_tipo.DES_TIPO} </option>

                                                </c:forEach>
                                            </select>
                                        </div>
                                        <label for="forml" ><strong>Situação*</strong></label>
                                        <div class="">
                                            <select name="situacao"> 
                                                <c:forEach items="${situacao.rows}" var="situacao">
                                                    <option value="${situacao.COD_SITUACAO}" >${situacao.DES_SITUACAO} </option>
                                                </c:forEach>
                                            </select>
                                        </div>                                         
                                        <label for="cometario"><strong>Descrição*</strong></label> 
                                        <textarea name="des_ocor" id="des_ocor" class="campo"></textarea> <br />

                                        <label for="forml" ><strong>Data da Ocorrência</strong></label>
                                        <input type="date" name="dt_ocor" id="dt_ocor"></input>                                        
                                        <h3>Endereço da Ocorrência</h3>

                                        <label for="form1"><strong>Município*</strong></label>
                                        <div class="">
                                            <select name="municipios" onchange="carregaBairros()">
                                                <c:forEach items="${municipios.rows}" var="municipios">
                                                    <option value="${municipios.COD_MUN}" >${municipios.DES_MUN} </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                        </div>
                                        <label for="form1"><strong>Bairro*</strong></label>
                                        <div class="">
                                            <select name="bairros">

                                            </select>
                                        </div>
                                        <label  for="forml" ><strong>Rua*</strong></label>
                                        <input  type="textarea" name="rua" id="rua" value="${endereco.rows[0].NM_RUA}"></input>

                                        <label for="form1" ><strong>Número</strong></label>
                                        <input type="textarea" name="num_local" id="num_local" value="${endereco.rows[0].NUM_LOCAL}"></input>
                                        <label for="form1" ><strong>Descrição do Local</strong></label>
                                        <input type="textarea" name="des_local" id="des_local" value="${endereco.rows[0].DES_LOCAL}"></input>
                                        <label for="form1" ><strong>CEP*</strong></label>
                                        <input type="textarea" name="cep_local" id="cep_local" value="${endereco.rows[0].CEP_LOCAL}"></input>
                                        <label for="form1" ><strong>Quadra</strong></label>
                                        <input type="textarea" name="quadra" id="quadra" value="${endereco.rows[0].QUADRA_LOCAL}"></input>
                                        <label for="form1" ><strong>Lote</strong></label>
                                        <input type="textarea" name="lote" id="lote" value="${endereco.rows[0].LOTE_LOCAL}"></input>


                                        <h3>Dados do Denunciante</h3>
                                        <label for="form1"><strong>Nome</strong></label>
                                        <input type="textarea" name="nm_denunciante" id="nm_denunciante" value="${denunciante.rows[0].NM_DENUNCIANTE}"></input>
                                        <label for="form1"><strong>Sexo</strong></label>
                                        <div>
                                            <select name="sexo_denunciante"> 
                                                <option>Masculino</option>
                                                <option>Feminino</option>
                                            </select>
                                        </div>
                                        </div>
                                        <h4></h4>
                                        <label for="form1"><strong>Telefone</strong></label>
                                        <div>
                                            <input type="tel" name="tel_denunciante" id="tel_denunciante" value="${denunciante.rows[0].TEL_DENUNCIANTE}"></input>
                                        </div>
                                        <h6>(*)campos obrigatórios</h6>
                                        <h4></h4>
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
