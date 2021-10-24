class MarcaCervezaRubia {
	var property contenidoDeLupulo
	var property paisDeFabricacion
	var property graduacion
}

class MarcaCervezaNegra {
	var property contenidoDeLupulo
	var property paisDeFabricacion
	var property graduacionReglamentaria
	
	method graduacion() { return graduacionReglamentaria - (contenidoDeLupulo * 2)}
}

class MarcaCervezaRoja inherits MarcaCervezaNegra {
	override method graduacion() { return super() * 1.25 }
}

class Jarra {
	var property capacidadDeLaJarra 
	var property marcaDeLaJarra
	method contenidoDeAlcohol() { return capacidad * (marca.graduacion() / 100)}
}