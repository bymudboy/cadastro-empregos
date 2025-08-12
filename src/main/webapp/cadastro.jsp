<%@ page import="dao.VagaDAO, model.Vaga" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    // Agora você pode ler os dados normalmente
    String descricao = request.getParameter("descricao");
    String obrigatorios = request.getParameter("obrigatorios");
    // etc...
%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro de Vaga</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <script src="${pageContext.request.contextPath}/js/validacao.js"></script> 


</head>
<body>
  <h2>Cadastro de Vaga</h2>
  <div class="container">
  <form id="formCadastro" action="CadastrarVagaServlet" method="post" onsubmit="return validarFormulario()" accept-charset="UTF-8">
    <label>Id da Vaga:</label>
<input type="number" name="idvaga" required min="1">

<label>Descrição do Cargo:</label>
<input type="text" name="descricao" maxlength="100" required>

<div class="dupla">
  <div class="campo">
    <label>Requisitos Obrigatórios:</label>
    <textarea name="obrigatorios" rows="3" required></textarea>
  </div>

  <div class="campo">
    <label>Requisitos Desejáveis:</label>
    <textarea name="desejaveis" rows="3" required></textarea>
  </div>
</div>

<label>Salário:</label>
<input type="number" name="salario" step="0.01" required>

<label>Benefícios:</label>
<textarea name="beneficios" required></textarea>

<label>Endereço da Vaga:</label>
<input type="text" name="endereco" maxlength="50" required>

<div class="dupla">
  <div class="campo">
    <label>Status da Vaga:</label>
	<div class="checkbox-group" >
  		<label><input type="radio" name="status" value="ativa" required> Ativa</label>
  		<label><input type="radio" name="status" value="inativa"> Inativa</label>
	</div>
  </div>

  <div class="campo">
    <label>Data de Criação:</label>
    <%
  java.time.LocalDate hoje = java.time.LocalDate.now(); // sempre atualizado
  java.time.LocalDate cincoAnosAtras = hoje.minusYears(5);
%>
<input type="date" name="dataCriacao" required
       min="<%= cincoAnosAtras %>"
       max="<%= hoje %>">

  </div>
</div>

	<div class="botoes">
  		<button type="submit">Cadastrar Vaga</button>
  		<button type="button" onclick="window.location.href='listarVaga.jsp'">Lista de Vagas</button>
	</div>

	
  </form>
  </div>
</body>
</html>
