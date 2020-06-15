package utez

import java.text.SimpleDateFormat

class CursoController {

    def index() {
        render(view: '/curso/index',
                model: [cursos: Curso.list(sort: 'id', order: 'desc')])
    }

    def registrar() {
        render view: '/curso/registrar'
    }

    def insertar() {
        Date fechaInicio = new SimpleDateFormat("yyyy-MM-dd").parse(params.fechaInicio)
        Date fechaFin = new SimpleDateFormat("yyyy-MM-dd").parse(params.fechaFin)

        if (Curso.findByNombreAndFechaInicioAndFechaFin(params.nombre, fechaInicio, fechaFin)) {
            flash.mensaje = "Ocurrió un error en el registro"
            redirect controller: 'curso', action: 'registrar'
            return
        }

        Curso curso = new Curso()
        curso.nombre = params.nombre
        curso.fechaInicio = fechaInicio
        curso.fechaFin = fechaFin

        curso.validate()

        if (curso.hasErrors()) {
            flash.mensaje = "Ocurrió un error en el registro"
            redirect controller: 'curso', action: 'registrar'
            return
        }

        curso.save(flush: true)

        redirect(controller: 'curso', action: 'index')
    }

    def editar() {
        //params.idCurso pregunta si recibe el idCurso en params
        //Curso.get(params.idCurso) pregunta si exite el curso
        if (params.idCurso && Curso.get(params.idCurso as Long)) {
            render(view: '/curso/editar', model: [cursoEncontrado: Curso.get(params.idCurso as Long)])
            return
        }

        flash.mensaje = "Curso no fue encontrado"
        redirect controller: 'curso', action: 'index'
    }

    def eliminar() {
        if (params.id && Curso.findById(params.id as Long)) {
            Curso.findById(params.id as Long).delete(flush: true)
        } else {
            flash.mensaje = "Curso no encontrado"
        }

        redirect controller: 'curso', action: 'index'
    }

    def actualizar() {

        Date fechaInicio = new SimpleDateFormat("yyyy-MM-dd").parse(params.fechaInicioCurso)
        Date fechaFin = new SimpleDateFormat("yyyy-MM-dd").parse(params.fechaFinCurso)

        if (Curso.findByNombreAndFechaInicioAndFechaFinAndIdNotEqual(params.nombre, fechaInicio, fechaFin, params.id)) {
            flash.mensaje = "Información ya registrada"
            redirect controller: 'curso', action: 'editar', params: [idCurso: params.idCurso]
            return
        }

        Curso curso = Curso.get(params.id)
        curso.nombre = params.nombre
        curso.fechaInicio = fechaInicio
        curso.fechaFin = fechaFin

        curso.validate()

        if (curso.hasErrors()) {
            flash.mensaje = "Ocurrió un error en la actualización"
            redirect controller: 'curso', action: 'editar', params: [idCurso: params.idCurso]
            return
        }

        curso.save(flush: true)

        redirect(controller: 'curso', action: 'index')
    }
}
