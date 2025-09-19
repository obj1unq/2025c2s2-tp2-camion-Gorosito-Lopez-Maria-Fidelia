import cosas.*

object camion {
	const tara = 1000
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
		return cosas.any({o => o.peso() == kilos})
	}
	
	method pesoTotalDelCamion(){
		return tara + cosas.sum(cosas.map({o => o.peso()}))
	}

	method tieneExcesoDePeso(){
		return self.pesoTotalDelCamion() > 2500
	}

	method elDeNivel(nivel){
	return cosas.find({o => o.nivelPeligrosidad() == nivel})
	}

	method unoMasPeligrosoQueNivel(nivel){
		return cosas.filter({o => o.nivelPeligrosidad() > nivel})
	}

	method unoMasPeligrosoQueCosa(cosa){
		return self.unoMasPeligrosoQueNivel(cosa.nivelPeligrosidad())
	}
}

