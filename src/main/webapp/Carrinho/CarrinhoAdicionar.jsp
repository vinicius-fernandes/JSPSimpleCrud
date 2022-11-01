<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.carrinho.dao.DaoCarrinho" %>
<%@page import="com.carrinho.entidades.Carrinho" %>
<%@page import="com.carrinho.entidades.Produto" %>


<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<body class="bg-light">
 <jsp:include page="../Layout/navbar.jsp" />



 <%
    if(
    request.getParameter("produto") != null
    && request.getParameter("quantidade") != null
    && ! request.getParameter("quantidade").isEmpty()
    && ! request.getParameter("quantidade").isEmpty()
    ){
        Carrinho c = new Carrinho(Integer.ParseInt(request.getParameter("produto")),Integer.ParseInt(request.getParameter("quantidade")));

       if(DaoCarrinho.adicionar(c)){
            response.sendRedirect("CarrinhoConsulta.jsp");
        }
        else{
        out.write("<p class='alert alert-danger'>Não é possível adicionar o produto ao carrinho, o estoque pode ser insuficiente</p>")
        }

    }
    else{
    out.write("<p class='alert alert-danger'>Não é possível identificar o produto ou a quantidade que se deseja adicionar</p>");
    }

 %>

 </body>
 </html>