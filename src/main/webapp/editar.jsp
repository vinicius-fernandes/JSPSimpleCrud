<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.carrinho.entidades.Produto" %>
<%@page import="com.carrinho.dao.DaoProduto" %>

<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<%
int idEdit = Integer.parseInt(request.getParameter("id"));
Produto produto = DaoProduto.consultar(idEdit);

%>
<body class="bg-light">
<div class="container">
<form action="cadastro.jsp" method="POST">
<div class="form-group mb-3">
 <label for="descricao">ID</label>
 <input type="text" class="form-control" name="id" id="id" readonly value="<% out.write(""+idEdit); %>"/>
</div>
<div class="form-group mb-3">
 <label for="descricao">Descrição</label>
 <input type="text" class="form-control" name="descricao" id="descricao" required value="<% out.write(produto.getDescricao()); %>"/>
</div>
<div class="form-group mb-3">

  <label for="preco">Preço</label>
 <input type="number" class="form-control" name="preco" id="preco" value="<% out.write(""+produto.getPreco()); %>"/>
 </div>
 <div class="form-group mb-3">

  <label for="estoque">Estoque</label>
 <input type="number" class="form-control" name="estoque" id="estoque" value="<% out.write(""+produto.getEstoque()); %>"/>
</div>
<div class="form-group mb-3">

  <label for="unidadeMedida">Unidade de medida</label>
 <input type="text" class="form-control" name="unidadeMedida" id="unidadeMedida" value="<% out.write(produto.getUnidadeMedida()); %>"/>
 </div>
 <button class="btn btn-success mt-4">Salvar</button>
</form>

<%


    if(request.getParameter("descricao")!=null
    && request.getParameter("preco")!=null
    && request.getParameter("estoque")!=null
    && request.getParameter("unidadeMedida")!=null
    && request.getParameter("id")!=null
    && !request.getParameter("descricao").isEmpty()
    && !request.getParameter("preco").isEmpty()
    && !request.getParameter("estoque").isEmpty()
    && !request.getParameter("unidadeMedida").isEmpty()
    && !request.getParameter("id").isEmpty()
        ){
        String descricao = request.getParameter("descricao");
        float preco =  Float.parseFloat(request.getParameter("preco"));
        float estoque = Float.parseFloat(request.getParameter("estoque"));
        String unidadeMedida = request.getParameter("unidadeMedida");

        Produto p = new Produto(descricao,preco,estoque,unidadeMedida);
        DaoProduto.editar(p,Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("consulta.jsp");
    }
%>

</div>
</body>
</html>