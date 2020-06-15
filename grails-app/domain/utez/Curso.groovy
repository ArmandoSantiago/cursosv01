package utez

class Curso {

    String nombre
    Date fechaInicio
    Date fechaFin

    static hasMany = [participaciones:Participacion]

    static mapping = {
        table "Curso"
        version false
        columns {
                    nombre column : "nombreCurso"
                    fechaInicio column: "fechaInicioCurso"
                    fechaFin column: "fechaFinCurso"
                    
            }  
    }

    static constraints = {
        nombre blank : false, maxSize : 150, unique : ['fechaInicio', 'fechaFin']
      //  fechaInicio blank : false, nullable : false, date :true  
        //fechaFin blank : false, nullable : false, date :true //notEqual : fechaInicio  

    }

}
