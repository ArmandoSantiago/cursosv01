package utez

class PersonaController {

    def index() {
        render(view: '/persona/index',
                model: [personas: Persona.list(sort: 'id', order: 'desc')])
    }

    def registrar() {
        render view: '/persona/registrar'

    }

    def insertar() {

        Persona persona = new Persona()
        persona.nombre = params.nombre.toString()
        persona.apellidoPaterno = params.apellidoPaterno.toString()
        persona.apellidoMaterno = params.apellidoMaterno.toString()
        persona.edad = params.edad.toInteger()

        persona.validate()


        if (persona.hasErrors()) {
            flash.mensaje = "Ocurrió un error en el registro"
            redirect controller: 'persona', action: 'registrar'
            return
        }

        InformacionContacto contacto = new InformacionContacto()

        contacto.correo = params.correo.toString()
        contacto.telefono = params.telefono.toString()
        contacto.persona = persona

        contacto.validate()

        if (contacto.hasErrors()) {
            flash.mensaje = "Ocurrió un error en el registro del contacto"
            redirect controller: 'persona', action: 'registrar'
            return
        }

        persona.save(flush: true)
        contacto.save(flush: true)

        redirect(controller: 'persona', action: 'index')
    }

    def modificar() {

        def persona = Persona.findById(params.id)
        persona.nombre = params.nombre.toString()
        persona.apellidoPaterno = params.apellidoPaterno.toString()
        persona.apellidoMaterno = params.apellidoMaterno.toString()
        persona.edad = params.edad.toInteger()

        persona.validate()


        if (persona.hasErrors()) {
            flash.mensaje = "Ocurrió un error en el registro"
            redirect controller: 'persona', action: 'registrar'
            return
        }


        persona.save(flush: true)

        redirect(controller: 'persona', action: 'index')
    }

    def editar() {

        render(view: '/persona/editar', model: [persona: Persona.get(params.id as Long)])
        return

    }

    def eliminar() {
        Persona.findById(params.id as Long).delete(flush: true)
        redirect controller: 'persona', action: 'index'
    }


}
