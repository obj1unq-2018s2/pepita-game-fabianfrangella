/*Introducir Roque, el entrenador, que tendrá las siguientes capacidades:

 * Al encontrar una comida, Roque la levanta y se la guarda. Si ya tenía una suelta la anterior.
 * Al encontrar a pepita, Roque le entrega la comida que tiene y pepita se la come. 
 * Luego, hacer aparecer de nuevo la comida en un lugar al azar del tablero. */
import comidas.*

object roque {

	var property posicion = game.at(4, 4)
	var property comidaParaAves = alpiste
	var x = 1.randomUpTo(10)
	var y = 1.randomUpTo(10)
	var property posicionAleatoria = game.at(x, y)

	method imagen() = "jugador.png"

	method alimentar(alguien) {
		if (comidaParaAves != null) {
			game.addVisualIn(comidaParaAves, posicionAleatoria)
			alguien.come(comidaParaAves)
			comidaParaAves = null
		} else {
			game.say(self, "No tengo mas morfi :(")
		}
	}

	method agarrarComida(comida) {
		if (comidaParaAves != null) {
			//game.addVisualIn(comida, posicionAleatoria)
			game.removeVisual(comidaParaAves)
		}
		comidaParaAves = comida
	}

}

