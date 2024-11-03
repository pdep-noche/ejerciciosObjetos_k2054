class Cliente {
	
	var property tipo
	
	var property salario
	
	
	method totalAPagar(montoCuenta) {
		return montoCuenta + tipo.propinaPara(montoCuenta, self)
	}
	
	
}

object asalariado {
	method propinaPara(_, cliente) {
		return cliente.salario() * 0.01;
	}
}


object comun {
	method propinaPara(monto, _) {
		return monto * 0.1
	}
}


class Comedido {
	var property montoMax
	
	method propinaPara(monto, _)
	{
		return montoMax.min(monto * 0.2)
	}
}

object amarrete {
	
	method propinaPara(monto,_) = 0
	
}



