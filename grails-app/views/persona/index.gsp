<html>
    <head>
        <meta name="layout" content="main"/>
        <title> Persona</title>
    </head>
    <body>

        <div id="page-body" role="main">
            <div id="titulo">
                <h1 style="margin-left: 5%;" class="link">Personas </h1>
                <div style="margin-left: 85%;">
                    <g:link controller="persona" action="registrar" class="link">
                        Nueva persona
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


        <div id="contenido" >
            <table>
            <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Edad</th>
            <th>Acciones</th>
            </tr>

            <g:if test="${personas.isEmpty()}">
                <tr>
                    <td colspan="2">
                        Sin registros
                    </td>
                </tr>
            </g:if>
            <g:each in="${personas}" var="persona" status="i">
                <tr>
                   <th>
                      ${i+1}
                   </th>
                   <th>
                       ${persona.nombre}
                   </th>
                   <th>
                    ${persona.apellidoPaterno}
                   </th>
                   <th>
                    ${persona.apellidoMaterno}
                   </th>
                   <th>
                    ${persona.edad}
                   </th>
                   <th>
                    <g:link controller="persona" action="editar" params="[id: persona.id]">
                        Editar
                    </g:link>
                    <g:link controller="persona" action="eliminar" params="[id: persona.id]">
                        Eliminar
                    </g:link>
                   </th>

                </tr>
                </g:each>
            </table>
        </div>
    </body>
</html>
