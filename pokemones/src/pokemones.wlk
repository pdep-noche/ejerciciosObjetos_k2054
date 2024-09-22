object ash {
	
	const property pokemones = []
	
  method esGroso() = pokemones.all({unPokemon => unPokemon.nivel() > 100})

method pockemonPreferido() = pokemones.max({unPokemon => 
	unPokemon.potenciaAtaqueMasPotente();
}) 	

method pockemonesPulenta() {
	return pokemones.filter({pokemon => pokemon.esPulenta()})
}
}



object charizard {
	var property  tipo =  "fuego"
	var property ataque = lanzallamas
	
	method esPulenta() = false
	
	method aprender(unAtaque) {
		ataque = unAtaque
	}
	method nivel() {
		return ataque.potencia()
	}	
	method potenciaAtaqueMasPotente() = ataque.potencia()
}


object pikachu {
	
	var property  tipo =  "electrico"
	const property ataques = [agilidad, trueno, colaDeHierro]
	
	method nivel() {
		return ataques.sum({unAtaque => unAtaque.potencia()})
	}
	
	method potenciaAtaqueMasPotente() {
		return ataques.max({unAtaque => unAtaque.potencia()}).potencia()
	}
	
	
	method esPulenta() {
		return ataques.size() > 2 
	}

}
object lanzallamas {
	var property potencia = 5	
}

object agilidad {
	var property potencia = 4 
}

object trueno {
	var property potencia =  6
}

object colaDeHierro {
	var property potencia
}

object psyduck {
	var property tipo = "agua"
	method nivel() = 0
	
	method aprender(_) {
		
	}
	method potenciaAtaqueMasPotente() = 0
}	
object blastoise {
	var property tipo = "agua"
	var property principal =hidrobomba
	var property reserva = rayoDeHielo
	
	method aprender(unAtaque) {
		reserva = principal
		principal = unAtaque
	}
	
	method nivel()  = principal.potencia() + reserva.potencia()	
	
	method potenciaAtaqueMasPotente() {
		return principal.potencia().max({reserva.potencia()})
	}
	
}

object hidrobomba {
	var property potencia = 7
}

object rayoDeHielo {
	
	var property potencia = 8
}


