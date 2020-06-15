<html>
    <head>
        <meta name="layout" content="main"/>
        <title> Editar persona</title>
    </head>
    <body>

        <div id="page-body" role="main">
            <div id="titulo">
                <h1 style="margin-left: 5%;" class="link">Editar persona </h1>

                <div style="margin-left: 85%;">
                    <g:link controller="persona" action="index" class="link">
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
            <form action="${createLink(controller: 'persona', action:'modificar')}">
                <input type="hidden" name="id" value="${persona.id}" required/>
                <label>Nombre</label>
                <input type="text" name="nombre" value="${persona.nombre}" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                  <label>Apellido Paterno</label>
                <input type="text" name="apellidoPaterno" value="${persona.apellidoPaterno}" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <label>Apellido Materno</label>
                <input type="text" name="apellidoMaterno" value="${persona.apellidoMaterno}" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <label>Edad</label>
                <input type="number" step="1" name="edad" value="${persona.edad}" required autocomplete="off" style="margin-bottom: 5%;"/>

                <input type="submit" value="Editar"/>

            </form>
        </div>

    </body>
</html>
