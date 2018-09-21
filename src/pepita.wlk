import ciudades.*

/*Hacer que pepita no haga nada si le indico que vuele a la ciudad en la que ya está. 
 * En cambio usar el mensaje 'say' para que pepita diga "Ya estoy en !".
 * Pepita tampoco debe volar si no le alcanza la energia y en cambio usamos el mensaje 'say' para decir 
 * "Dame de comer primero!". */
/*Agregar imágenes de pepita que cambien en función de la energia que tiene.

 * Si tiene energia < 10 pepita está muy cansada, usar una imagen acorde.
 * Si tiene energia > 100 pepita está gorda
 En caso contrario podemos mantener la imagen actual. */
object pepita {

	var property energia = 100
	var property ciudad = null
	var property posicion = game.at(3, 3)
	var property imagen = "pepita.png"

	method fisico() {
		// TODO Este precálculo de la imagen es propenso a errores.
		// Salvo que tengas un muy buen motivo, evitalo.
		// De hecho, no funciona bien, no hay forma de que pepita vuelva a su forma original.
		if (energia > 100) {
			imagen = "pepita-gorda-raw.png"
		} else if (energia < 10) {
			imagen = "pepona.png"
		}
	}

	method come(comida) {
		energia = energia + comida.energia()
		game.say(self, "mmm que rico!")
		self.fisico()
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
		// TODO Acá hay una repetición que se puede evitar.
		if (energia >= self.energiaParaVolar(posicion.distance(nuevaPosicion))) {
			energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
			self.posicion(nuevaPosicion)
			self.fisico()
		} else {
			game.say(self, "Dame de comer primero rata!")
		}
	}
	
	method teEncontro(alguien){
		alguien.alimentar(self)
	}

}

