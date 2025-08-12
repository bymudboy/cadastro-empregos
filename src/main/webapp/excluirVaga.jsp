<%@ page import="dao.VagaDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    VagaDAO dao = new VagaDAO();
    dao.excluir(id); // você precisa implementar esse método

    response.sendRedirect("listarVaga.jsp");
%>
