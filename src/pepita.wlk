import ciudades.*

/*Hacer que pepita no haga nada si le indico que vuele a la ciudad en la que ya está. 
 * En cambio usar el mensaje 'say' para que pepita diga "Ya estoy en !".
 * Pepita tampoco debe volar si no le alcanza la energia y en cambio usamos el mensaje 'say' para decir 
 * "Dame de comer primero!". */
object pepita {

	var property energia = 100
	var property ciudad = buenosAires
	var property posicion = game.at(3, 3)

	method imagen() = "pepita.png"

	method come(comida) {
		energia = energia + comida.energia()
		game.say(self, "mmm que rico!")
	}

	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.posicion())
			ciudad = unaCiudad
		} else {
			game.say(self, "Ya estoy en " + unaCiudad + "!!")
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		if (energia >= self.energiaParaVolar(posicion.distance(nuevaPosicion))) {
			energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
			self.posicion(nuevaPosicion)
		} else {
			game.say(self, "Dame de comer primero rata!")
		}
	}

}

