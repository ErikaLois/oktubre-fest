import Marcas.*
import Carpas.*

class Persona {
	const property peso
	var property jarrasCompradas = []
	const property leGustaMusicaTradicional
	const property nivelDeAguante // Es un número
	const property paisDeOrigen
	
	method estaEbria() { return self.totalDeAlcoholIngerido() * peso > nivelDeAguante}
	
	method totalDeAlcoholIngerido() {return jarrasCompradas.sum({ j => j.contenidoDeAlcohol()})}
	
	method leGustaLaMarca(marca) {return true}
	
	method quiereEntrar(carpa) { 
		return self.leGustaLaMarca(carpa.marcaQueVende()) and leGustaMusicaTradicional == carpa.tieneBandaTradicional()
	}
	
	method puedeIngresarA(carpa) { return self.quiereEntrar(carpa) and carpa.dejaIngregar(self)}
	
	method ingresarA(carpa) { 
		if (self.puedeIngresarA(carpa)) {
			carpa.ingresa(self)}
		else self.error("La persona no puede ingresar a la carpa") }
	
	method agregarJarra(jarra) { jarrasCompradas.add(jarra) }
	
	method esPatriota() { return jarrasCompradas.all({j => j.paisDeFabricacion() == self.paisDeOrigen()})}
	
	method enQueCarpaLeSirvieron() {
		return jarrasCompradas.map({j => j.enQueCarpaSeSirvio()})
	}
}

class PersonaBelga inherits Persona {
	override method paisDeOrigen() = "Belgica"
	override method leGustaLaMarca(marcaDeCerveza) { return marcaDeCerveza.contenidoDeLupulo() > 4 }
}

class PersonaCheca inherits Persona {
	override method paisDeOrigen() = "Republica Checa"
	override method leGustaLaMarca(marcaDeCerveza) { return marcaDeCerveza.graduacion() > 8 }
}

class PersonaAlemana inherits Persona {
	override method paisDeOrigen() = "Alemania"
	override method leGustaLaMarca(marcaDeCerveza) { return true }
	
	override method quiereEntrar(carpa) { return super(carpa) and carpa.personasAdentro().sum() > 0}
}