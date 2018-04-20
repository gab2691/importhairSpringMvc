package br.com.importHair.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.importHair.daos.EnderecoDao;
import br.com.importHair.daos.PedidoDao;
import br.com.importHair.daos.PedidoItemDao;
import br.com.importHair.models.Endereco;
import br.com.importHair.models.Pedido;
import br.com.importHair.models.Usuario;

@Controller
@Transactional
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class TestedetalhesPedidos {
	
	@Autowired
	private PedidoDao Pdao;
	
	@Autowired
	private PedidoItemDao Pidao;
	
	@Autowired
	private EnderecoDao Edao;
	
	@RequestMapping(value = "/testeDetalhePedido", method = RequestMethod.GET)
	public ModelAndView teste(@AuthenticationPrincipal Usuario usuario){
		ModelAndView modelAndView = new ModelAndView("/inforPedido");
		List<Pedido> pedidos = Pdao.pedidoId(usuario.getId());
		modelAndView.addObject("pedidos", pedidos);
		List<PedidoItemDao> pedidoItemId = Pidao.pedidoItemId(1);
		modelAndView.addObject("item", pedidoItemId);
		
		Endereco enderecoPorId = Edao.enderecoPorId(usuario.getId());
		modelAndView.addObject("endereco", enderecoPorId);
		modelAndView.addObject("usuario", usuario);
		
		return modelAndView;
		
	}

}
