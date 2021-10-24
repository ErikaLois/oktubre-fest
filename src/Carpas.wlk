import Marcas.*
import Personas.*

class Carpa {
	const limiteDePersonas
	const property tieneBandaTradicional
	const property marcaQueVende
	var property personasAdentro = []
	
	method dejaIngresarA(persona) { return self.personasAdentro().sum() + 1 < limiteDePersonas and not persona.estaEbria()}
	
	method ingresa(persona) { personasAdentro.add(persona)}
	
	method servirJarraA(cap, persona) { 
		const jarra = new Jarra(capacidadDeLaJarra = cap, marcaDeLaJarra = self.marcaQueVende())
		
		if (personasAdentro.find({ p => persona})) {persona.agregarJarra(jarra)}
		else self.error("La persona no está en la carpa")
	}
	
}




	
