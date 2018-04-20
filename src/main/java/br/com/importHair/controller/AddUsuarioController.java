package br.com.importHair.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.importHair.daos.EnderecoDao;
import br.com.importHair.daos.UsuarioDao;
import br.com.importHair.models.Endereco;
import br.com.importHair.models.Usuario;

@Controller
@Transactional
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class AddUsuarioController {

	@Autowired
	private EnderecoDao endDao;

	@Autowired
	private UsuarioDao UsuaDao;

	@RequestMapping(value = "/addUsuario", method = RequestMethod.POST)
	public ModelAndView adicionaUsuario(Usuario usuario, Endereco endereco, HttpServletRequest request){
		
		String senha = usuario.getSenha();
		
		usuario.setSenha(new BCryptPasswordEncoder().encode(usuario.getSenha()));
		usuario.setRoles("ROLE_USUARIO");
		
		usuario.setHashRecovere((new BCryptPasswordEncoder().encode(usuario.getNome()+ usuario.getEmail() + usuario.getPassword())));
		
		Usuario usuarioCadastrado = UsuaDao.addUsuario(usuario);
		endereco.setUsuario(usuarioCadastrado);
		endDao.addEndereco(endereco);
		
		try {
			request.login(usuarioCadastrado.getEmail(), senha);
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("redirect:/");

	}

}