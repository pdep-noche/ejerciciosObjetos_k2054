class EspacioUrbano {


var property valuacion
var property nombre
var property superficie
var property tieneVallado


const property trabajadosRealizados = []


method esGrande() {
	return superficie > 50 && self.cumpleCondicionesEsGrande()
}	

method esLimpiable() = false

method esEspacioVerde() = false

method cumpleCondicionesEsGrande()
	
}

class Plaza inherits EspacioUrbano {
	
	var  property cantCanchas
	var property espacioEsparcimiento
	
	override method cumpleCondicionesEsGrande() {
		return cantCanchas > 2
	}
	
	override method esEspacioVerde() = cantCanchas == 0
	
	override method esLimpiable() = true
 }

class Plazoleta inherits EspacioUrbano {
	var property espacioSinCesped
	var property procer
	
	override method cumpleCondicionesEsGrande() {
		return procer == "San Martin" && tieneVallado	
	}
}


class Anfiteatro inherits EspacioUrbano {
	var property capacidad
	var property tamanioEscenario
	
	override method cumpleCondicionesEsGrande() = capacidad > 500
	
	override method esLimpiable() = self.cumpleCondicionesEsGrande()
	
}

class Multiespacio inherits EspacioUrbano {
	
	const property espaciosUrbanos = []
	
	override method cumpleCondicionesEsGrande() {
		return espaciosUrbanos.all({unEspacio => unEspacio.cumpleCondicionesEsGrande()})
}

	override method esEspacioVerde() = espaciosUrbanos.size() > 3


}

class Trabajador  {
	var property profesion
	
	method trabajaEn(espacioUrbano) {
		
		profesion.trabajaEn(espacioUrbano, self)
	}
	
}

class Profesion {
	
	var property valorHora = 1000
	
	method trabajarEn(espacioUrbano, trabajador) {
		self.validarTrabajo(espacioUrbano)
		self.producirEfectoEn(espacioUrbano)
		self.registrarTrabajo(espacioUrbano, trabajador)
	}
	
	method registrarTrabajo(espacioUrbano, trabajador){
		
		espacioUrbano.registrar( new Trabajo(persona = trabajador, monto = self.montoTrabajo(espacioUrbano), duracion = self.duracion(espacioUrbano), fecha= new Date()))
	}
	
	method montoTrabajo(espacioUrbano) {
		return valorHora* self.duracion(espacioUrbano)
	}
	
	method validarTrabajo(espacioUrbano) {
		if (!self.puedeTrabajarEn(espacioUrbano)) {
			throw new DomainException(message = "No puede trabajar")
		}
	}
	
	method puedeTrabajarEn(espacioUrbano)
	
	method producirEfectoEn(espacioUrbano)
	
	method duracion(espacio)
}

object cerrajero inherits Profesion {
	
	override method puedeTrabajarEn(espacioUrbano) {
		return !espacioUrbano.tieneVallado()
	}
	
	override method duracion(espacio) {
		if(espacio.esGrande()){
			return 5
		}
		return 3
	}
	
	override method producirEfectoEn(espacioUrbano){
		espacioUrbano.tieneVallado(true)
	}
	
}

object jardinero inherits Profesion {
	override method puedeTrabajarEn(espacioUrbano) {
	return espacioUrbano.esEspacioVerde()
	}
	
	override method producirEfectoEn(espacioUrbano){
		espacioUrbano.incrementarValuacion(espacioUrbano.valuacion()* 0.1)
	}
	
	override method duracion(espacio) {
		return espacio.superficie()/10
	}
}


object encargado inherits Profesion {
	
	override method puedeTrabajarEn(espacioUrbano) {
		
		return espacioUrbano.esLimpiable()
		
	}
	
	override method producirEfectoEn(espacioUrbano) {
		espacioUrbano.incrementarValuacion(5000)
	}
	
	override method duracion( espacio)= 8
}

class Trabajo {
	
	var property persona
	var property fecha
	var property duracion
	var property monto
}




