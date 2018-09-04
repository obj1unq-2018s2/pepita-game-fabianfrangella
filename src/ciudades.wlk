object villaGesell {
	method imagen() = "ciudad.png"
	method nombre() = "Villa Gesell"
	method posicion() = game.at(8,3)
	method teEncontro(alguien){
		game.say(alguien,"Uhh, esto esta lleno de tinchos!")
	}
}

object buenosAires {
	method imagen() = "ciudad.png"
	method nombre() = "Buenos Aires"
	method posicion() = game.at(1,1)		
	method teEncontro(alguien){
		game.say(alguien,"Maestro, sabe donde para el blanquito?")
	}
}
