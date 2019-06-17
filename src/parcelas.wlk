import semillas.*

class Parcela {
	var ancho
	var largo
	var property horasDeSolRecibidas
	var property plantas = []
	
	method superficie() = ancho * largo

	method cantidadDePlantas() = self.plantas().size()
	
	method cantidadDePlantasQueTolera(){
		var cantidad
	 	if(ancho > largo){
	 		cantidad = self.superficie() / 5
	 	}else{
	 		cantidad = (self.superficie() / 3) + largo
	 	}
	 	return cantidad.roundUp()
	}
	
	method tieneComplicaciones() = self.plantas().any({planta => planta.horasDeToleranciaAlSol() < self.horasDeSolRecibidas()})
	
	method recibeMasHorasDeSolQuePlanta(planta) = (self.horasDeSolRecibidas() - planta.horasDeToleranciaAlSol()) >= 2

	method plantar(nuevaPlanta){
		if(self.cantidadDePlantas() == self.cantidadDePlantasQueTolera() or self.recibeMasHorasDeSolQuePlanta(nuevaPlanta) ){
			throw new UserException("No se puede plantar")
		}
		self.plantas().add(nuevaPlanta)
	}
}

class ParcelaEcologica inherits Parcela {	 
	 method seAsociaBienUnaPlanta(planta){
	 	return not self.tieneComplicaciones() and planta.parcelaIdeal(self)
	 }
}

class ParcelaIndustrial inherits Parcela {
	method seAsociaBienUnaPlanta(planta){
	 	return not (self.cantidadDePlantas() <= 2) and planta.esFuerte()
	 }
}

class UserException inherits Exception { }


object inta{
	var property parcelas = []
	
	method cantidadDeParcelas() = self.parcelas().size()
	method cantidadDePlantasEnParcelas() = self.parcelas().map({unaParcela => unaParcela.cantidadDePlantas()}).sum()
	
	method promedioDePlantasPorParcela() = (self.cantidadDePlantasEnParcelas() / self.cantidadDeParcelas()).roundUp()
	
	
}