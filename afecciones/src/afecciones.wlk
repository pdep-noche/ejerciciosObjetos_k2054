object sara {
	
	var peso = 55
	var vitalidad = 90
	var temperatura = 37
	
	
	method incrementarTemperatura(cantidad){
		temperatura += cantidad
	}
	
	method esAfectadaPor(afeccion){
		afeccion.afectarA(self)
	}
	
	
	method modificarVitalidad(cantidad) {
		vitalidad += cantidad
	}
	
	method modificarPeso(cantidad) {
		peso += cantidad
	}
	
	method peso() = peso
	
	method vitalidad() = vitalidad
	
	method temperatura() = temperatura
	
}

object malaria {
	
	method afectarA(persona) {
		persona.incrementarTemperatura(3)
	}
}

object varicela {
	
	method afectarA(persona) {
		persona.modificarVitalidad(-5)
		persona.modificarPeso(- persona.peso()* 0.1)
	}
}


object gripe {

	method afectarA(persona) {
		persona.modificarVitalidad(- persona.vitalidad() * 0.2)
}
}

object paracetamol {
	
	method afectarA(persona){
		if(persona.temperatura() >37) {
			persona.temperatura(37)
	}
	
}

}
object polen {
	
	var cantGramos = 10
	
	method afectarA(persona) {
		persona.modificarVitalidad(cantGramos * 0.1)
	}		
	
}

object nuez {
	method afectarA(persona) {
		persona.modificarVitalidad(persona.vitalidad()*0.3)
	}
}

