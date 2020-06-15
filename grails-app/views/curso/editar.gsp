<html>
    <head>
        <meta name="layout" content="main"/>
        <title> Editar curso</title>
    </head>
    <body>

        <div id="page-body" role="main">
            <div id="titulo">
                <h1 style="margin-left: 5%;" class="link">Editar Curso </h1>

                <div style="margin-left: 85%;">
                    <g:link controller="curso" action="index" class="link">
                        Volver
                    </g:link>
                    <br>
                </div>

                <g:if test="${flash.mensaje}">
                    <div class="message" role="status">
                        ${flash.mensaje}
                    </div>
                </g:if>
            </div>

        </div>

        <div style="margin-left: 40%;">
            <form action="${createLink(controller: 'curso', action:'actualizar')}">

                <input type="hidden" name="idCurso" value="${cursoEncontrado.id}" required autocomplete="off" />

                <input type="text" name="nombreCurso" value="${cursoEncontrado.nombre}" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <input type="date" name="fechaInicioCurso"  value="${formatDate(format: 'yyyy-MM-dd', date:cursoEncontrado.fechaInicio)}" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <input type="date" name="fechaFinCurso" value="${formatDate(format: 'yyyy-MM-dd', date:cursoEncontrado.fechaInicio)}" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <input type="submit" value="Actualizar"/>

            </form>
        </div>

    </body>
</html>
