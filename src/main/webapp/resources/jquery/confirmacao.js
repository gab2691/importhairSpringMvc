var editUser = function() {
	$(".box-background").css("display", "flex");
	$(".box-atualiza-user").addClass("show-login");
	
}

$(".edit-user").on("click", editUser)


var editEnd =  function() {
	$(".box-background").css("display", "flex");
	$(".box-atualiza-endereco").addClass("show-login");
}


$(".link-end").on("click", editEnd)


var cepAjaxAtualiza = function() {
	var cep = $(this).val();

	if ($(this).on("focusout").val().length <= 9
			&& $("#UsuarioBairro").val().length > 1) {
		return false;
	}

	$('.box-atualiza-endereco').LoadingOverlay("show", "slow")
	$.ajax({
		type : "GET",
		url : "/buscaEndereco",
		contentType : "application/json; charset=utf-8",
		data : {
			"cep" : cep,
		},

		success : function(resultado) {
			setTimeout(function() {
				$("#UsuarioAtualizaEstado").val(resultado.uf);
				$("#UsuarioAtualizaCid").val(resultado.cidade);
				$("#UsuarioAtualizaBairro").val(resultado.bairro);
				$("#UsuarioAtualizaLogra").val(resultado.rua)
			}, 800);
			
			setTimeout(function() {
				$(".box-atualiza-endereco").LoadingOverlay("hide");
			}, 1500);
		},
		
	})
	

}

$("#UsuarioAtualizaCep").on("focusout", cepAjaxAtualiza)


$(".btn-page-confirm").on("click",function(){
	$.ajax({
		type: "GET",
		url: "/pagSeguro",
		data: "",
		
		success: function(resultado) {
			
			PagSeguroLightbox({
				code : resultado,
			    }, {
			    success : function(transactionCode) {
			        alert("success - " + transactionCode);
			    },
			    abort : function() {
			    }
			});
		}
	})
})

