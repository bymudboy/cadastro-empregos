package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Vaga;

public class VagaDAO {
	private String url = "jdbc:mysql://localhost:3306/sistema_vagas?useUnicode=true&characterEncoding=UTF-8";
    private String usuario = "root";
    private String senha = "Infantaria2013";

    public Connection conectar() throws SQLException {
        return DriverManager.getConnection(url, usuario, senha);
    }

    public void salvar(Vaga vaga) {
        String sql = "INSERT INTO vaga (idvaga, descricao, obrigatorios, desejaveis, salario, beneficios, endereco, status, dataCriacao) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, vaga.getIdvaga());
            stmt.setString(2, vaga.getDescricao());
            stmt.setString(3, vaga.getObrigatorios());
            stmt.setString(4, vaga.getDesejaveis());
            stmt.setDouble(5, vaga.getSalario());
            stmt.setString(6, vaga.getBeneficios());
            stmt.setString(7, vaga.getEndereco());
            stmt.setString(8, vaga.getStatus());
            stmt.setDate(9, Date.valueOf(vaga.getDataCriacao()));

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Para fins de teste
        System.out.println("Salvando vaga no banco...");

    }

    public List<Vaga> listar() {
        List<Vaga> lista = new ArrayList<>();
        String sql = "SELECT * FROM vaga";

        try (Connection conn = conectar();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Vaga vaga = new Vaga();
                vaga.setIdvaga(rs.getInt("idvaga"));
                vaga.setDescricao(rs.getString("descricao"));
                vaga.setObrigatorios(rs.getString("obrigatorios"));
                vaga.setDesejaveis(rs.getString("desejaveis"));
                vaga.setSalario(rs.getDouble("salario"));
                vaga.setBeneficios(rs.getString("beneficios"));
                vaga.setEndereco(rs.getString("endereco"));
                vaga.setStatus(rs.getString("status"));
                vaga.setDataCriacao(rs.getDate("dataCriacao").toLocalDate());

                lista.add(vaga);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    // Você pode adicionar métodos como atualizar, excluir, buscarPorId etc.
    public Vaga buscarPorId(int id) {
        Vaga vaga = null;
        String sql = "SELECT * FROM vaga WHERE idvaga = ?";

        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                vaga = new Vaga();
                vaga.setIdvaga(rs.getInt("idvaga"));
                vaga.setDescricao(rs.getString("descricao"));
                vaga.setObrigatorios(rs.getString("obrigatorios"));
                vaga.setDesejaveis(rs.getString("desejaveis"));
                vaga.setSalario(rs.getDouble("salario"));
                vaga.setBeneficios(rs.getString("beneficios"));
                vaga.setEndereco(rs.getString("endereco"));
                vaga.setStatus(rs.getString("status"));
                vaga.setDataCriacao(rs.getDate("dataCriacao").toLocalDate());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vaga;
    }

    public void atualizar(Vaga v, int idOriginal) {
        String sql = "UPDATE vaga SET idvaga=?, descricao=?, obrigatorios=?, desejaveis=?, salario=?, beneficios=?, endereco=?, status=?, dataCriacao=? WHERE idvaga=?";

        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, v.getIdvaga()); // novo ID
            stmt.setString(2, v.getDescricao());
            stmt.setString(3, v.getObrigatorios());
            stmt.setString(4, v.getDesejaveis());
            stmt.setDouble(5, v.getSalario());
            stmt.setString(6, v.getBeneficios());
            stmt.setString(7, v.getEndereco());
            stmt.setString(8, v.getStatus());
            stmt.setDate(9, java.sql.Date.valueOf(v.getDataCriacao()));
            stmt.setInt(10, idOriginal); // ID antigo para localizar no banco

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void excluir(int id) {
        String sql = "DELETE FROM vaga WHERE idvaga = ?";

        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
