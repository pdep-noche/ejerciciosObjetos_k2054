class Persona {
	
	var property temperatura
	var property cantCelulas
	const property enfermedades = []
	
	
	method contraer(unaEnfermedad) {
		enfermedades.add(unaEnfermedad)
	}
	
	method vivirUnDia(){
		enfermedades.forEach({enfermedad => enfermedad.afectarA(self)})
	}
	
	method incrementarTemperatura(cant){
		temperatura = 45.min(cant + temperatura)
	}
	
	method disminuirCelulas(cant){
		cantCelulas = 0.max(cantCelulas - cant)
	}
	method tieneEnfermedad(unaEnfermedad){
		return enfermedades.contains(unaEnfermedad)
	}
	
	method estaEnComa(){
	 return temperatura == 45 || cantCelulas < 1000000
	}
	
	method cantCelulasAmenazadasEnfAgresivas(){
		return self.enfermedadesAgresivas().sum({unaEnf => unaEnf.cantCelulas()})
	}
	
	method enfermedadesAgresivas() {
		return enfermedades.filter({enf => enf.esAgresiva(self)})
	}
}


class Enfermedad {
	
	var property cantCelulas
	
	method afectarA(unaPersona)
	method esAgresiva(unaPersona)
}

class Infecciosa inherits Enfermedad {
	
	override method afectarA(unaPersona){
		unaPersona.incrementarTemperatura(cantCelulas/1000)
	}
	
	method reproducir(){
		cantCelulas *=2
	}
	
	override method esAgresiva(unaPersona) {
		return cantCelulas > unaPersona.cantCelulas() *0.001
	}
	
}

class Autoinmune inherits Enfermedad {
	var cantDias = 0
	
	override method afectarA(unaPersona){
		cantDias += 1
		unaPersona.disminuirCelulas(cantCelulas)		
	}
	
	override method esAgresiva(unaPersona) {
		return cantDias > 30
	}
	
}