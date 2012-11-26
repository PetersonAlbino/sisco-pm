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
                <script> alert('Não foi possivel remover a ocorrencia selecionado')</script>    
            </c:if>
        </c:if>

        <c:if test="${param.acao=='edit'}">
            <sql:query var="editar" dataSource="${conexao}">
                COD_OCOR, COD_MATERIAL, COD_OS, COD_TIPO, COD_SITUACAO, COD_ENDERECO, DES_OCOR, DT_OCOR, COD_DENUNCIANTE FROM OCORRENCIA
                WHERE COD_OCOR = ${param.id}
            </sql:query>

        </c:if>


        <sql:query var="situacao" dataSource="${conexao}">
            SELECT  COD_SITUACAO, DES_SITUACAO FROM SITUACAO
        </sql:query>
        <sql:query var="ocorrencia" dataSource="${conexao}">
            SELECT * FROM OCORRENCIA
            order by DES_OCOR
        </sql:query>

        <sql:query var="consulta_tipo" dataSource="${conexao}">
            SELECT COD_TIPO, DES_TIPO FROM TIPO
        </sql:query>

        <sql:query var="consulta_os" dataSource="${conexao}">
            SELECT * FROM ORDEMSERVICO
        </sql:query>
            
        <script>
            var bairros/dt_ocor = new Array();
            var cod_bairros/descr_os = new Array();
            var cod_bairros/dt_agenda = new Array();
            <c:forEach var="dt_ocor" items="${consulta_os.rows}">
                <sql:query var="dt_agenda" dataSource="${conexao}">
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
                    <h1>Análise</h1>
                    <div >
                        <form  name="form1" method="post" action="">
                            <ul>
                                <li>
                                    <label  for="email"><strong>Código OS</strong></label>
                                        <div class="">
                                            <select name="consulta_tipo"> 
                                                <c:forEach items="${consulta_os.rows}" var="consulta_tipo">
                                                    <option value="${consulta_os.COD_OS}" >${consulta_tipo.DES_OS} </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    <label for="forml" ><strong>Data da Ocorrência</strong></label>
                                    <input type="text" name="dt_ocor" id="dt_ocor"></input>
                                    <label for="forml" ><strong>Data de Agendamento</strong></label>
                                    <input type="text" name="dt_agenda" id="dt_agenda"></input>
                                    <label for="forml" ><strong>Data Realizada</strong></label>
                                    <input type="date" name="dt_realizada" id="dt_realizada"></input> 
                                    <label for="forml" ><strong>Responsável</strong></label>
                                    <input type="text" name="responsavel" id="responsavel"></input>                                     
                                    <label for="forml" ><strong>Situação*</strong></label>
                                    <div class="">
                                        <select name="situacao"> 
                                            <c:forEach items="${situacao.rows}" var="situacao">
                                                <option value="${situacao.COD_SITUACAO}" >${situacao.DES_SITUACAO} </option>
                                            </c:forEach>
                                        </select>
                                    </div>                                         
                                    <label for="cometario"><strong>Descrição da Ocorrência</strong></label> 
                                    <textarea name="descricao" id="descricao" class="campo"></textarea> <br />                                    
                                    <label for="cometario"><strong>Situação Analisada</strong></label> 
                                    <textarea name="situacao_analisada" id="situacao_analisada" class="campo"></textarea> <br />                                    

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

