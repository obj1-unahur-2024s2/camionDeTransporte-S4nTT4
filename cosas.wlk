object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
    method bultos() = 1
}

object bumblebee {
    var estaTransformadoEnAuto = true
    method peso() = 800
    method nivelDePeligrosidad() {if(estaTransformadoEnAuto)15 else 30}
    method transformar() {estaTransformadoEnAuto = !estaTransformadoEnAuto}
}

object paqueteDeLadrillos {
    var property cantidadDeLadrillos = 0
    method peso() = cantidadDeLadrillos * 2
    method nivelDePeligrosidad() = 2

}

object arenaAGranel {
    var property peso = 0
    method nivelDePeligrosidad() = 1
    method bultos() = 1
}

object bateriaAntiaerea {
    var estaCargada = false
    method estaCargada() = estaCargada
    method peso(){if(self.estaCargada()) 300 else 200}
    method nivelDePeligrosidad(){if(self.estaCargada())100 else 0}
    method cargarMisiles() = !estaCargada
}

object contenedorPortuario {
    const contenedor = []
    method agregarCosaAlContenedor(cosa){
        contenedor.add(cosa)
    }

    method peso() {
       100 + contenedor.sum({ c => c.peso()})       //Suma el peso de cada cosa del contenedor.
    }
    method nivelDePeligrosidad(){
        if (contenedor.isEmpty()) return 0      //Si la lista esta vacia, retorna 0.
        return contenedor.max({ c => c.nivelDePeligrosidad()}.nivelDePeligrosidad())        //Devuelve en valor más alto del objeto.
    }
    method consecuencia() {
        contenedor.forEach({c => c.consecuencia()})
    }
}

object residuosRadioactivos {
    var peso = 0
    method peso() = peso
    method nivelDePeligrosidad() = 200
}

object embalajeDeSeguridad {
    var property cosaEnvuelta = cosaLlevable
    method peso() = cosaEnvuelta.peso()
    method nivelDePeligrosidad() {cosaEnvuelta.nivelDePeligrosidad() / 2}
}

object cosaLlevable {
    method peso() = 0
    method nivelDePeligrosidad() = 0 
}