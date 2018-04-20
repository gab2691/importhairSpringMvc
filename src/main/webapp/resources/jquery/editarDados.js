$(".btn-atualizaDados").on("mouseenter", addBtnEmailColor).on("mouseleave",removeBtnEmailColor);


/*var atualizaDados = function() {
	if($("#UsuarioSenhaNova").val().length == 0 ){
		return false;
	}
}

$(".btn-atualizaDados").on("click", atualizaDados)*/

var showFormSenha = function() {
	$(".box-direito-minhaConta").addClass("showForm");
	$(".container-alteraSenha").show();
	$(".container-alteraSenha").css("display", "flex");
}

$(".text-title-senha").on("click", showFormSenha)


$(".dadosUsuario").on("click", function() {
	var name = $("#UsuarioNameAtualiza").val();
	var email = $("#UsuarioEmailAtualiza").val();
	var emailAlternativo = $("#UsuarioEmailAltAtualiza").val();
	var telefone = $("#UsuarioTelAtualiza").val();
	
	$('.atualiza-dadosPessoais').LoadingOverlay("show", "slow")
	
	
	
	if($("#UsuarioNameAtualiza").val().length == 0 || $("#UsuarioEmailAtualiza").val().length == 0 
			|| $("#UsuarioEmailAltAtualiza").val().length == 0 || $("#UsuarioTelAtualiza").val().length == 0){
		
		$(".atualiza-dadosPessoais").LoadingOverlay("hide");
		
		console.log("vazio")
		
		setTimeout(function() {
			$(".message-alteracao-erro").removeClass("show-login");
			$(".message-alteracao-sucesso").removeClass("show-login");
			$(".message-alteracao-erro").addClass("show-login");
		},1000);
		
		
		return false;
	}
	
	$.ajax ({
		type: "GET",
		url: "/importHair/atualizaUser",
		data :{
			"nome" : name,
			"email" : email,
			"emailAlternativo" : emailAlternativo,
			"telefone" : telefone,
		},
		
		success : function(resultado) {
			$(".message-alteracao-erro").removeClass("show-login");
			
			setTimeout(function() {
				$('.atualiza-dadosPessoais').LoadingOverlay("hide");
			},1000);
			
			setTimeout(function() {
				$(".message-alteracao-sucesso").removeClass("show-login");
				$(".message-alteracao-sucesso").addClass("show-login");
			},1500);
		}
	})
	
})

var addBorder = function() {
	$(this).find(".nome-opcao").addClass("text-hover");
}

var removeBorder = function() {
	$(this).find(".nome-opcao").removeClass("text-hover").css({"transition" : ".25s"});
}

$(".opcoes-conta").on("mouseenter",addBorder).on("mouseout",removeBorder);


$("#UsuarioConfirmaSenha").on("input",function() {
	var novaSenha = $("#UsuarioSenhaNova").val();
	var confimaSenha = $("#UsuarioConfirmaSenha").val();
	var comparavel = novaSenha.substr(0,confimaSenha.length);
	
	if(confimaSenha == comparavel){
		$("#UsuarioConfirmaSenha").addClass("writhe-password");
		$("#UsuarioConfirmaSenha").removeClass("wrong-password");
		$(".btn-atualizaDados").prop('disabled', false);
	}
	else{
		$("#UsuarioConfirmaSenha").addClass("wrong-password");
		$("#UsuarioConfirmaSenha").removeClass("writhe-password");
		$(".btn-atualizaDados").prop('disabled', true);
	}
})