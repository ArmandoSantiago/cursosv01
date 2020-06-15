package utez

class Habilidad {

    String nombre

    static belongsTo = [persona : Persona]


    static mapping = {
        table "Habilidad"
        version false
        columns {
                nombre column: "nombreHabilidad"
            } 
    }

    static constraints = {
        nombre blank : false, maxSize : 50, unique:['persona']
    }

    String toString(){
        "${nombre} ${apellidoPaterno} ${apellidoMaterno}"
    }
}
