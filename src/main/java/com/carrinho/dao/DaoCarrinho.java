package com.carrinho.dao;

import com.carrinho.entidades.Carrinho;
import com.carrinho.entidades.Produto;
import com.carrinho.utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoCarrinho {

    public static List<Carrinho> listar(){
        List<Carrinho> lista = new ArrayList<Carrinho>();

        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement("select p.id,quantidade,descricao,preco,estoque,unidadeMedida from carrinho c inner join produto p on p.id = c.id");
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Produto p = new Produto(rs.getString("descricao"),rs.getFloat("preco"),rs.getFloat("estoque"),rs.getString("unidadeMedida"));
                p.setId(rs.getInt("id"));
                Carrinho c = new Carrinho(rs.getInt("id"),rs.getInt("quantidade"));
                c.setProduto(p);
                lista.add(c);
            }

        } catch (SQLException e) {
            return lista;
        }


        return lista;
    }
    public static boolean adicionar(Carrinho carrinho){
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stmCheckExiste = con.prepareStatement("select id,quantidade from carrinho where id = ?");
            ResultSet rsCheckExiste = stmCheckExiste.executeQuery();
            float estoqueDisponivel = DaoProduto.getEstoqueProduto(carrinho.getId());
            if(rsCheckExiste.next()){
                Carrinho carrinhoAntigo = new Carrinho(rsCheckExiste.getInt("id"),rsCheckExiste.getInt("quantidade"));
                if(estoqueDisponivel-carrinho.getQuantidade()>0){
                    PreparedStatement stmUpdateCarrinho = con.prepareStatement("update carrinho set quantidade=? where id = ?");
                    stmUpdateCarrinho.setFloat(1,carrinho.getQuantidade()+carrinhoAntigo.getQuantidade());
                }
                else{
                    return false;
                }
            }
            else{

            }



        } catch (SQLException e) {
            return false;
        }
        return true;

    }

}
