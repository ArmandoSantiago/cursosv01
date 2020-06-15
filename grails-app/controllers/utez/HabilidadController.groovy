package utez

class HabilidadController {

     def index() { 
        render (view:'/habilidad/index',
        model: [habilidades: Habilidad.list(sort:'id', order:'desc')])
    }

    def registrar(){
        render view:'/habilidad/registrar',
        model: [personas: Persona.list(sort:'id', order:'desc')]
    }

    def insertar(){
        Persona persona = Persona.get(params.persona.id as Long)
        if(persona){
            Habilidad habilidadExistente = 
                    Habilidad.findByNombreAndPersona(params.nombre, persona)

            if(habilidadExistente){
                flash.mensaje = persona.toString() + "ya cuenta con esa habilidad registrada"
                redirect controller: 'habilidad', action: 'registrar'
                return
            }

            Habilidad nuevaHabilidad = new Habilidad()
            nuevaHabilidad.nombre = params.nombre
            nuevaHabilidad.persona = persona

            nuevaHabilidad.validate()

            if(nuevaHabilidad.hasErrors()){
                flash.mensaje = params.toString() +"ya cuenta con con la habilidad ingresada"
                redirect controller: 'habilidad', action:'registrar'
                return
            }

            nuevaHabilidad.save(flush:true)

        }
        redirect controller:'habilidad', action:'index'

    }

    def eliminar (){
        def habilidadEliminar = Habilidad.get(params.id)
        if(!habilidadEliminar){

            flash.mensaje= "La habilidad no existe"
            redirect controller:'habilidad', action:'index'
            return
        }
        habilidadEliminar.delete(flush:true)
        flash.mensaje = "La habilidad"+${habilidadEliminar.nombre}+ "se ha eliminado"
        redirect controller: 'habilidad', action:'index'
    }

    def editar(){
        
        render view: '/habilidad/editar', 
        model: [habilidad: Habilidad.get(params.id), personas:Persona.list(sort:'id', order:'desc')]
    }

    def guardar(){


        

    }
}
