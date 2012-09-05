<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciamento de Boletins de Ocorrências</title>
       
        <% String usuario = request.getParameter("usuario");
        %>
        
    </head>
    <body>

    <h1>usuario</h1>
    
    <%@ include file="conexao.jsp" %>
    
    <sql:query var="municipio" dataSource="${conexao}">
     SELECT COD_MUN,DES_MUNICIPIO FROM MUNICIPIO
</sql:query> 
        <c:forEach var="municipio" begin="0" items="${MUNICIPIO.row[0].COD_MUN}">
                <form name="Teste" action="index.jsp"><ol>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>COD</th>
                                    <th>MUNICIPIO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${MUNICIPIO.COD_MUN}</td>
                                    <td>${MUNICIPIO.DES_MUNICIPIO}</td>
                                </tr>
                                <tr>
                                    <td>${MUNICIPIO.COD_MUN}</td>
                                    <td>${MUNICIPIO.DES_MUNICIPIO}</td>
                                </tr>
                            </tbody>
                        </table>
                     
                    </ol>
                                     
                </form>
                
            
        </c:forEach>
    </body>
</html>
