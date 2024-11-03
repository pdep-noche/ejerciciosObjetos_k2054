class Bandada {
	
	const property aves = []
	const property formacion
	
	
	
	method ensuciar(vehiculo) {
		formacion.ensuciar(vehiculo, aves)
	
	}
	
	method cantidadDeAves() {
		return aves.size();
	}
	
	method agregarAve(unAve) {
		aves.add(unAve)
	}
}
	
class FormacionV  {
	
	
	method ensuciar(vehiculo, aves) {
		aves.forEach({unaAve => unaAve.ensuciar(vehiculo)})
	}}


object formacionW inherits FormacionV {
	override method ensuciar(vehiculo, aves) {
		2.times({super(vehiculo, aves)})
	}
}

object formacionI {
	

	 method ensuciar(vehiculo, aves){
		aves.first().ensuciar(vehiculo)
		aves.last().ensuciar(vehiculo)
		}
	}

	
class Paloma {
	var property peso
	
	method ensuciar(vehiculo) {
		 var cantEnsucia = peso * 0.3
		 vehiculo.incrementarSuciedad(cantEnsucia)
		 peso -= cantEnsucia
	}
	
}
class Gaviota {
	var  property cantPescados;
	
	method ensuciar(vehiculo) {
		
		vehiculo.incrementarSuciedad(cantPescados * 3)
	}
	
}

class Ave {
	
	var property ensucia;
	
	method ensuciar(vehiculo) {
		vehiculo.incrementarSuciedad(ensucia)
	}
}


class Vehiculo {
	var property nivelSuciedad = 0
	
	method incrementarSuciedad(cant) {
		nivelSuciedad += cant
	}
}

object caba {
	
	const property vehiculos = []
	
	method agregarVehiculo(unVehiculo) {
		vehiculos.add(unVehiculo)
}
}


class LuviaCeniza {
	var property cantMilimetros
	
	method lloverSobre(lugar) {
		lugar.vehiculos().forEach({unVehiculo => unVehiculo.incrementarSuciedad(cantMilimetros)})
	}	
}
	
	
class LavaderoArtesanal {
	var property cantPersonas
	var property costoMinuto
}
