package br.com.importHair.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.importHair.models.Usuario;


@Repository
public class UsuarioDao implements UserDetailsService {

	@PersistenceContext
	private EntityManager manager;



	public Usuario addUsuario(Usuario usuario) {

		manager.persist(usuario);

		return usuario;
	}
	
	public String verificaUsuario(String email){
		try {
			Usuario usuario = manager.createQuery("select u from Usuario u where u.email = :email",Usuario.class)
					.setParameter("email", email).getSingleResult();
			return "true";
		} catch (NoResultException e) {
			return "false";
		}
	}



	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        List<Usuario> usuarios = manager.createQuery("select u from Usuario u where u.email = :email", Usuario.class)
                .setParameter("email", email).getResultList();
        if (usuarios.isEmpty()) {
            throw new UsernameNotFoundException("O usuário " + email + " não foi encontrado");
        }

        return usuarios.get(0);
    }
	
	public Usuario BuscaUsuario(String email){
		try {
			Usuario usuario = manager.createQuery("select u from Usuario u where u.email = :email", Usuario.class)
				.setParameter("email", email).getSingleResult();
			
				
			return usuario;
		} catch (Exception e) {
			return null;
		}
	}
	
	public Usuario BuscaUsuarioId(Integer id){
		try {
			Usuario usuario = manager.createQuery("select u from Usuario u where u.id = :id", Usuario.class)
				.setParameter("id", id).getSingleResult();
			
				
			return usuario;
		} catch (Exception e) {
			return null;
		}
	}
	
	public Usuario FindUsuarioHash(String hashRecovere){
		Usuario usuario = manager.createQuery("select u from Usuario u where u.hashRecovere = :hashRecovere",Usuario.class)
				.setParameter("hashRecovere", hashRecovere).getSingleResult();
		return usuario;
		
	}
	
	public Usuario atualizaSenha(Integer id, String senha){
		Usuario usuario = (Usuario) manager.createQuery("select u from Usuario u where u.id = :id").setParameter("id", id).getSingleResult();
		
		usuario.setSenha(senha);
		
		return usuario;
	}
	
	public Usuario atualizaUsuario(Integer id,Usuario usuarioNovo){
		Usuario usuario = this.BuscaUsuarioId(id);
		usuario.setNome(usuarioNovo.getNome());
		usuario.setEmail(usuarioNovo.getEmail());
		usuario.setEmailAlternativo(usuarioNovo.getEmailAlternativo());
		usuario.setTelefone(usuarioNovo.getTelefone());
		manager.merge(usuario);
		return usuario;
	}

}