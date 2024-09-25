import cosas.*


object camion {
    const cosas = []

    method peso() = 1000 + cosas.sum({c => c.peso()})

    method cargarCosaACamion(cosa){
        cosas.add(cosa)
    }

    method descargarCosaDelCamion(cosa){
        cosas.remove(cosa)
    }

    method lasCosasCargadasSonImpares() {
        return cosas.all({c => c.peso().even()})            //Devuelve un booleano.
    }

    method cosaQuePesa(unValor) {
        return cosas.any({c => c.peso() == unValor})           //Devuelve un booleano.
    }

    method primerCosaCargada(unNivelDePeligrosidad) {
        return cosas.find({c => c.nivelDePeligrosidad() == unNivelDePeligrosidad})          //Devuelve un objeto que cumple con la condicion.
    }

    method cosasQueSuperanNivel(unNivelDePeligrosidad) {
        return cosas.filter({c => c.nivelDePeligrosidad() > unNivelDePeligrosidad})         //Devuelve una lista que cumple con la condicion.
    }

    method cosaQueSuperaNivelDePeligrosidad(cosa) {
        return self.cosasQueSuperanNivel(cosa.nivelDePeligrosidad())        //Devuelve un objeto(reutilizado) que cumple la condicion.
    }

    method camionEstaExedido() {
        return self.peso() > 2500
    }

    method puedeCircular(unNivelDePeligrosidad) {
        return not self.camionEstaExedido() && cosas.all({ c => self.todasLasCosasSonMenosPeligrosasQue(unNivelDePeligrosidad)}) //Devuelve un booleano(reutilizado)
    }

    method todasLasCosasSonMenosPeligrosasQue(unNivelDePeligrosidad){
        cosas.all({c => c.nivelDePeligrosidad() < unNivelDePeligrosidad})       //Devuelve un booleano que cumple la condicion con todos los objetos.
    }
}