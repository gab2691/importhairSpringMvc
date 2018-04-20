package br.com.importHair.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.importHair.daos.EnderecoDao;
import br.com.importHair.daos.PedidoDao;
import br.com.importHair.daos.PedidoItemDao;
import br.com.importHair.models.Endereco;
import br.com.importHair.models.Pedido;
import br.com.importHair.models.SenhaAtuliza;
import br.com.importHair.models.Usuario;

@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class ContaController {
	
	@Autowired
	private EnderecoDao Edao;
	
	@Autowired
	private PedidoDao Pdao;
	
	@Autowired
	private PedidoItemDao PIdao;
	
	@RequestMapping(value = "/minhaConta", method = RequestMethod.GET)
	public ModelAndView minhaConta(@AuthenticationPrincipal Usuario usuario){
		ModelAndView modelAndView = new ModelAndView("/minhaConta");
		modelAndView.addObject("usuario", usuario);
		return modelAndView;
	}
	
	@RequestMapping(value = "/editarDados", method = RequestMethod.GET)
	public ModelAndView editarDados(@AuthenticationPrincipal Usuario usuario){
		ModelAndView modelAndView = new ModelAndView("/editarDados");
		modelAndView.addObject("usuario", usuario);
		return modelAndView;
	}
	
	@RequestMapping(value = "/editarEndereco", method = RequestMethod.GET)
	public ModelAndView editarEndereco(@AuthenticationPrincipal Usuario usuario){
		Endereco enderecoPorId = Edao.enderecoPorId(usuario.getId());
		ModelAndView modelAndView = new ModelAndView("/editarEndereco");
		
		modelAndView.addObject("endereco", enderecoPorId);
		modelAndView.addObject("usuario", usuario);
		
		return modelAndView;
				
	}
	
	@RequestMapping(value = "/atualizaSenha", method = RequestMethod.POST)
	public ModelAndView atualizaSenha(@AuthenticationPrincipal Usuario usuario, SenhaAtuliza senhaAtualiza){
		usuario.setSenha(new BCryptPasswordEncoder().encode(senhaAtualiza.getConrfirmaSenha()));
		
		return new ModelAndView("redirect:/minhaConta");
		
	}
	
	@RequestMapping(value = "/meusPedidos", method = RequestMethod.GET)
	public ModelAndView meusPedidos(@AuthenticationPrincipal Usuario usuario){
		ModelAndView modelAndView = new ModelAndView("/meusPedidos");
		modelAndView.addObject("usuario", usuario);
		
		List<Pedido> pedidos = Pdao.pedidoId(usuario.getId());
		modelAndView.addObject("pedidos", pedidos);
		
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:/";
	}
}
