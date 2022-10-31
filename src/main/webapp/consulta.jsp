<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.carrinho.dao.DaoProduto" %>
<%@page import="com.carrinho.entidades.Produto" %>

<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<body class="bg-light">
 <jsp:include page="navbar.jsp" />

<div class="container">
<h1 class="text-center">Produtos</h1>
<a class="btn btn-primary mb-2" href="consulta.jsp">Novo produto </a>

<table class="table table-responsive table-striped table-bordered">
<thead>
<tr>
<th>
Descrição
</th>
<th>Preço</th>
<th>Estoque</th>
<th>Unidade de medida</th>
<th>Opções</th>
</tr>
</thead>
<tbody>
    <%
        for(Produto prod:DaoProduto.listar()){
            out.write("<tr>");
            out.write("<td>"+prod.getDescricao()+"</td>");
            out.write("<td>"+prod.getPreco()+"</td>");
            out.write("<td>"+prod.getEstoque()+"</td>");
            out.write("<td>"+prod.getUnidadeMedida()+"</td>");
            out.write("<td><a class='btn btn-primary m-1' href=editar.jsp?id="+prod.getId()+">Editar</a><a class='btn btn-danger m-1' href=excluir.jsp?id="+prod.getId()+">Deletar</a></td>");

            out.write("</tr>");
        }
    %>

</tbody>
<table>


</div>
</body>
</html>