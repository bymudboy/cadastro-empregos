<%@ page import="java.util.*, model.Vaga, dao.VagaDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.time.format.DateTimeFormatter" %>


<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Vagas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleListar.css">
    
</head>
<body>
    <h2>Vagas Cadastradas</h2>

    <%
        VagaDAO dao = new VagaDAO();
        List<Vaga> vagas = dao.listar();

        if (vagas.isEmpty()) {
    %>
<div style="text-align: center; margin-top: 20px;">
    <p>Nenhuma vaga cadastrada.</p>
    <form action="cadastro.jsp" method="get">
    	<button type="submit" style="padding: 10px 20px; background-color: #0077c8; color: white; border: none; border-radius: 5px; cursor: pointer;">
        	Voltar para Cadastro
    	</button>
	</form>
</div>
        
    <%
        } else {
    %>
        <table>
    <tr>
        <th>ID</th>
        <th>Descrição</th>
        <th>Obrigatórios</th>
        <th>Desejáveis</th>
        <th>Salário</th>
        <th>Benefícios</th>
        <th>Endereço</th>
        <th>Status</th>
        <th>Data de Criação</th>
        <th>Ações</th> <!-- Nova coluna -->
    </tr>
    <%
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yy");
	%>

    
    <%
        for (Vaga v : vagas) {
    %>
    <tr>
        <td><%= v.getIdvaga() %></td>
        <td><%= v.getDescricao() %></td>
        <td><%= v.getObrigatorios() %></td>
        <td><%= v.getDesejaveis() %></td>
        <td>R$ <%= String.format("%.2f", v.getSalario()) %></td>
        <td><%= v.getBeneficios() %></td>
        <td><%= v.getEndereco() %></td>
        <td><%= v.getStatus() %></td>
        <td><%= v.getDataCriacao().format(formatter) %></td>
        <td>
  			<div class="botao-acoes">
  				<form action="editarVaga.jsp" method="get">
    				<input type="hidden" name="id" value="<%= v.getIdvaga() %>">
    				<input type="submit" value="Editar">
				</form>

				<form action="excluirVaga.jsp" method="post">
    				<input type="hidden" name="id" value="<%= v.getIdvaga() %>">
   					<input type="submit" value="Excluir">
				</form>

  				<form action="cadastro.jsp" method="get">
    				<button type="submit" class="botao-cadastrar">Cadastrar nova vaga</button>
  				</form>
			</div>

		</td>

    </tr>
    <%
        }
    %>
</table>

    <%
        }
    %>
</body>
</html>
