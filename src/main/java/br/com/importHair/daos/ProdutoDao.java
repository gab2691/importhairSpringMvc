package br.com.importHair.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.importHair.models.Produtos;

@Repository
public class ProdutoDao {
	
	@PersistenceContext
	private EntityManager manager;
	
	
	public List<Produtos> listaProdutos(){
		return manager.createQuery("select p from Produtos p").getResultList();
	}
	
	public Produtos produto(Integer id){
		return (Produtos) manager.createQuery("select p from Produtos p where p.id = "+ id).getSingleResult();
	}
}
