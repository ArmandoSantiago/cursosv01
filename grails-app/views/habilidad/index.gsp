<html>
<head>
    <meta name="layout" content="main"/>
    <title> Habilidades</title>
</head>
<body>

<div id="page-body" role="main">
    <div id="titulo">
        <h1 style="margin-left: 5%;" class="link">Habilidades </h1>
        <div style="margin-left: 85%;">
            <g:link controller="habilidad" action="registrar" class="link">
                Nueva habilidad
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
    <th>Nombre Habilidad</th>
    <th>Persona</th>
    <th>Editar</th>
    <th>Eliminar</th>
    </tr>

    <g:if test="${habilidades.idEmpty()}">
        <tr>
            <td colspan="2">
                Sin registros de habilidades
            </td>
        </tr>
    </g:if>
    <g:each in="${habilidades}" var="habilidad" status="i">
    <tr>
        <th> ${i+1} </th>
        <th> ${habilidad.nombre}</th>
        <th> ${habilidad.persona.nombre} </th>
        <th> ${habilidad.persona.apellidoPaterno} </th>
        <th> ${habilidad.persona.apellidoMaterno}</th>
        <th>
            <g:link controller="habilidad" action="editar" params="[id: habilidad.id]">
                Editar
            </g:link>
        </th>
        <th>
            <g:link controller="habilidad" action="eliminar" params="[id: habilidad.id]">
                Eliminar
            </g:link>
        </th>
    </tr>
    
    </g:each>
    </table>
</div>
</body>
</html>