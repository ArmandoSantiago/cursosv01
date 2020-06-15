package utez

class InformacionContacto {

    String correo
    String telefono

    static belongsTo = [persona : Persona]


    static mapping = {
        table "Contacto"
        version false
        columns {
                correo column: "correoContac"
                telefono column: "telefonoContac"
                    
            } 
    }

    static constraints = {
        correo email:true, unique : true, nullable : false 
        telefono unique : true, nullable : false 
        //size: 10..15
    }
}
