package br.com.importHair.conf;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import br.com.importHair.models.Pedido;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		Pedido pedido = (Pedido)request.getSession().getAttribute("pedido");
		
		if("true".equals(request.getHeader("login-ajax")) && pedido.getItens().size() >= 1){
			response.getWriter().print("confirmacao");
		}
		
		if ("true".equals(request.getHeader("login-ajax")) && pedido.getItens().size() == 0) {
			response.getWriter().print("conta");
		}
		
	}
	

}
