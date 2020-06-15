<html>
<head>
    <meta name="layout" content="main"/>
    <title> Registrar curso</title>
</head>
<body>

<div id="page-body" role="main">
    <div id="titulo">
        <h1 style="margin-left: 5%;" class="link">Modificar habilidad </h1>

        <div style="margin-left: 85%;">
            <g:link controller="habilidad" action="index" class="link">
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
    <form action="${createLink(controller: 'habilidad', action:'guardar')}">

        <input type="hidden" value="${habilidad.id}" name="id" required autocomplete="off"/> 

        <input type="text" name="nombre" value="${habilidad.nombre}" required autocomplete="off" style="margin-bottom: 5%;"/>
        <br>
      
        <select id="persona.id" name="persona.id" required>
            <option value="">Seleccione una persona</option>
            <g:each in="${personas}" var="persona">
                <option value="${persona.id}"> 
                    ${habilidad.persona.id==persona.id ? 'selected':''}
                    ${persona.nombre} ${persona.apellidoPaterno} ${persona.apellidoMaterno}
                </option>
            </g:each>
        </select>
        <input type="submit" value="Guardar cambios"/>
        
    </form>
</div>

</body>
</html>