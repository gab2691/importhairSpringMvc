package br.com.importHair.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.importHair.daos.ProdutoDao;
import br.com.importHair.models.Pedido;
import br.com.importHair.models.PedidoItem;
import br.com.importHair.models.Produtos;

@Controller
@Transactional
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class homeController {
	
	@Autowired
	private ProdutoDao dao;
	
	
	@Autowired
	private Pedido pedido;
	
	@RequestMapping("/")
	public ModelAndView home(){
		
		List<Produtos> listaProdutos = dao.listaProdutos();
		ModelAndView modelAndView = new ModelAndView("/importHair");
		modelAndView.addObject("produtos", listaProdutos);
		List<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("item", itens);
		
		return modelAndView;
	}
}
