package com.carrinho.entidades;

public class Produto {
    private String descricao;
    private float preco;
    private float estoque;

    private int id;
    private String unidadeMedida;

    public Produto(){

    }

    public Produto(String descricao, float preco) {
        this.descricao = descricao;
        this.preco = preco;
    }

    public Produto(String descricao, float preco, float estoque, String unidadeMedida) {
        this.descricao = descricao;
        this.preco = preco;
        this.estoque = estoque;
        this.unidadeMedida = unidadeMedida;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public float getEstoque() {
        return estoque;
    }

    public void setEstoque(float estoque) {
        this.estoque = estoque;
    }

    public String getUnidadeMedida() {
        return unidadeMedida;
    }

    public void setUnidadeMedida(String unidadeMedida) {
        this.unidadeMedida = unidadeMedida;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
