<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.carrinho.dao.DaoCarrinho" %>
<%@page import="com.carrinho.entidades.Carrinho" %>
<%@page import="com.carrinho.entidades.Produto" %>

<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<body class="bg-light">
 <jsp:include page="../Layout/navbar.jsp" />

<div class="container">
<h1 class="text-center">Carrinho</h1>

<table class="table table-responsive table-striped table-bordered">
<thead>
<tr>
<th>
Código Produto
</th>
<th>Descrição</th>
<th>Quantidade</th>
<th>Valor unitário</th>
<th>Subtotal</th>
</tr>
</thead>
<tbody>
    <%
        int total = 0;
        for(Carrinho carrinho:DaoCarrinho.listar()){
            total+=carrinho.subTotal();
            out.write("<tr>");
            out.write("<td>"+carrinho.getId()+"</td>");
            out.write("<td>"+carrinho.getProduto().getDescricao()+"</td>");
            out.write("<td>"+carrinho.getQuantidade()+"</td>");
            out.write("<td>"+carrinho.getProduto().getPreco()+"</td>");
            out.write("<td>"+carrinho.subTotal()+"</td>");
            out.write("<td><a class='btn btn-primary m-1' href=editar.jsp?id="+carrinho.getId()+">Editar</a><a class='btn btn-danger m-1' href=excluir.jsp?id="+carrinho.getId()+">Deletar</a></td>");

            out.write("</tr>");
        }
            out.write("<tr>");
                    out.write("<td></td>");
                    out.write("<td></td>");
                    out.write("<td></td>");
                    out.write("<td></td>");
                    out.write("<td>Total R$</td>");
                    out.write("<td>"+total+"</td>");

                    out.write("</tr>");
    %>

</tbody>
<table>


</div>
</body>
</html>