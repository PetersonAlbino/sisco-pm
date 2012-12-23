<%-- 
    Document   : queryp
    Created on : 12/12/2012, 19:49:54
    Author     : Peterson
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <c:set var="query">
        SELECT
        OCORRENCIA."COD_OCOR" AS OCORRENCIA_COD_OCOR,
        OCORRENCIA."COD_MATERIAL" AS OCORRENCIA_COD_MATERIAL,
        OCORRENCIA."COD_OS" AS OCORRENCIA_COD_OS,
        OCORRENCIA."COD_TIPO" AS OCORRENCIA_COD_TIPO,
        OCORRENCIA."COD_SITUACAO" AS OCORRENCIA_COD_SITUACAO,
        OCORRENCIA."COD_ENDERECO" AS OCORRENCIA_COD_ENDERECO,
        OCORRENCIA."DES_OCOR" AS OCORRENCIA_DES_OCOR,
        OCORRENCIA."DT_OCOR" AS OCORRENCIA_DT_OCOR,
        OCORRENCIA."COD_DENUNCIANTE" AS OCORRENCIA_COD_DENUNCIANTE,
        ORDEMSERVICO."COD_OS" AS ORDEMSERVICO_COD_OS,
        ORDEMSERVICO."DES_OS" AS ORDEMSERVICO_DES_OS,
        ORDEMSERVICO."DT_GERACAO" AS ORDEMSERVICO_DT_GERACAO,
        ORDEMSERVICO."SITUACAO_ANALIZADA" AS ORDEMSERVICO_SITUACAO_ANALIZADA,
        ORDEMSERVICO."COD_MATERIAL" AS ORDEMSERVICO_COD_MATERIAL,
        ORDEMSERVICO."DT_AGENDA" AS ORDEMSERVICO_DT_AGENDA,
        ORDEMSERVICO."DT_REALIZADA" AS ORDEMSERVICO_DT_REALIZADA,
        ORDEMSERVICO."RESPONSAVEL" AS ORDEMSERVICO_RESPONSAVEL,
        ORDEMSERVICO."COD_OCORRENCIA" AS ORDEMSERVICO_COD_OCORRENCIA,
        ORDEMSERVICO."COD_SITUACAO" AS ORDEMSERVICO_COD_SITUACAO,
        ENDERECO."COD_ENDERECO" AS ENDERECO_COD_ENDERECO,
        ENDERECO."COD_MUN" AS ENDERECO_COD_MUN,
        ENDERECO."COD_BAIRRO" AS ENDERECO_COD_BAIRRO,
        ENDERECO."NM_RUA" AS ENDERECO_NM_RUA,
        ENDERECO."DES_LOCAL" AS ENDERECO_DES_LOCAL,
        ENDERECO."QUADRA_LOCAL" AS ENDERECO_QUADRA_LOCAL,
        ENDERECO."LOTE_LOCAL" AS ENDERECO_LOTE_LOCAL,
        ENDERECO."NUM_LOCAL" AS ENDERECO_NUM_LOCAL,
        ENDERECO."CEP_LOCAL" AS ENDERECO_CEP_LOCAL,
        BAIRRO."COD_BAIRRO" AS BAIRRO_COD_BAIRRO,
        BAIRRO."COD_MUN" AS BAIRRO_COD_MUN,
        BAIRRO."NOME_BAIRRO" AS BAIRRO_NOME_BAIRRO,
        MUNICIPIO."COD_MUN" AS MUNICIPIO_COD_MUN,
        MUNICIPIO."DES_MUN" AS MUNICIPIO_DES_MUN
        FROM
        "OCORRENCIA" OCORRENCIA INNER JOIN "ORDEMSERVICO" ORDEMSERVICO ON OCORRENCIA."COD_OCOR" = ORDEMSERVICO."COD_OCORRENCIA"
        INNER JOIN "ENDERECO" ENDERECO ON OCORRENCIA."COD_ENDERECO" = ENDERECO."COD_ENDERECO"
        INNER JOIN "BAIRRO" BAIRRO ON ENDERECO."COD_BAIRRO" = BAIRRO."COD_BAIRRO"
        INNER JOIN "MUNICIPIO" MUNICIPIO ON ENDERECO."COD_MUN" = MUNICIPIO."COD_MUN"
        WHERE ORDEMSERVICO.COD_OS = ${param.id}
    </c:set>
    <c:url value="GeraRelatoriosFiltro.jsp" var="relatorio">
            <c:param name="queryp" value="${query}"></c:param>
            <c:param name="reportName" value="Relatorios/OS.jasper"></c:param>
        </c:url>
        <c:redirect url="${relatorio}"></c:redirect>
</html>
