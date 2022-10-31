<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.carrinho.dao.DaoProduto" %>
<%@page import="com.carrinho.entidades.Produto" %>
<%@page import="java.util.List" %>


<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<body class="bg-light">
 <jsp:include page="navbar.jsp" />
<div class="container">
<h1>Ultimos produtos </h1>
<%

    int i=0;
     for(Produto prod:DaoProduto.listar()){
            if(i==9){
            break;
            }
            out.write("<div class='alert alert-primary'>");
            out.write(prod.getDescricao());
            out.write("</div>");
            i++;
    }
%>
<a href=consulta.jsp class="btn btn-primary">Visualizar todos</a>
</div>
</body>
</html>
