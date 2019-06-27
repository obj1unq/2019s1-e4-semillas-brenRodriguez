import parcelas.*
//SUPER CLASE PLANTA:

class Planta {
	var property altura
	var property anioObtencion
	
	method horasDeToleranciaAlSol()
	
	method esFuerte(){
		return self.horasDeToleranciaAlSol() > 10
	}
	method condicionAlternativa()
	method daNuevasSemillas() = self.esFuerte() or self.condicionAlternativa()
}

//MENTA:

class Menta inherits Planta{
	var property horasDeToleranciaAlSol = 6

	method espacioQueOcupa() = altura * 3
	
	override method condicionAlternativa() = altura > 0.4
	
	method parcelaIdeal(parcela){
		return parcela.superficie() > 6
	}
	
}

//SOJA:
	
class Soja inherits Planta {

	override method horasDeToleranciaAlSol(){
		var horas
		if(altura < 0.5){
			horas = 6
		}
		if(altura >= 0.5 and altura < 1){
			horas = 7
		} else{
			horas = 9
		}
		return horas
	}
	
	method espacioQueOcupa() = altura / 2
		
	override method condicionAlternativa() = anioObtencion > 2007 and altura > 1
	
	method parcelaIdeal(parcela){
		return parcela.horasDeSolRecibidas() == self.horasDeToleranciaAlSol()
	}
	
}	

//QUINOA:

class Quinoa inherits Planta {
	var property horasDeToleranciaAlSol
	var property espacioQueOcupa = 0.5
	
	override method condicionAlternativa() = anioObtencion < 2005
	
	method parcelaIdeal(parcela){
		return parcela.plantas().all({unaPlanta => unaPlanta.altura() < 1.5}) 
	}
	
}	
	
//SOJA TRANSGENICA:
	
class SojaTransgenica inherits Soja{
	override method daNuevasSemillas() = false
	override method condicionAlternativa() =false
	override method parcelaIdeal(parcela) = parcela.cantidadDePlantas() == 1
}	

//HIERBABUENA:

class Hierbabuena inherits Menta{
	override method espacioQueOcupa() {
	 	return super() * 2 
	}
}	

	