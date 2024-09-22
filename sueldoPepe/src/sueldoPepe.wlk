object pepe {
	
	var cantFaltas
	var categoria
	var bonoPresentismo
	var bonoResultado
	
	method sueldo() {
		return categoria.neto() + bonoPresentismo.monto(cantFaltas) + bonoResultado.monto(categoria.neto())
	}
	
	
	method categoria( unaCategoria) {
	categoria = unaCategoria
	
	
	}
	
	method cantFaltas(cant){
		cantFaltas = cant
	}
	
	method bonoPresentismo(bono) {
		bonoPresentismo = bono
	}
	
	method bonoResultado(bono) {
		bonoResultado = bono
	}
	
}


object gerente {
	var neto = 10000
	
	method neto() {
		return neto
	}
}


object cadete {
	var neto = 15000
	
	method neto(){
		return neto
	}

}


object bonoDependeDeFaltas {
	
	method monto(cantFaltas) {
		
		if (cantFaltas == 0) {
			return 1000
		}
		
		if (cantFaltas == 1){
			return 500
		}
		
		return 0		
	}
	
	
}

object bonoNulo {
	
	
	method monto(_) {
		return 0
	}
}

object bonoFijo {
	
	method monto(_) {
		return 800
	} 
	
}

object bonoPorcentaje {
	
	method monto(neto) {
		return neto * 0.1
	}
}


