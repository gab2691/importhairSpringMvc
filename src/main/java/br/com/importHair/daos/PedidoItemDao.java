package br.com.importHair.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.importHair.models.PedidoItem;


@Repository
public class PedidoItemDao {

	
	@PersistenceContext
	private EntityManager manager;
	
	
	public PedidoItem addPI(PedidoItem item){
		manager.persist(item);
		return item;
	}
	
	
	public List<PedidoItemDao> pedidoItemId(Integer id){
		List<PedidoItemDao> pedidoItens = manager.createQuery("select p from PedidoItem p where p.pedido.id = :id ").setParameter("id", id).getResultList();
		
		return pedidoItens;
		
	}
}
