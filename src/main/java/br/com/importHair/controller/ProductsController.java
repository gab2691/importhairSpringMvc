package br.com.importHair.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.importHair.daos.ProdutoDao;
import br.com.importHair.models.Produtos;

@Controller
public class ProductsController {

	@Autowired
	private ProdutoDao pDao;
	
	@Autowired
	private ProdutoDao dao;
	
	@RequestMapping("/product")
	public ModelAndView produtos(Integer id){
		System.out.println(id);
		Produtos produto = pDao.produto(id);
		ModelAndView modelAndView = new ModelAndView("/produto");
		modelAndView.addObject("produto", produto);
		
		List<Produtos> listaProdutos = dao.listaProdutos();
		modelAndView.addObject("produtos", listaProdutos);
		return modelAndView;
		
	}
}
