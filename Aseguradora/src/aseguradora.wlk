class Aseguradora {
	
	// Punto 1
	method montoAPagarPor(siniestro, vehiculo)  {
		self.validarParticipacion(vehiculo, siniestro)
		vehiculo.cuantoCubrePoliza(siniestro)
	}
	
	
	
	method validarParticipacion(vehiculo, siniestro) {
	if (!siniestro.esta(vehiculo)) {
		throw new NoParticipoVehiculo(message = " vehiculo no 
participo en el sinistro")
	}
	}
}

class NoParticipoVehiculo inherits DomainException {
		
	}
	

class Vehiculo  {
	var property poliza
	const property siniestros = []
	
	method cuantoCubrePoliza(siniestro) {
		return poliza.cuantoCubreEn(siniestro, self)
	}
	
	// Punto 2 
	method montoDaniosNoCubiertos() {
		return siniestros.sum({unSini => 
			poliza.montoNoCubierto(unSini, self)
		})
	}
	
}

class Poliza  {
	
	var property aseguradora
	
	method cuantoCubreEn(siniestro, vehiculo) {
		return self.daniosQueCubre(siniestro, vehiculo).sum({danio => danio.monto()})
	}
	method daniosQueCubre(sinistro, vehiculo)
	
	method montoNoCubierto(sinistro, vehiculo)
}

class ContraTodoRiesgo inherits Poliza {
	override method daniosQueCubre(siniestro ,vehiculo) {
		return siniestro.danios()
	}
	
	override method montoNoCubierto(_, vehiculo) = 0
	
}

class ContraTercero inherits Poliza {
	override method daniosQueCubre(siniestro, vehiculo) {
		return siniestro.danios().filter({unDanio => unDanio.involucrado() != vehiculo})
	}
	
	override method montoNoCubierto(siniestro, vehiculo) {
		return siniestro.daniosPara(vehiculo)
		
		
	}
	
}


class Siniestro {
	
	const property danios = []
	
	method esta(unInvolucrado) {
		
		return danios.any({unDanio => unDanio.involucrado() == unInvolucrado})
	}
	
	method daniosPara(vehiculo) {
		return self.buscarDanioDeVehiculo(vehiculo).monto()
	}
	
	method buscarDanioDeVehiculo(vehiculo) {
		return danios.find({unDanio => unDanio.involucrado() == vehiculo})
	}
}


class Danio {
	
	var property valor
	var property involucrado
}