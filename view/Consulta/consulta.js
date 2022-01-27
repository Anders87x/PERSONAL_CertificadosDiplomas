function init(){

}

$(document).ready(function(){
    $("#divpanel").hide();
});
$(document).on("click","#btnconsultar", function(){
    var usu_dni = $("#usu_dni").val();
    if (usu_dni.length == 0){
        Swal.fire({
            title: 'Error!',
            text: 'DNI Vacio',
            icon: 'error',
            confirmButtonText: 'Aceptar'
        })
    }else{
        
        $.post("../../controller/usuario.php?op=consulta_dni",{usu_dni : usu_dni}, function (data) {
            if (data.length>0){
                data = JSON.parse(data);

                $("#lbldatos").html("Listado de Cursos : "+data.usu_apep+" "+data.usu_apem+" "+data.usu_nom);

                $('#cursos_data').DataTable({
                    "aProcessing": true,
                    "aServerSide": true,
                    dom: 'Bfrtip',
                    buttons: [
                        'copyHtml5',
                        'excelHtml5',
                        'csvHtml5',
                    ],
                    "ajax":{
                        url:"../../controller/usuario.php?op=listar_cursos",
                        type:"post",
                        data:{usu_id:data.usu_id},
                    },
                    "bDestroy": true,
                    "responsive": true,
                    "bInfo":true,
                    "iDisplayLength": 10,
                    "order": [[ 0, "desc" ]],
                    "language": {
                        "sProcessing":     "Procesando...",
                        "sLengthMenu":     "Mostrar _MENU_ registros",
                        "sZeroRecords":    "No se encontraron resultados",
                        "sEmptyTable":     "Ningún dato disponible en esta tabla",
                        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix":    "",
                        "sSearch":         "Buscar:",
                        "sUrl":            "",
                        "sInfoThousands":  ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst":    "Primero",
                            "sLast":     "Último",
                            "sNext":     "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        }
                    },
                });

                $("#divpanel").show();
            }else{
                Swal.fire({
                    title: 'Error!',
                    text: 'No Existe Usuario',
                    icon: 'error',
                    confirmButtonText: 'Aceptar'
                })
            }
        });

    }

});

function certificado(curd_id){
    console.log(curd_id);
    window.open('../Certificado/index.php?curd_id='+ curd_id +'','_blank');
}