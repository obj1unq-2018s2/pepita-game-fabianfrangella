/*Introducir Roque, el entrenador, que tendrá las siguientes capacidades:

 * Al encontrar una comida, Roque la levanta y se la guarda. Si ya tenía una suelta la anterior.
 * Al encontrar a pepita, Roque le entrega la comida que tiene y pepita se la come. 
 * Luego, hacer aparecer de nuevo la comida en un lugar al azar del tablero. */
import comidas.*

object roque {

	var property posicion = game.at(4, 4)
	var property comidaParaAves = null
	var posicionAleatoria = game.at(1.randomUpTo(10), 1.randomUpTo(10))

	method imagen() = "jugador.png"

	method alimentar(alguien) {
		if (comidaParaAves != null) {
			alguien.come(comidaParaAves)
			game.addVisualIn(comidaParaAves, posicionAleatoria)
			comidaParaAves = null
			posicionAleatoria = game.at(1.randomUpTo(10), 1.randomUpTo(10)) // cambia la posicion random para la proxima comida
		} else {
			game.say(self, "No tengo mas morfi :(")
		}
	}

	method agarrarComida(comida) {
		if (comidaParaAves != null) {		
			comidaParaAves = comida
			
			// TODO Acá asumo que estás intentando devolver la comida que tenías antes,
			// pero lo estás haciendo después de modificar la variable comidaParaAves
			// con lo cual la comida anterior ya la perdiste, tenés que hacerlo antes.
			// TODO Un detalle menor es que el clone no es necesario, down ya me da una nueva posición.
			game.addVisualIn(comidaParaAves, posicion.clone().down(1))
		} else {
			comidaParaAves = comida
		}
	}

}

