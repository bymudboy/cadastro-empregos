package controller;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.VagaDAO;
import model.Vaga;

@WebServlet("/CadastrarVagaServlet")
public class CadastrarVagaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Receber os dados do formulário
            int idvaga = Integer.parseInt(request.getParameter("idvaga"));
            String descricao = request.getParameter("descricao");
            String obrigatorios = request.getParameter("obrigatorios");
            String desejaveis = request.getParameter("desejaveis");
            double salario = Double.parseDouble(request.getParameter("salario"));
            String beneficios = request.getParameter("beneficios");
            String endereco = request.getParameter("endereco");
            String status = request.getParameter("status");
            LocalDate dataCriacao = LocalDate.parse(request.getParameter("dataCriacao"));

            // Criar objeto Vaga
            Vaga vaga = new Vaga(idvaga, descricao, obrigatorios, desejaveis, salario,
                                 beneficios, endereco, status, dataCriacao);

            // Salvar no banco
            VagaDAO dao = new VagaDAO();
            dao.salvar(vaga);

            // Redirecionar para página de sucesso ou listagem
            response.sendRedirect("listarVaga.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_OK);
        }
        response.sendRedirect("listarVaga.jsp");


    }
}
