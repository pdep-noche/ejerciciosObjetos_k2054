object negocio {
	
	var disponible = 50000
	
	
	method pagarA(unEmpleado) {
		disponible = disponible - unEmpleado.monto()
	}	
}


object galvan {
	
	method monto() {
		return 15000
	}
}

object baigorria {
	var montoXEmpanada= 15
	var cantEmpanadasVendidas = 100
	
	method monto() {
		return montoXEmpanada * cantEmpanadasVendidas
	
	
	}
	
	method venderEmpanada(){
		cantEmpanadasVendidas = cantEmpanadasVendidas + 1
	}
}
