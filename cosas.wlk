object knightRider {
	method peso() { 
		return 500 
	}
	method nivelPeligrosidad() { 
		return 10 
	}
}

object arenaAGranel {
  var peso = 0
  method peso() {
	return peso
	}
  method nivelPeligrosidad() {
	return 1
  }
  method peso(_peso){
	peso = _peso
  }

}

object bumblebee {
  var esAuto = true
  method peso(){
	return 800
  }
  method nivelPeligrosidad(){
	if(self.esAuto()){
 //aca es buena idea preguntarle al getter o mejor preguntarle a la variable?? 
	return 15
	}else{
		return 30
	}
  }
  //Setter de bool si es auto
  method esAuto(_esAuto){
	esAuto = _esAuto
  }
  //Getter de bool si es auto
  method esAuto(){
	return esAuto
  }
}

object paqueteDeLadrillos {
  var cantidadDeLadrillos = 0
  method peso(){
	cantidadDeLadrillos * 2
  }
  method nivelPeligrosidad(){
	return 2
  }

  //setter de la cantidad de ladrillos
  method cantidadDeLadrillos(_cantidadDeLadrillos){
	cantidadDeLadrillos = _cantidadDeLadrillos
  }

}

object bateriaAntiaerea {
  var tieneMisiles = true
  method peso() {
	if(tieneMisiles){
		return 300
	}else{
		return 200
	}
  }
  method nivelPeligrosidad(){
	if (tieneMisiles){
		return 100
	}else{
		return 0
	}
  }
  //setter de el bool de tieneMisiles
  method tieneMisiles(_tieneMisiles) {
	tieneMisiles = _tieneMisiles
  }
}

object residuosRadiactivos {
	var peso = 0
  method peso(){
	return peso
  }
  method nivelPeligrosidad(){
	return 200
  }
  //setter peso
  method peso(_peso){
	peso = _peso
  }
}

object contenedorPortuario{
  var contiene = #{}
  const tara = 100
  const peligrosidadDelContenido = {contiene.map({o => o.nivelPeligrosidad()})}
  method peso(){
    return tara + contiene.sum({o => o.peso()})
  }
  method nivelPeligrosidad(){
    return peligrosidadDelContenido.maxIfEmpty({0})
  }
}

object embalajeDeSeguridad {
  var objeto = null //hay que cargar un valor antes de usarla
  method peso(){
    objeto.peso()
  }
  method nivelPeligrosidad(){
    objeto.nivelPeligrosidad() * 0.5
  }
  method embalar(_objeto){
    objeto = _objeto
  }
}