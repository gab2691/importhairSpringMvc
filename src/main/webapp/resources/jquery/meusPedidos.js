$(".btn-details-pedido").on("mouseenter", addBtnEmailColor).on("mouseleave",removeBtnEmailColor);


var showPedidoDetails = function() {
	var $this = $(this);
	var id = $this.parent().find(".pedidoId").text();
	
	if($this.parent().parent().parent().find(".datails-products").find(".descriptProduct").text().length > 0){
		$this.parent().parent().parent().find(".datails-products").fadeToggle("slow");
		
	}

	if ($this.parent().parent().parent().find(".datails-products").find(".descriptProduct").text().length == 0) {
		$.ajax({
			type : "GET",
			url : "/importHair/pedidoDetalhes",
			data : {
				"id" : id,
			},
			
			success : function(resultado) {
				$this.parent().parent().parent().find(".datails-products").html(resultado);
				$this.parent().parent().parent().find(".datails-products").fadeToggle("slow");
				$this.parent().parent().parent().find(".datails-products").css("display", "flex");
				console.log(id);
			}

		})
	}
}

$(".btn-details-pedido").on("click", showPedidoDetails)