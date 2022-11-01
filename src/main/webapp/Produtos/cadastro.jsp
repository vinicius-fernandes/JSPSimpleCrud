<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.carrinho.entidades.Produto" %>
<%@page import="com.carrinho.dao.DaoProduto" %>

<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<body class="bg-light">
 <jsp:include page="../Layout/navbar.jsp" />

<div class="container">
<h1 class="text-center">Cadastro</h1>
<form action="cadastro.jsp" method="POST">
<div class="form-group mb-3">
 <label for="descricao">Descrição</label>
 <input type="text" class="form-control" name="descricao" id="descricao" required/>
</div>
<div class="form-group mb-3">

  <label for="preco">Preço</label>
 <input type="number" class="form-control" name="preco" id="preco" />
 </div>
 <div class="form-group mb-3">

  <label for="estoque">Estoque</label>
 <input type="number" class="form-control" name="estoque" id="estoque" />
</div>
<div class="form-group mb-3">

  <label for="unidadeMedida">Unidade de medida</label>
 <input type="text" class="form-control" name="unidadeMedida" id="unidadeMedida" />
 </div>
 <button class="btn btn-success mt-4">Salvar</button>
</form>

<%
   

    if(request.getParameter("descricao")!=null
    && request.getParameter("preco")!=null
    && request.getParameter("estoque")!=null
    && request.getParameter("unidadeMedida")!=null
    && !request.getParameter("descricao").isEmpty()
    && !request.getParameter("preco").isEmpty()
    && !request.getParameter("estoque").isEmpty()
    && !request.getParameter("unidadeMedida").isEmpty()
        ){
        String descricao = request.getParameter("descricao");
        float preco =  Float.parseFloat(request.getParameter("preco"));
        float estoque = Float.parseFloat(request.getParameter("estoque"));
        String unidadeMedida = request.getParameter("unidadeMedida");

        Produto p = new Produto(descricao,preco,estoque,unidadeMedida);

        DaoProduto.salvar(p);
        response.sendRedirect("consulta.jsp");
    }
%>

</div>
</body>
</html>