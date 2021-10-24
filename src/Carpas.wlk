import Marcas.*
import Personas.*

class Carpa {
	const limiteDePersonas
	const property tieneBandaTradicional
	const property marcaQueVende
	var property personasAdentro = []
	
	method dejaIngresarA(persona) { return self.personasAdentro().size() + 1 < limiteDePersonas and (not persona.estaEbria())}
	
	method ingresa(persona) { personasAdentro.add(persona)}
	
	method servirJarraA(cap, persona) { 
		const jarra = new Jarra(capacidad = cap, marca = self.marcaQueVende())
		
		if (personasAdentro.contains(persona)) {persona.agregarJarra(jarra); jarra.enQueCarpaSeSirvio(self)}
		else self.error("La persona no está en la carpa")
	}
	
	method ebriosEmpedernidos() {
		return personasAdentro.filter({ p => p.estaEbria().jarrasCompradas().capacidad() >= 1}).sum()
	}
	
	method esHomogenea() {
		return personasAdentro.all({p => p.paisDeOrigen() == personasAdentro.first()})
	}
	
	method noTienenCerveza() {
		return personasAdentro.filter({ p => p.enQueCarpaLeSirvieron() != self})
	}
}




	
