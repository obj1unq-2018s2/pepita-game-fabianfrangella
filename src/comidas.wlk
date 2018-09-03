object manzana {
	const property imagen = "manzana.png"
	method energia() = 80
	method alimentar(alguien){}
	method teEncontro(alguien){
		alguien.agarrarComida(self)
		game.removeVisual(self)
	}
	
}

object alpiste {
	const property imagen = "alpiste.png"
	method energia() = 5
	method alimentar(alguien){}
	method teEncontro(alguien){
		alguien.agarrarComida(self)
		game.removeVisual(self)
	}
	
}
