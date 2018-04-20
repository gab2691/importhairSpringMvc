package br.com.importHair.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.importHair.daos.ProdutoDao;
import br.com.importHair.models.Pedido;
import br.com.importHair.models.PedidoItem;
import br.com.importHair.models.Produtos;

@Controller
@Transactional
@RequestMapping("/carrinho")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoController {
	
	
	@Autowired
	private ProdutoDao dao;
	
	@Autowired
	private Pedido pedido;
	
	@RequestMapping("/add")
	public ModelAndView add(Integer produtoId, Integer quantidade){
		PedidoItem pedidoItem = criaItem(produtoId, quantidade);
		pedido.add(pedidoItem);
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho/detalhe");
		return modelAndView;
	}
	
	private PedidoItem criaItem(Integer produtoId, Integer quantidade){
		Produtos produto = dao.produto(produtoId);
		PedidoItem pedidoItem = new PedidoItem(produto);
		pedidoItem.setQuantidade(quantidade);
		return pedidoItem;
	}
	
	@RequestMapping(value="/detalhe", method = RequestMethod.GET)
	public ModelAndView detalhe(){
		ModelAndView modelAndView = new ModelAndView("/detalhe");
		List<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("item", itens);
		return modelAndView;
		
	}
}
