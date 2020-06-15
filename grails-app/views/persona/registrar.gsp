<html>
    <head>
        <meta name="layout" content="main"/>
        <title> Registrar persona</title>
    </head>
    <body>

        <div id="page-body" role="main">
            <div id="titulo">
                <h1 style="margin-left: 5%;" class="link">Registrar persona </h1>

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
            <form action="${createLink(controller: 'persona', action:'insertar')}">
                <label>Nombre</label>
                <input type="text" name="nombre" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                  <label>Apellido Paterno</label>
                <input type="text" name="apellidoPaterno" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <label>Apellido Materno</label>
                <input type="text" name="apellidoMaterno" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <label>Edad</label>
                <input type="number" name="edad" required autocomplete="off" style="margin-bottom: 5%;"/>
                <br>
                <h3>Datos de información de contacto</h3>
                <label>Teléfono</label>
                <input type="tel" name="telefono" required autocomplete="off" style="margin-bottom: 5%;"/>

                <label>Correo electrónico</label>
                <input type="email" name="correo" required autocomplete="off" style="margin-bottom: 5%;"/>

                <input type="submit" value="Registrar"/>

            </form>
        </div>

    </body>
</html>
