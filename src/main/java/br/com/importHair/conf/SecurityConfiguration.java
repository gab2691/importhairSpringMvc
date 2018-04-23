package br.com.importHair.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import br.com.importHair.daos.UsuarioDao;

@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private UsuarioDao dao;
	
	@Autowired
	CustomAuthenticationFailureHandler customAuthenticationFailureHandler;
	
	@Autowired
	CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.requiresChannel().antMatchers(/*"/login,/addUsuario,/buscaEndereco,/carrinho/add"
				+ "/atualizaTotal,/atualizaSubTotal,/totalGeral,/calculaFrete,/atualizaQtn"*/).requiresSecure();
	    /*.antMatchers("/").permitAll()
	    .antMatchers("/addUsuario").permitAll()
	    .antMatchers("/buscaEndereco").permitAll()
	    .antMatchers("/carrinho/add").permitAll()
	    .antMatchers("/login").permitAll()
	    .antMatchers("/atualizaTotal").permitAll()
	    .antMatchers("/atualizaSubTotal").permitAll()
	    .antMatchers("/totalGeral").permitAll()
	    .antMatchers("/calculaFrete").permitAll()
	    .antMatchers("/atualizaQtn").permitAll()
	    .antMatchers("/removeItem").permitAll()
	    .antMatchers("/cartPage").permitAll()
	    .antMatchers("/verificaEmail").permitAll()
	    .antMatchers("/carrinho/detalhe").permitAll()
	    .antMatchers("/recuperaSenha").permitAll()
	    .antMatchers("/geraToken").permitAll()
	    .antMatchers("/product/**").permitAll()
	    .antMatchers("/recuperaSenha/token/**").permitAll()
	    .antMatchers("/contaUsuario/atualizaSenha").permitAll()
	    .antMatchers("/novaSenha").permitAll()
	    .antMatchers("/loginCustom").permitAll()
	    .antMatchers("/checkOut").permitAll()
	    .antMatchers("/logout").permitAll()
	    .anyRequest().authenticated().
	    and().formLogin().successHandler(customAuthenticationSuccessHandler)
	    .failureHandler(customAuthenticationFailureHandler);
	*/
	    
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(dao).passwordEncoder(new BCryptPasswordEncoder());
		
	}

	@Bean
	public AuthenticationManager customAuthenticationManager() throws Exception {
		  return super.authenticationManagerBean();
	}
}
