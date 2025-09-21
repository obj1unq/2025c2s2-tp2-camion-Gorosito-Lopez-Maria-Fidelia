import cosas.*

object camion {
	const tara = 1000
	var property cosas = #{}
	var dondeDejarCosas = almacen
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method dondeDejarCosas(_dondeDejarCosas) {
	  dondeDejarCosas = _dondeDejarCosas
	}
	
	method todoPesoPar(){
	//si hay un numero impar el resultado va a se impar
	return cosas.sum({o => o.peso()}).even()
	}

	method hayAlgunoQuePese(kilos){
		return cosas.any({o => o.peso() == kilos})
	}
	
	method pesoTotalDelCamion(){
		return tara + cosas.sum({o => o.peso()})
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

	method puedeCircularEn(nivelRuta){
		const peligroDelCamion = cosas.sum({o => o.nivelPeligrosidad()})
		return peligroDelCamion < nivelRuta && not self.tieneExcesoDePeso()
	}
	
	method hayAlgoQuePeseEntreY(pesoUno , pesoDos){
		return cosas.any({o => o.peso().between(pesoUno,pesoDos)})
		//NO ANDA
	}

	method cosaMasPesadaDelCamion(){
		return cosas.max({o => o.peso()})
	}
	method cantidadDeBultos(){
		return cosas.sum({o => o.bultos()})
	}

	method peligroDelCamion(){
		return cosas.sum({o => o.nivelPeligrosidad()})
	}

	method sufrirAccidente(){
		return cosas.forEach{a => a.sufreAccidente()}
	}

	method dejarCosasEn(lugar){
		lugar.agregarElementos(cosas)
		cosas = #{}
	}
	
	method transportar(destino,camino){
		if (camino.puedeCircular(self)){
			self.dejarCosasEn(destino)
		}
	}

}

object almacen {
  var elementos = #{}

  method elementos(){
	return elementos
  }

  method agregarElementos(_elementos){
	elementos = elementos.union(_elementos)
  }
  
}

object ruta9{
	method puedeCircular(transporte){
		return transporte.puedeCircularEn(20)
	}
	
}

object caminosVecinales {
	var pesoMaximoPermitido = 0
  method puedeCircular(transporte){
	return transporte.pesoTotalDelCamion() < self.pesoMaximoPermitido()
  }
  method pesoMaximoPermitido(_pesoMaximoPermitido){
	pesoMaximoPermitido = _pesoMaximoPermitido
  }
  method pesoMaximoPermitido(){
	return pesoMaximoPermitido
  }
}