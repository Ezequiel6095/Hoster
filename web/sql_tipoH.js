function agregar() 
{
    //alertify.alert("USTED HA PULSADO BOTON AGREGAR");
    $("#txtubicacion").removeAttr("disabled");
      $("#textipo").removeAttr("disabled");
          $("#textcapacidad").removeAttr("disabled");
      
    
    $("#btnGrabar").removeAttr("disabled");
    $("#btnCancelar").removeAttr("disabled");
    $("#btnAgregar").attr("disabled", "true");
    $("#btnModificar").attr("disabled", "true");
    $("#btnBorrar").attr("disabled", "true");
    $("#btnSalir").attr("disabled", "true");
    
    $("#operacion").val("1");
    
    $.post("solicita_gencodigo", {campo: "idTipoHabitacion", tabla: "tipohabitacion"})
            .done(function (data) {
                $("#txtcodigo").val(data);
            });
}

function modificar() 
{
    //alertify.alert("USTED HA PULSADO BOTON AGREGAR");
    $("#txtubicacion").removeAttr("disabled");
     $("#textipo").removeAttr("disabled");
         $("#textcapacidad").removeAttr("disabled");
     
     
     
    $("#btnGrabar").removeAttr("disabled");
    $("#btnCancelar").removeAttr("disabled");
    $("#btnAgregar").attr("disabled", "true");
    $("#btnModificar").attr("disabled", "true");
    $("#btnBorrar").attr("disabled", "true");
    $("#btnSalir").attr("disabled", "true");
    
    
    $("#operacion").val("2");
    $("#txtubicacion").select();
     $("#textipo").select();  
      $("#textcapacidad").select();
      
      
    
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
    
    $("#txtubicacion").attr("disabled", "true");
     $("#textipo").attr("disabled", "true");
        $("#textcapacidad").attr("disabled", "true"); 
     
     
     
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
    $("#txtubicacion").val("");      
     $("#textipo").val("");    
    $("#textcapacidad").val("");  
    
    
 }
 
 
function grabar() 
{
    var d = $.trim($("#txtubicacion").val());
    var d = $.trim($("#textipo").val());
    var d = $.trim($("#textcapacidad").val());
        
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
            sql = "insert into tipohabitacion(idTipoHabitacion,ubicacion,tipo_habitacion,capacidad) values(" + $("#txtcodigo").val() + ",upper('" + $("#txtubicacion").val() + "'),'" + $("#textipo").val() + "','" + $("#textcapacidad").val() + "')";
            conf = "¿DESEA GUARDAR EL NUEVO GRUPO?";
            men = "EL GRUPO FUE REGISTRADO CON EXITO";
        }
        
        if ($("#operacion").val() === "2")
        {
            sql = "update tipohabitacion set ubicacion = '" + $("#txtubicacion").val() +"', tipo_habitacion = '" + $("#textipo").val() +"', capacidad = '" + $("#textcapacidad").val() + "'  where idTipoHabitacion = " + $("#txtcodigo").val();
            conf = "¿DESEA MODIFICAR?";
            men = "FUE MODIFICADA CON EXITO";
        }
        
        if ($("#operacion").val() === "3") 
        {
            conf = "¿DESEA ELIMINAR ESTE GRUPO?";
            sql = "delete from tipohabitacion where idTipoHabitacion = " + $("#txtcodigo").val();
            men = "FUE ELIMINADA CON EXITO";
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
    var sql = "select * from tipohabitacion where ubicacion like '%"+filtro+"%' order by idTipoHabitacion";
    $.post("extraer/get_tipoH", {sql: sql})
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
                    $("#txtubicacion").val($(this).text());
                }
                
                   if(index === 2)
                {
                    $("#textipo").val($(this).text());
                }             
                    if(index === 3)
                {
                    $("#textcapacidad").val($(this).text());
                }                   
                
     });
}

$(function () 
{
    get_datos("");
});

