function agregar() 
{
    //alertify.alert("USTED HA PULSADO BOTON AGREGAR");
    $("#txtcodigo").removeAttr("disabled");
    $("#txtnick").removeAttr("disabled");
    $("#txtnivel").removeAttr("disabled");
    $("#txtestado").removeAttr("disabled");
    $("#txttelefono").removeAttr("disabled");
    
    
    
    $("#btnGrabar").removeAttr("disabled");
    $("#btnCancelar").removeAttr("disabled");
    $("#btnAgregar").attr("disabled", "true");
    $("#btnModificar").attr("disabled", "true");
    $("#btnBorrar").attr("disabled", "true");
    $("#btnSalir").attr("disabled", "true");
    
    $("#operacion").val("1");
    
    $.post("solicita_gencodigo", {campo: "txtcodigo", tabla: "usuario"})
            .done(function (data) {
                $("#txtcodigo").val(data);
            });
}

function modificar() 
{
    //alertify.alert("USTED HA PULSADO BOTON AGREGAR");
    $("#txtcodigo").removeAttr("disabled");
    $("#txtnick").removeAttr("disabled");
    $("#txtnivel").removeAttr("disabled");
    $("#txtestado").removeAttr("disabled");
    $("#txttelefono").removeAttr("disabled");
    
    
    $("#btnGrabar").removeAttr("disabled");
    $("#btnCancelar").removeAttr("disabled");
    $("#btnAgregar").attr("disabled", "true");
    $("#btnModificar").attr("disabled", "true");
    $("#btnBorrar").attr("disabled", "true");
    $("#btnSalir").attr("disabled", "true");
    
    
    $("#operacion").val("2");
}
function borrar() 
{
    //alertify.alert("USTED HA PULSADO BOTON AGREGAR");
    $("#btnGrabar").removeAttr("disabled");
    $("#btnCancelar").removeAttr("disabled");
    $("#btnAgregar").attr("disabled", "true");
    $("#btnModificar").attr("disabled", "true");
    $("#btnBorrar").attr("disabled", "true");
    $("#btnSalir").attr("disabled", "true");
    
    $("#operacion").val("3");
    grabar();
}

function cancelar() 
{
    clear_text();
    
    $("#txtcodigo").attr("disabled", "true");
    $("#txtnick").attr("disabled", "true");
    $("#txtnivel").attr("disabled", "true");
    $("#txtestado").attr("disabled", "true");
    $("#txttelefono").attr("disabled", "true");
    
    $("#btnGrabar").attr("disabled", "true");
    $("#btnCancelar").attr("disabled", "true");
    $("#btnAgregar").removeAttr("disabled");
    $("#btnModificar").removeAttr("disabled");
    $("#btnBorrar").removeAttr("disabled");
    $("#btnSalir").removeAttr("disabled");
    
    get_datos("");
}

 function clear_text()
 {   
    $("#txtcodigo").val("");
    $("#txtnick").val("");
    $("#txtnivel").val("");
    $("#txtestado").val("");
    $("#txttelefono").val("");
 }
 
 
function grabar() 
{
    var d = $.trim($("#txtcodigo").val());
    var d = $.trim($("#txtnick").val());
    var d = $.trim($("#txtnivel").val());
    var d = $.trim($("#txtestado").val());
    var d = $.trim($("#txttelefono").val());

    if (d === "") 
    {
        alertify.alert('DEBES LLENAR TODOS LOS CAMPOS');
    } else 
    {
        var sql = "";
        var men = "";
        var conf = "";
        
        if ($("#operacion").val() === "1") 
        {
            sql = "insert into usuario(idUsuario,nick,nivel,estado,telefono) values(" + $("#txtcodigo").val() + ",upper('" + $("#txtnick").val() + "')," + $("#txtnivel").val() + ",'" + $("#txtestado").val() + "'," + $("#txttelefono").val() + ")";
            conf = "¿DESEA GUARDAR EL NUEVO USUARIO?";
            men = "EL USUARIO FUE REGISTRADA CON EXITO";
        }
        
        if ($("#operacion").val() === "2")
        {
            sql = "update usuario set nick= '" + $("#txtnick").val()+"', nivel = '" + $("#txtnivel").val() + "' where idUsuario = " + $("#txtcodigo").val();
            conf = "¿DESEA MODIFICAR?";
            men = "USUARIO FUE MODIFICADO CON EXITO";
        }
        
        if ($("#operacion").val() === "3") 
        {
            conf = "¿DESEA ELIMINAR ESTE USUARIO?";
            sql = "delete from usuario where idUsuario = " + $("#txtcodigo").val();
            men = "CIUDAD FUE ELIMINADO CON EXITO";
        }
        
        alertify.confirm(conf, function (e) 
        {
            if (e) 
            {
                $.post("enviosqlBoot", {sql: sql, men: men})
                        .done(function (data) {
                            alertify.alert(data);
                            cancelar();
                        });
            }
        });
    }
}

function get_datos(filtro)
{
    var sql = "select * from usuario where nick  like '%"+filtro+"%' order by idUsuario";
    $.post("extraer/get_ciudad", {sql: sql})
            .done(function (data) {
                $("#grilla tbody").html(data);
            });
}

function seleccion(parent) 
{
    parent.find("td").each(function(index)
    {
                if(index === 0)
                {
                    $("#txtcodigo").val($(this).text());
                }
                
                if(index === 1)
                {
                    $("#txtnick").val($(this).text());
                }
                
                if(index === 2)
                {
                    $("#txtnivel").val(parseInt($(this).text())).trigger("chosen:updated");
                }
                
                if(index === 3)
                {
                    $("#txtestado").val($(this).text());
                }
                
                if(index === 4)
                {
                    $("#txttelefono").val(parseInt($(this).text())).trigger("chosen:updated");
                }
           
     });
}

$(function () 
{
    get_datos("");
});

