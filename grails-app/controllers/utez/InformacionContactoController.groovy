package utez

class InformacionContactoController {

     def index() { 
        render (view:'/informacionContacto/index',
        model: [informacionContacto: InformacionContacto.list(sort:'id', order:'desc')])
    }
}
