object knightRider {
	method peso() { 
		return 500 
	}
	method nivelPeligrosidad() { 
		return 10 
	}
  method bultos(){
    return 1
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
  method bultos(){
    return 1
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
  method bultos(){
    return 2
  }
}

object paqueteDeLadrillos {
  var cantidadDeLadrillos = 0
  method peso(){
	return cantidadDeLadrillos * 2
  }
  method nivelPeligrosidad(){
	return 2
  }

  //setter de la cantidad de ladrillos
  method cantidadDeLadrillos(_cantidadDeLadrillos){
	cantidadDeLadrillos = _cantidadDeLadrillos
  }
  method bultos(){
    if (cantidadDeLadrillos > 300){
      return 3
    }else if (cantidadDeLadrillos > 100){
      return 2
    } else {
      return 1
    }
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

  method bultos(){
    if(tieneMisiles){
      return 2
    }else{
      return 1
    }
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
  method bultos(){
    return 1
  }
}

object contenedorPortuario{
  var contiene = #{}
  const tara = 100
  method peso(){
    return tara + contiene.sum({o => o.peso()})
  }
  method nivelPeligrosidad(){
    return contiene.map({o => o.nivelPeligrosidad()}).maxIfEmpty({0})
  }
  method contiene(_contiene){
    contiene = _contiene
  }
  method bultos(){
    return contiene.sum({o => o.bultos()}) + 1
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
  method bultos(){
    return 2
  }
}