package br.com.importHair.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.importHair.daos.UsuarioDao;
import br.com.importHair.models.Usuario;

@Controller
@Transactional
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class RecuperaSenhaController {
	
	@Autowired
	private UsuarioDao dao;

	@RequestMapping(value="/recuperaSenha/{token}", method=RequestMethod.GET)
	public ModelAndView recuperaSenhaToken(@RequestParam("token") String token){
		Usuario usuario = dao.FindUsuarioHash(token);
		ModelAndView modelAndView = new ModelAndView("/novaSenha");
		modelAndView.addObject("usuario", usuario);
		return modelAndView;
	}
	
}
