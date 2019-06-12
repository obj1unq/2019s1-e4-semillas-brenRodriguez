import parcelas.*


class Menta {
	var property horasDeToleranciaAlSol = 6
	var property altura = 0
	var property anioObtencion
	
	method espacioQueOcupa() = self.altura() * 3
	
	method esFuerte(){
		return self.horasDeToleranciaAlSol() > 10
	}
	
	method daNuevasSemillas() = self.esFuerte() or self.altura() > 0.4
	
	method parcelaIdeal(parcela){
		return parcela.superficie() > 6
	}
}
	
class Soja {
	var property altura = 0
	var property anioObtencion

	method espacioQueOcupa() = self.altura() / 2
	
	method horasDeToleranciaAlSol(){
		var horas
		if(self.altura() < 0.5){
			horas = 6
		}
		if(self.altura() >= 0.5 and self.altura() < 1){
			horas = 7
		} else{
			horas = 9
		}
		return horas
	}
	
	method esFuerte(){
		return self.horasDeToleranciaAlSol() > 10
	}
	
	method daNuevasSemillas() = self.esFuerte() or anioObtencion > 2007 and altura > 1
	
	method parcelaIdeal(parcela){
		return parcela.plantas().all({unaPlanta => unaPlanta.altura() < 1.5}) 
	}
	
}	

class Quinoa{
	var property altura = 0
	var property espacioQueOcupa = 0.5
	var property anioObtencion
	var property horasDeToleranciaAlSol
	
	method esFuerte(){
		return self.horasDeToleranciaAlSol() > 10
	}
	
	method daNuevasSemillas() = self.esFuerte() or anioObtencion < 2005
	
	method parcelaIdeal(parcela){
		return parcela.horasDeSolRecibidas() == self.horasDeToleranciaAlSol()
	}
	
}	
	
class SojaTransgenica inherits Soja{
	override method daNuevasSemillas() = false
	override method parcelaIdeal(parcela) = parcela.cantidadDePlantas() > 1
}	

class Hierbabuena inherits Menta{
	override method daNuevasSemillas() = false
	override method espacioQueOcupa() = self.espacioQueOcupa() * 2 
}	

	