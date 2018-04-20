package br.com.importHair.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.importHair.models.Endereco;

@Repository
public class EnderecoDao {

	@PersistenceContext
	private EntityManager manager;
	
	
	public void addEndereco(Endereco endereco){
		manager.persist(endereco);
	}
	
	public Endereco enderecoPorId(Integer id){
		Endereco endereco = (Endereco) manager.createQuery("select e from Endereco e where e.usuario.id = :id").setParameter("id", id).getSingleResult();
		return endereco;
	}
	
	public Endereco atualizaEnd(Integer id,Endereco endereco){
		Endereco enderecoPorId = this.enderecoPorId(id);
		enderecoPorId.setBairro(endereco.getBairro());
		enderecoPorId.setCep(endereco.getCep());
		enderecoPorId.setCidade(endereco.getCidade());
		enderecoPorId.setComplemento(endereco.getComplemento());
		enderecoPorId.setLogradouro(endereco.getLogradouro());
		enderecoPorId.setNumero(endereco.getNumero());
		enderecoPorId.setUf(endereco.getUf());
		
		manager.merge(enderecoPorId);
		
		return enderecoPorId;
	}	
}
