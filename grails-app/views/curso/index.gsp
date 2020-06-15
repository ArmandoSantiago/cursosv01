<html>
<head>
    <meta name="layout" content="main"/>
    <title>Cursos</title>
</head>

<body>
<div id="page-body" role="main">
    <div id="titulo">
        <h1 style="margin-left: 5%;" class="link">Cursos</h1>

        <div style="margin-left: 85%;">
            <g:link controller="curso" action="registrar" class="link">
                Nuevo Curso
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

<div id="contenido">
    <table>
        <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>Fecha Inicio</th>
            <th>Fecha Fin</th>
            <th>Acciones</th>
        </tr>

        <g:if test="${cursos.isEmpty()}">
            <tr>
                <td colspan="2">
                    Sin registros
                </td>
            </tr>
        </g:if>

        <g:each in="${cursos}" var="curso" status="i">
            <tr>
                <th>
                    ${i + 1}
                </th>
                <th>
                    ${curso.nombre}
                </th>
                <th>
                    ${curso.fechaInicio}
                </th>
                <th>
                    ${curso.fechaFin}
                </th>
                <th>
                    <g:link controller="curso" action="editar" params="[
                            idCurso: curso.id, nombreCurso: curso.nombre
                    ]">
                        Editar
                    </g:link>
                    <g:link controller="curso" action="eliminar" params="[id: curso.id]">
                        Eliminar
                    </g:link>
                </th>

            </tr>
        </g:each>
    </table>
</div>
</body>
</html>
