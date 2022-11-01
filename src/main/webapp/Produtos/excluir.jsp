<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.carrinho.entidades.Produto" %>
<%@page import="com.carrinho.dao.DaoProduto" %>

<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<%
int idExcluir = Integer.parseInt(request.getParameter("id"));
Produto produto = DaoProduto.consultar(idExcluir);

%>
<body class="bg-light">
 <jsp:include page="../Layout/navbar.jsp" />

<div class="container">
<h1>Você realmente deseja excluir o produto abaixo?</h1>
<form action="excluir.jsp" method="POST">
<div class="form-group mb-3">
 <label for="descricao">ID</label>
 <input type="text" class="form-control" name="id" id="id" readonly value="<% out.write(""+idExcluir); %>"/>
</div>
<div class="form-group mb-3">
 <label for="descricao">Descrição</label>
 <input type="text" class="form-control" name="descricao" id="descricao" readonly value="<% out.write(produto.getDescricao()); %>"/>
</div>

<div class="form-check">
  <input class="form-check-input" type="radio" name="excluir" id="excluirSim" value="1" required/>
  <label class="form-check-label" for="excluirSim">
    Sim
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="excluir" id="excluirNao" value="0" >
  <label class="form-check-label" for="excluirNao">
  Não
  </label>
</div>

 <button class="btn btn-success mt-4">Confirmar</button>
</form>

<%

if(request.getParameter("id")!=null
    && request.getParameter("excluir")!=null
    && !request.getParameter("id").isEmpty()
    && !request.getParameter("excluir").isEmpty()
    ){
        int id = Integer.parseInt(request.getParameter("id"));
        int opcaoExcluir = Integer.parseInt(request.getParameter("excluir"));

        if(opcaoExcluir==1){
            DaoProduto.excluir(id);
        }
        response.sendRedirect("consulta.jsp");
    }

%>

</div>
</body>
</html>