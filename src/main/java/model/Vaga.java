package model;

import java.time.LocalDate;

public class Vaga {
    private int idvaga;
    private String descricao;
    private String obrigatorios;
    private String desejaveis;
    private double salario;
    private String beneficios;
    private String endereco;
    private String status;
    private LocalDate dataCriacao;

    // Construtores
    public Vaga() {}

    public Vaga(int idvaga, String descricao, String obrigatorios, String desejaveis,
                double salario, String beneficios, String endereco, String status, LocalDate dataCriacao) {
        this.idvaga = idvaga;
        this.descricao = descricao;
        this.obrigatorios = obrigatorios;
        this.desejaveis = desejaveis;
        this.salario = salario;
        this.beneficios = beneficios;
        this.endereco = endereco;
        this.status = status;
        this.dataCriacao = dataCriacao;
    }

    // Getters e Setters
    public int getIdvaga() { return idvaga; }
    public void setIdvaga(int idvaga) { this.idvaga = idvaga; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getObrigatorios() { return obrigatorios; }
    public void setObrigatorios(String obrigatorios) { this.obrigatorios = obrigatorios; }

    public String getDesejaveis() { return desejaveis; }
    public void setDesejaveis(String desejaveis) { this.desejaveis = desejaveis; }

    public double getSalario() { return salario; }
    public void setSalario(double salario) { this.salario = salario; }

    public String getBeneficios() { return beneficios; }
    public void setBeneficios(String beneficios) { this.beneficios = beneficios; }

    public String getEndereco() { return endereco; }
    public void setEndereco(String endereco) { this.endereco = endereco; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public LocalDate getDataCriacao() { return dataCriacao; }
    public void setDataCriacao(LocalDate dataCriacao) { this.dataCriacao = dataCriacao; }
}
