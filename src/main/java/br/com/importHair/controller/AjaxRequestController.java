package br.com.importHair.controller;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.xml.rpc.ServiceException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.tempuri.CResultado;
import org.tempuri.CServico;

import br.com.correios.bsb.sigep.master.bean.cliente.AtendeClienteProxy;
import br.com.correios.bsb.sigep.master.bean.cliente.EnderecoERP;
import br.com.correios.bsb.sigep.master.bean.cliente.SQLException;
import br.com.correios.bsb.sigep.master.bean.cliente.SigepClienteException;
import br.com.importHair.daos.EnderecoDao;
import br.com.importHair.daos.PedidoDao;
import br.com.importHair.daos.PedidoItemDao;
import br.com.importHair.daos.ProdutoDao;
import br.com.importHair.daos.UsuarioDao;
import br.com.importHair.models.Endereco;
import br.com.importHair.models.Frete;
import br.com.importHair.models.Pedido;
import br.com.importHair.models.PedidoItem;
import br.com.importHair.models.Produtos;
import br.com.importHair.models.Usuario;
import br.com.uol.pagseguro.domain.AccountCredentials;
import br.com.uol.pagseguro.domain.Item;
import br.com.uol.pagseguro.domain.checkout.Checkout;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.enums.ShippingType;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;



@Controller
@Transactional
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class AjaxRequestController {

	@Autowired
	private Pedido pedido;

	@Autowired
	private ProdutoDao dao;

	@Autowired
	private Frete frete;

	@Autowired
	private UsuarioDao Udao;
	
	@Autowired
	private EnderecoDao Edao;
	
	@Autowired
	private PedidoItemDao PIdao;
	
	@Autowired
	private PedidoDao Pdao;

	@ResponseBody
	@RequestMapping(value = "/atualizaTotal", method = RequestMethod.GET)
	public Map<String, BigDecimal> atualizaTotal(Integer id, Integer quantidade) {
		HashMap<String, BigDecimal> map = new HashMap<String, BigDecimal>();

		Produtos produto = dao.produto(id);
		PedidoItem pedidoItem = new PedidoItem(produto);
		pedidoItem.setQuantidade(quantidade);

		PedidoItem atualizaItem = pedido.atualizaItem(pedidoItem);
		BigDecimal valorTotalItem = pedido.getValorTotalItem(atualizaItem);

		BigDecimal subTotal = pedido.getSubTotal();

		BigDecimal totalgeral = pedido.getTotalgeral();

		BigDecimal qtn = new BigDecimal(pedido.getQuantidade());

		map.put("valorTotalItem", valorTotalItem);
		map.put("subTotal", subTotal);
		map.put("totalgeral", totalgeral);
		map.put("qtn", qtn);
		return map;

	}

	@ResponseBody
	@RequestMapping(value = "/calculaFrete", method = RequestMethod.GET)
	public Map<String, String> calculaFrete(String cep) throws RemoteException, ServiceException {
		HashMap<String, String> map = new HashMap<>();

		CResultado sedex = frete.sedex(cep);
		CServico[] servicos = sedex.getServicos();
		for (CServico cServico : servicos) {
			String prazoEntrega = cServico.getPrazoEntrega();
			String valor = cServico.getValor();
			cep = "Sedex (Entrega " + prazoEntrega + " dia útil)" + "  R$ " + valor;
			valor = valor.replaceAll(",", ".");
			map.put("cep", cep);
			BigDecimal frete = new BigDecimal(valor);

			pedido.setFrete(frete);
		}

		BigDecimal freteBig = pedido.getFrete();
		String freteString = freteBig.toPlainString();
		map.put("freteString", freteString);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/removeItem", method = RequestMethod.GET)
	public void removeItem(Integer id) {
		Produtos produto = dao.produto(id);
		PedidoItem pedidoItem = new PedidoItem(produto);
		pedido.removeItem(pedidoItem);
	}

	@ResponseBody
	@RequestMapping(value = "/cartPage", method = RequestMethod.GET)
	public ModelAndView cartPage() throws SQLException, SigepClienteException, RemoteException {
		ModelAndView modelAndView = new ModelAndView("/pageCart");
		List<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("item", itens);
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/totalGeral", method = RequestMethod.GET)
	public BigDecimal totalGeral() {
		BigDecimal totalGeral = pedido.getTotalgeral();
		return totalGeral;
	}

	@ResponseBody
	@RequestMapping(value = "/checkOut", method = RequestMethod.GET)
	public String checkOut(@AuthenticationPrincipal Usuario usuario, String url) {
		if (usuario == null) {
			return "logar";
		}

		return "checkout";

	}

	@ResponseBody
	@RequestMapping(value = "/buscaEndereco", method = RequestMethod.GET)
	public Map<String, String> buscaEndereco(String cep) throws SQLException, SigepClienteException, RemoteException {
		HashMap<String, String> map = new HashMap<String, String>();
		EnderecoERP consultaCEP = new AtendeClienteProxy().consultaCEP(cep);
		map.put("cidade", consultaCEP.getCidade());
		map.put("uf", consultaCEP.getUf());
		map.put("bairro", consultaCEP.getBairro());
		map.put("rua", consultaCEP.getEnd());
		
		
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/verificaEmail", method = RequestMethod.GET)
	public String verificaEmail(String email) {
		String usuario = Udao.verificaUsuario(email);
		return usuario;
	}

	@ResponseBody
	@RequestMapping(value = "/geraToken", method = RequestMethod.GET)
	public String recuperaSenha(String email) {
		
		String verificaUsuario = Udao.verificaUsuario(email);
		if(verificaUsuario.equals("true")){
			Usuario usuario = Udao.BuscaUsuario(email);
			return "http://localhost:8080/importHair/recuperaSenha/token/?token=" + usuario.getHashRecovere();
		}
		return verificaUsuario;
	}
	
	@ResponseBody
	@RequestMapping(value = "/atualizaUser", method = RequestMethod.GET)
	public String alteraUser(@AuthenticationPrincipal Usuario usuario, Usuario usuarioAtualiza){
		Udao.atualizaUsuario(usuario.getId(), usuarioAtualiza);
		
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value = "/pedidoDetalhes", method = RequestMethod.GET)
	public ModelAndView pedidoDetalhes (@AuthenticationPrincipal Usuario usuario,Integer id){
		ModelAndView modelAndView = new ModelAndView("/inforPedido");
		
		List<Pedido> pedidos = Pdao.pedidoId(usuario.getId());
		modelAndView.addObject("pedidos", pedidos);
		
		List<PedidoItemDao> pedidoItemId = PIdao.pedidoItemId(id);
		modelAndView.addObject("item", pedidoItemId);
		
		Endereco enderecoPorId = Edao.enderecoPorId(usuario.getId());
		modelAndView.addObject("endereco", enderecoPorId);
		
		modelAndView.addObject("usuario", usuario);
		
		Pedido pedido = Pdao.unicoPedidoId(id);
		modelAndView.addObject("pedido", pedido);
		
		
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/pagSeguro", method = RequestMethod.GET)
	public String pagamento(@AuthenticationPrincipal Usuario usuario) throws PagSeguroServiceException {
		AccountCredentials credentials;

		credentials = new AccountCredentials("rprridrosc@gmail.com", "E9A97618DB25484F8A0EC36F805C3984");

		Checkout checkout = new Checkout();
		List<Item> items = new LinkedList<>();
		

		
		this.pedido.setUsuario(usuario);
		
		Collection<PedidoItem> itens = this.pedido.getItens();
				
		this.pedido.setPagamento("PAG-SEGURO");
		Date data = new Date(System.currentTimeMillis());
		this.pedido.setData_pedido(data);
		this.pedido.setStatus("GERADO");
		this.pedido.setTotal(pedido.getTotalgeral());
		this.pedido.setSubTotal(pedido.getSubTotal());
		this.pedido.setId(null);
		
		Pdao.addPedido(this.pedido);
		
		
		for (PedidoItem pedidoItem : itens) {
			
			Item item = new Item();

			Integer id = pedidoItem.getProduto().getId();
			String stringId = Integer.toString(id);
			item.setId(stringId);

			item.setDescription(pedidoItem.getProduto().getDescricao());
			item.setQuantity(pedidoItem.getQuantidade());
			
			
			BigDecimal peso = pedidoItem.getProduto().getPeso();
			long longValue = peso.setScale(0,BigDecimal.ROUND_UP).longValue();
			
			item.setWeight(longValue);
			
			item.setAmount(pedidoItem.getProduto().getPreco());
			
			items.add(item);
			
			pedidoItem.setPedido(this.pedido);
			pedidoItem.setId(null);
			PIdao.addPI(pedidoItem);
		}

		checkout.setItems(items);

		Endereco enderecoPorId = Edao.enderecoPorId(usuario.getId());

		checkout.setShipping(ShippingType.SEDEX, "BRASIL", "SP", enderecoPorId.getCidade(), null,
				enderecoPorId.getCep(), enderecoPorId.getLogradouro(), enderecoPorId.getNumero(),
				enderecoPorId.getComplemento(), pedido.getFrete());

		checkout.setShippingCost(pedido.getFrete());

		checkout.setReference("RPR01");
		checkout.setCurrency(Currency.BRL);
		checkout.setSender(usuario.getNome(), usuario.getEmail(), null);

		try {

			Boolean onlyCheckoutCode = false;

			String register = checkout.register(credentials, onlyCheckoutCode);
			
			String[] split = register.split("=");
			return split[1];

		} catch (PagSeguroServiceException e) {
			System.err.println(e.getMessage());
		}
		return null;

	}
}
