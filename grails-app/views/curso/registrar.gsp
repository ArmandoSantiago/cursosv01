<html>
    <head>
        <meta name="layout" content="main"/>
        <title> Registrar curso</title>
    </head>
    <body>

        <div id="page-body" role="main">
            <div id="titulo">
                <h1 style="margin-left: 5%;" class="link">Registrar Curso </h1>

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
            <form action="${createLink(controller: 'curso', action:'insertar')}">
                <input type="text" name="nombre" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <input type="date" name="fechaInicio" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <input type="date" name="fechaFin" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <input type="submit" value="Registrar"/>
            </form>
        </div>

    </body>
</html>
