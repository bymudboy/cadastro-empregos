<%@ page import="dao.VagaDAO, model.Vaga" %>
<%
    Vaga v = new Vaga();
	int idOriginal = Integer.parseInt(request.getParameter("idOriginal"));


    v.setIdvaga(Integer.parseInt(request.getParameter("idvaga")));
    v.setDescricao(request.getParameter("descricao"));
    v.setObrigatorios(request.getParameter("obrigatorios"));
    v.setDesejaveis(request.getParameter("desejaveis"));
    v.setSalario(Double.parseDouble(request.getParameter("salario")));
    v.setBeneficios(request.getParameter("beneficios"));
    v.setEndereco(request.getParameter("endereco"));
    v.setStatus(request.getParameter("status"));
    v.setDataCriacao(java.time.LocalDate.parse(request.getParameter("dataCriacao")));

    VagaDAO dao = new VagaDAO();
    dao.atualizar(v, idOriginal);

    response.sendRedirect("listarVaga.jsp");
%>
