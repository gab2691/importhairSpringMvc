package br.com.importHair.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.importHair.models.Pedido;

@Repository
public class PedidoDao {
	
	@PersistenceContext
	private EntityManager manager;	
	
	public void addPedido(Pedido pedido){
		manager.persist(pedido);
	}
	
	
	public List<Pedido> pedidoId(Integer id){
		List <Pedido> pedido  = manager.createQuery("select p from Pedido p where p.usuario.id = :id").setParameter("id", id).getResultList();
		
		return pedido;
	}
	
	public Pedido unicoPedidoId(Integer id){
		Pedido pedido = (Pedido)manager.createQuery("select p from Pedido p where p.id = :id").setParameter("id", id).getSingleResult();
		
		return pedido;
	}
	
	
}
