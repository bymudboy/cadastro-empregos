<%@ page import="dao.VagaDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    VagaDAO dao = new VagaDAO();
    dao.excluir(id); // voc� precisa implementar esse m�todo

    response.sendRedirect("listarVaga.jsp");
%>
