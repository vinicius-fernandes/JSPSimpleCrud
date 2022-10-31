package com.carrinho.dao;

import com.carrinho.entidades.Produto;
import com.carrinho.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoProduto {
    public static List<Produto> produtos = new ArrayList<Produto>();

    public static String salvar(Produto produto){

        Connection con = Conexao.conectar();
        if(con !=null){

            String sql = "insert into produto (descricao,preco,estoque,unidadeMedida) values (?,?,?,?)";

            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1,produto.getDescricao());
                stm.setFloat(2,produto.getPreco());
                stm.setFloat(3,produto.getEstoque());
                stm.setString(4,produto.getUnidadeMedida());
                stm.execute();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            return "Regiso inserido com sucesso!";
        }
        return "erro de conexão";
    }
    public static String editar(Produto produto,int id){

        Connection con = Conexao.conectar();
        if(con !=null){

            String sql = "update produto set descricao=?,";
            sql += "preco=?,";
            sql += "estoque=?,";
            sql += "unidadeMedida=?";
            sql += "where id = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1,produto.getDescricao());
                stm.setFloat(2,produto.getPreco());
                stm.setFloat(3,produto.getEstoque());
                stm.setString(4,produto.getUnidadeMedida());
                stm.setInt(5,id);
                stm.execute();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            return "Regiso inserido com sucesso!";
        }
        return "erro de conexão";
    }

    public static void excluir(int id){
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement("delete from produto where id=?");
            stm.setInt(1,id);
            stm.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Produto> listar(){
        List<Produto> lista = new ArrayList<Produto>();

        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement("select * from produto");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Produto p = new Produto(rs.getString("descricao"),rs.getFloat("preco"),rs.getFloat("estoque"),rs.getString("unidadeMedida"));
                p.setId(rs.getInt("id"));
                lista.add(p);
            }

        } catch (SQLException e) {
            return lista;
        }


        return lista;
    }

    public static Produto consultar(int id){
        Produto prod = new Produto();
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement("select * from produto where id = ?");
            stm.setInt(1,id);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                prod = new Produto(rs.getString("descricao"),rs.getFloat("preco"),rs.getFloat("estoque"),rs.getString("unidadeMedida"));
                prod.setId(id);
            }
            return prod;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
