package utez

class Participacion {

    Date fechaRegistro

    static belongsTo = [persona : Persona, curso : Curso]

    static mapping = {
        version false
    }

    //  validator: { val -> validateDate(val) - no lo quise poner porque voy a inv. mas sobre como se usa

    static constraints = {
        persona unique : ['curso'] 
    }
}
