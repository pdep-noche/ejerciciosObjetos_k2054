class Micro {
	
	var property cantSentados
	var property cantParados
	var property volumen
	const property pasajeros = []
	
	
	method subirA(unEmpleado)  {
		self.validarPuedeSubir(unEmpleado)
		pasajeros.add(unEmpleado)		
	}
	
	method validarPuedeSubir(unEmpleado) {
		if(!self.puedeSubir(unEmpleado)) {
			throw new DomainException(message= "El Empleado no puede subir")
		}
	}
	
	
	method puedeSubir(unEmpleado) {
		return self.hayLugar() && unEmpleado.quiereSubirA(self)
	}
	
	
	method hayLugar() {
		return self.capacidad() > self.cantPasajeros()
	}
	
	method capacidad() = cantParados + cantSentados
 	
 	
 	method cantPasajeros()  = pasajeros.size()
 	
 	
 	method puedeViajarSentado() = cantSentados > self.cantPasajeros()

	method cantLugaresLibres() = self.capacidad() - self.cantPasajeros()

	method bajarA(unEmpleado) {
		self.validarEmpleado(unEmpleado)
		pasajeros.remove(unEmpleado)
		
	}
	
	method validarEmpleado(unEmpleado) {
		
		if (!self.esta(unEmpleado)) {
			
			throw new DomainException(message = "El empleado no está en el micro")
			
		}
		
	}

	method esta(empleado) = pasajeros.contains(empleado)
	
	}
		
class Empleado {
	
	var property personalidad
	
	method quiereSubirA(micro) {
		return personalidad.quiereSubirA(micro)
	}
}

object apurado {
	method quiereSubirA(micro) = true
}

object claustrofobico {
	
	method quiereSubirA(micro) = micro.volumen() > 120
}





class Moderado {
	
	var property minCantLugaresLibres
	
	method quiereSubirA(micro) =  micro.cantLugaresLibres() > minCantLugaresLibres
	
}	
object fiaca {
	
	method quiereSubirA(micro) = micro.puedeViajarSentado()
	
}