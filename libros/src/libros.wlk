object andy {
	const property librosLeidos = [ harryPotter, seniorDeLosAnillos, elPrincipito,
		juegosDelHambre, venasAbiertaAmericaLatina, rayuela]
		
	
	method utlimoLibroLeidos() = librosLeidos.last();
	
	method primerLibroLeido() = librosLeidos.first()
	
	method cantidadLibrosLeidos() = librosLeidos.size() 
	
}


object harryPotter {
	var property lectores = 10500156
	method valoracion()  = lectores / 1000000
}

object seniorDeLosAnillos {
	var property cantPaginas = 450
	
	method valoracion() = cantPaginas/45
		
}

object elPrincipito {
	var property valoracion = 50
}

object juegosDelHambre {
	
	var property cantVotosPositivos = 1600200 
	var property cantVotosNegativos = 300600
	
	method coeficiente() =   cantVotosPositivos - cantVotosNegativos
	
	method valoracion() {
		if (self.coeficiente() > 0)  {
			return self.coeficiente()/ 100000
		}
		return 0
	}
		
}


	object venasAbiertaAmericaLatina {
		var property anioPublicación = 1971
		method valoracion() = self.cantidadDeAnios() /3
	}




	object rayuela {
		const titulo = "Rayuela"
	
	method valoracion() = self.cantLetras()	 *2

	method cantLetras() = titulo.size()

	}
	
