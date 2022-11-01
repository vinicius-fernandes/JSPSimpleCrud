<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.carrinho.dao.DaoProduto" %>
<%@page import="com.carrinho.entidades.Produto" %>
<%@page import="java.util.List" %>


<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<body class="bg-light">
 <jsp:include page="/Layout/navbar.jsp" />
<div class="container">
<h1>Produtos </h1>
<%
  out.write("<div class='border rounded p-2 m-1'>");
            out.write("<form action='CarrinhoAdicionar.jsp' method='POST'>");
            out.write("<label>Produto</label>");
            out.write("<select class='form-select' name='produto' required>");
            out.write("<option value=''>Selecione um produto</option>");
     for(Produto prod:DaoProduto.listar()){


            out.write("<option class='form-control' value='"+prod.getId()+"'>" + prod.getDescricao() +"</option>");


    }
              out.write("</select>");
              out.write("<label>Quantidade desejada</label>");
                out.write("<input type='number' class='form-control' name='quantidade'/> ");
                out.write("<button class='btn btn-success mt-3'>Adicionar ao carrinho</button> ");

                out.write("</form>");
                out.write("</div>");
%>
</div>
</body>
</html>
