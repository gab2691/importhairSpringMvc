package br.com.importHair.models;

import java.math.BigDecimal;
import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.tempuri.CResultado;
import org.tempuri.CalcPrecoPrazoWSLocator;
import org.tempuri.CalcPrecoPrazoWSSoap;


@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION)
public class Frete {

	
	@Autowired(required = true)
	private Pedido pedido;
	
	
	public CResultado sedex(String cep) throws ServiceException, RemoteException{
		CalcPrecoPrazoWSSoap soap =  new CalcPrecoPrazoWSLocator().getCalcPrecoPrazoWSSoap();
		
		BigDecimal peso = pedido.getPeso();
		
		String pesoString = peso.toString();
		CResultado calcPrecoPrazo = soap.calcPrecoPrazo("", "", "40010", "03051-000", cep, pesoString, 1, new BigDecimal(18), new BigDecimal(9), new BigDecimal(13.5), new BigDecimal(0), "n", new BigDecimal(0), "n");
		return calcPrecoPrazo;
	}
}
