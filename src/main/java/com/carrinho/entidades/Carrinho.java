package com.carrinho.entidades;

public class Carrinho {

    private int id;
    private int quantidade;

    private Produto produto;
    public Carrinho(int id, int quantidade) {
        this.id = id;
        this.quantidade = quantidade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public float subTotal() {
        if (this.produto != null) {
            return this.quantidade * this.produto.getPreco();
        }
        return 0;
    }
}
