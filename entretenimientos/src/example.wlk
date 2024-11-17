
object productora { 
	
	var property impuesto;
	const property asistentes = []
	const property bandas = []
	
	method gananciaTotal() {
		return self.recaudacion() - self.totalPresupuesto()
	}
	
	method recaudacion() {
		return asistentes.sum({unAsistente => unAsistente.precioTotalSinDescuento()})
	}
	
	method totalPresupuesto() {
		return bandas.sum({unaBanda => unaBanda.presupuesto()})
	}
}

class Entrada {
	
	
	var property banda
	var property fecha
	var property precioBase = 1000
	var property estaDisponible
	var property precioTotal
	method precioAlPublico() = precioBase + productora.impuesto()
	method nombreBanda() = banda.nombre()
	
	
}

class Asistente {
	
	var property tipoBono
	var property saldo
	const property historialEntradas  = []
	
	
	method totalGastadoEnEntradas() {
		return historialEntradas.sum({unaEntrada => unaEntrada.precioTotal()})
	}
	
	method precioTotalSinDescuento() {
		return historialEntradas.sum({unaEntrada => unaEntrada.precioAlPublico()})
	}
	
	method nombreBandas() {
		return self.nombres().asSet()
	}
	
	method nombres() {
		return historialEntradas.map({unaEntrada => unaEntrada.nombreBanda()})
	}
	
	method comprarEntrada(unaEntrada) {
		
		self.validarCompra(unaEntrada)
		self.comprar(unaEntrada)
	} 
	
	method comprar(entrada) {
		entrada.precioTotal(tipoBono.precioConDescuento(entrada.precioAlPublico()))
		saldo -= entrada.precioTotal()
		historialEntradas.add(entrada)
	}
	
	method validarCompra(entrada) {
		
		if (saldo < 0 || !entrada.estaDisponible()) {
			throw new DomainException(message = "no puede comprar entrada")
		}
	}
}

class VIP  {
	var property porcentajeDescuento
	method precioConDescuento(monto) = monto * self.porcentajeDescuento() /100 
	
	
}


object fan {
	
	method porcentajeDescuento() = 0
	method precioConDescuento(monto) = monto
	
	
}

class Banda {
	
	var property nombre
	var property canon
	
	method presupuesto()  {
		return self.canon() + self.gastoExtra()
	}
	
	method gastoExtra()
	
	method popularidad()
}

class Rock inherits Banda {
	var property solosDeGuitarra
	
	var property gastoExtra = 10000
	
	override method popularidad() {
			return 100 * solosDeGuitarra
	}
}

class Trap inherits Banda {
	
	var property hielo
	
	override method gastoExtra() = 0
	override method popularidad() {
		return hielo.popularidad()

	}
	
	override method canon() {
		return self.popularidad() * super()
	}
	
}
object tieneHielo {
	var property popularidad = 1000
}

object sinHielo {
	var property popularidad = 0

	
}

class Indie inherits Banda {
	var property cantInstrumentos
	
	override method popularidad() = nombre.size() * 3.14
	
	override method gastoExtra() = 500 * cantInstrumentos
}
