import cosas.*

object camion {
	const property cosas = #{}
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method todoPesoPar(){
	//si hay un numero impar el resultado va a se impar
	return cosas.sum({o => o.peso()}).even()
	}

	method hayAlgunoQuePese(kilos){
		return cosas.contains(kilos)
	}
}

// sodaStereo.sum({musico => musico.cantidadAsistentes()})