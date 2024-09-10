object tom {
	
	var energia = 20
	
	var posicion = 30
	
	
	method energia() {
		return energia
	}
	
	method posicion() {
		return posicion
	}
	
	method energia(unaEnergia) {
		energia = unaEnergia
	}
	
	method puedeAtraparA(unRaton) {
		return self.velocidad() > unRaton.velocidad()
	}
	
	
	method velocidad() {
		return 5 + (energia/10)
	}
	
	method correrA(unRaton) {
		energia = energia - self.consumo(unRaton)
		posicion = unRaton.posicion()
	}
	
	method consumo(unRaton) {
		return 0.5* self.velocidad() * self.distanciaA(unRaton)
		
		}
		
		
	method distanciaA(unRaton) {
		return 	(unRaton.posicion() - posicion).abs()
	}
	
}


object jerry {
	
	
	var peso =  4
	var posicion = 34
	
	method velocidad() {
		return 10 - peso
	}
	
	method posicion() {
		return posicion
	}
	
}

 
 	
 
object ratonRobot {
	
	
	var velocidad = 8
	
	var posicion = 34
	
	
	method velocidad() {
		return velocidad
	}
	
	method posicion() {
		return posicion
	}
	
	
}