package br.com.importHair.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.importHair.daos.UsuarioDao;
import br.com.importHair.models.Usuario;

@Controller
@Transactional
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
@RequestMapping("/contaUsuario")
public class ContaUsuarioController {
	
	@Autowired
	private UsuarioDao dao;
	
	@RequestMapping("/atualizaSenha")
	public ModelAndView atualizaSenha(Integer id, String confirmaSenha){
		Usuario usuario = dao.BuscaUsuarioId(id);
		System.out.println(id);
		usuario.setHashRecovere((new BCryptPasswordEncoder().encode(usuario.getNome()+ usuario.getEmail() + usuario.getPassword())));
		dao.atualizaSenha(id, new BCryptPasswordEncoder().encode(confirmaSenha));
		return new ModelAndView("redirect:/");
		
	}

}
