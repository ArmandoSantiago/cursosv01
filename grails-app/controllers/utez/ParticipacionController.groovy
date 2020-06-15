package utez

class ParticipacionController {

      def index() { 
        render (view:'/partipacion/index',
        model: [participaciones: Participacion.list(sort:'id', order:'desc')])
    }
}
