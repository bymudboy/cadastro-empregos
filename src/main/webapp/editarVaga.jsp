<%@ page import="dao.VagaDAO, model.Vaga" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    VagaDAO dao = new VagaDAO();
    Vaga vaga = dao.buscarPorId(id);
    java.time.LocalDate hoje = java.time.LocalDate.now();
    java.time.LocalDate cincoAnosAtras = hoje.minusYears(5);
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Vaga</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleEditar.css">
</head>
<body>

<h2>Editar Vaga</h2>
<div class="container">
<form action="atualizarVaga.jsp" method="post">
    <input type="hidden" name="idOriginal" value="<%= vaga.getIdvaga() %>">

    <label>Novo Id da Vaga:</label>
    <input type="number" name="idvaga" required min="1" value="<%= vaga.getIdvaga() %>">    

    <label>Descrição do Cargo:</label>
    <input type="text" name="descricao" maxlength="100" required value="<%= vaga.getDescricao() %>">

    <div class="dupla">
        <div class="campo">
            <label>Requisitos Obrigatórios:</label>
            <textarea name="obrigatorios" rows="3" required><%= vaga.getObrigatorios() %></textarea>
        </div>

        <div class="campo">
            <label>Requisitos Desejáveis:</label>
            <textarea name="desejaveis" rows="3" required><%= vaga.getDesejaveis() %></textarea>
        </div>
    </div>

    <label>Salário:</label>
    <input type="number" name="salario" step="0.01" required value="<%= vaga.getSalario() %>">

    <label>Benefícios:</label>
    <textarea name="beneficios" required><%= vaga.getBeneficios() %></textarea>

    <label>Endereço da Vaga:</label>
    <input type="text" name="endereco" maxlength="50" required value="<%= vaga.getEndereco() %>">

    <div class="dupla">
        <div class="campo">
            <label>Status da Vaga:</label>
            <div class="checkbox-group">
                <label>
                    <input type="radio" name="status" value="ativa" <%= "ativa".equals(vaga.getStatus()) ? "checked" : "" %>> Ativa
                </label>
                <label>
                    <input type="radio" name="status" value="inativa" <%= "inativa".equals(vaga.getStatus()) ? "checked" : "" %>> Inativa
                </label>
            </div>
        </div>

        <div class="campo">
            <label>Data de Criação:</label>
            <input type="date" name="dataCriacao" required
                   min="<%= cincoAnosAtras %>"
                   max="<%= hoje %>"
                   value="<%= vaga.getDataCriacao() %>">
        </div>
    </div>

    <input type="submit" value="Atualizar Vaga">
</form>
</div>
</body>
</html>
