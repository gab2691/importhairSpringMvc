var atualizaEndereco = function() {
	var cep  = $("#UsuarioAtualizaCep").val();
	var uf = $("#EnderecoAtualizaUf").val();
	var cidade = $("#EnderecoAtualizaCidade").val();
	var logradouro = $("#EnderecoAtualizaLogradouro").val();
	var numero = $("#EnderecoAtualizaNumero").val();
	var complemento = $("#EnderecoAtualizaComplemento").val();
	var bairro = $("#EnderecoAtualizaBairro").val();
	
	
	if($("#UsuarioAtualizaCep").val().length == 0 || $("#EnderecoAtualizaUf").val().length == 0 || 
			$("#EnderecoAtualizaCidade").val().length == 0 || $("#EnderecoAtualizaBairro").val().length == 0 || 
			$("#EnderecoAtualizaLogradouro").val().length == 0){
		
		
		$(".atualiza-dadosPessoais").LoadingOverlay("hide");
		
		
		setTimeout(function() {
			$(".message-alteracao-erro").removeClass("show-login");
			$(".message-alteracao-sucesso").removeClass("show-login");
			$(".message-alteracao-erro").addClass("show-login");
		},1000);
		
		
		return false;
	}
	
	
	$('.box-direito-minhaConta').LoadingOverlay("show", "slow");
	
	$.ajax({
		
		type: "POST",
		url: "/atualizaEndereco",
		data: {
			"cidade" : cidade,
			"uf" : uf,
			"logradouro" : logradouro,
			"numero" : numero,
			"cep" : cep,
			"bairro" : bairro,
			"complemento" : complemento,
		},
		
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
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
			
			$('.box-direito-minhaConta').LoadingOverlay("hide");
			
		}
	})
}

$(".EnderecoAtualiza").on("click", atualizaEndereco)

var buscaEndereco = function() {
	
	var cep = $("#UsuarioAtualizaCep").val();
	
	if (cep.length == 0) {
		console.log("valor nullo")
		return false;
	}
	
	$('.box-editarEndereco').LoadingOverlay("show", "slow");
	
	$.ajax({
		type : "GET",
		url : "/buscaEndereco",
		contentType : "application/json; charset=utf-8",
		data : {
			"cep" : cep,
		},
		success : function(resultado) {
			setTimeout(function() {
				$("#EnderecoAtualizaUf").val(resultado.uf);
				$("#EnderecoAtualizaCidade").val(resultado.cidade);
				$("#EnderecoAtualizaBairro").val(resultado.bairro);
				$("#EnderecoAtualizaLogradouro").val(resultado.rua)
			}, 800);

			setTimeout(function() {
				$(".box-editarEndereco").LoadingOverlay("hide");
			}, 1500);
		},

	});
	if (cep.length == 0) {
		console.log("valor nullo")
		return false;
	}
}
$("#UsuarioAtualizaCep").on("focusout", buscaEndereco)
