class Cuenta {
	
	var property saldo
	
	method transferir(monto, otraCuenta){
		self.debitar(monto)
		otraCuenta.depositar(monto)
	}
	
	method debitar(monto){
		self.validarSaldo(monto)
		saldo -= monto
	}
	
	method validarSaldo(monto){
		if (monto > saldo) { 
			throw new DomainException(message = "Saldo insuficiente")
		}
	}
	
	method depositar(monto) {
		saldo += monto
	}
	
	
}
