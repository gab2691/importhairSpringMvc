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
import br.com.importHair.daos.UsuarioDao;
import br.com.importHair.models.Endereco;
import br.com.importHair.models.Pedido;
import br.com.importHair.models.PedidoItem;
import br.com.importHair.models.Usuario;

@Controller
@Transactional
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class ConfirmacaoController {

	@Autowired
	private EnderecoDao eDao;

	@Autowired
	private Pedido pedido;

	@Autowired
	private UsuarioDao Udao;

	@RequestMapping(value = "/confirmacao", method = RequestMethod.GET)
	public ModelAndView confirmacao(@AuthenticationPrincipal Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView("/confirmacao");
		Endereco endereco = eDao.enderecoPorId(usuario.getId());

		List<PedidoItem> itens = pedido.getItens();

		modelAndView.addObject("item", itens);
		modelAndView.addObject("endereco", endereco);
		modelAndView.addObject("usuario", usuario);
		return modelAndView;
	}

	@RequestMapping(value = "/atualizaUsuario", method = RequestMethod.POST)
	public ModelAndView atualizaUser(@AuthenticationPrincipal Usuario usuario, Usuario usuarioAtualiza) {
		Usuario atualizaUsuario = Udao.atualizaUsuario(usuario.getId(), usuarioAtualiza);
		Endereco endereco = eDao.enderecoPorId(atualizaUsuario.getId());
		ModelAndView modelAndView = new ModelAndView("/confirmacao");
		List<PedidoItem> itens = pedido.getItens();

		modelAndView.addObject("item", itens);
		modelAndView.addObject("usuario", atualizaUsuario);
		modelAndView.addObject("endereco", endereco);
		return modelAndView;

	}

	@RequestMapping(value = "/atualizaEndereco", method = RequestMethod.POST)
	public ModelAndView atualizaEnd(@AuthenticationPrincipal Usuario usuario, Endereco endereco) {
		Endereco atualizaEnd = eDao.atualizaEnd(usuario.getId(), endereco);
		ModelAndView modelAndView = new ModelAndView("/confirmacao");
		List<PedidoItem> itens = pedido.getItens();

		modelAndView.addObject("item", itens);
		modelAndView.addObject("usuario", usuario);
		modelAndView.addObject("endereco", atualizaEnd);
		return modelAndView;

	}

}
