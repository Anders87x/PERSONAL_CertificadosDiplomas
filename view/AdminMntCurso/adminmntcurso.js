
var usu_id = $('#usu_idx').val();

function init(){
    $("#cursos_form").on("submit",function(e){
        guardaryeditar(e);
    });

    $("#detalle_form").on("submit",function(e){
        guardaryeditarimg(e);
    });
}

function guardaryeditar(e){
    e.preventDefault();
    var formData = new FormData($("#cursos_form")[0]);
    $.ajax({
        url: "../../controller/curso.php?op=guardaryeditar",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(data){
            console.log(data);
            $('#cursos_data').DataTable().ajax.reload();
            $('#modalmantenimiento').modal('hide');

            Swal.fire({
                title: 'Correcto!',
                text: 'Se Registro Correctamente',
                icon: 'success',
                confirmButtonText: 'Aceptar'
            })
        }
    });
}

$(document).ready(function(){

    $('#cat_id').select2({
        dropdownParent: $('#modalmantenimiento')
    });

    $('#inst_id').select2({
        dropdownParent: $('#modalmantenimiento')
    });

    combo_categoria();

    combo_instructor();

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
            url:"../../controller/curso.php?op=listar",
            type:"post"
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

});

function editar(cur_id){
    $.post("../../controller/curso.php?op=mostrar",{cur_id : cur_id}, function (data) {
        data = JSON.parse(data);
        $('#cur_id').val(data.cur_id);
        $('#cat_id').val(data.cat_id).trigger('change');
        $('#cur_nom').val(data.cur_nom);
        $('#cur_descrip').val(data.cur_descrip);
        $('#cur_fechini').val(data.cur_fechini);
        $('#cur_fechfin').val(data.cur_fechfin);
        $('#inst_id').val(data.inst_id).trigger('change');1
    });
    $('#lbltitulo').html('Editar Registro');
    $('#modalmantenimiento').modal('show');
}

function eliminar(cur_id){
    swal.fire({
        title: "Eliminar!",
        text: "Desea Eliminar el Registro?",
        icon: "error",
        confirmButtonText: "Si",
        showCancelButton: true,
        cancelButtonText: "No",
    }).then((result) => {
        if (result.value) {
            $.post("../../controller/curso.php?op=eliminar",{cur_id : cur_id}, function (data) {
                $('#cursos_data').DataTable().ajax.reload();

                Swal.fire({
                    title: 'Correcto!',
                    text: 'Se Elimino Correctamente',
                    icon: 'success',
                    confirmButtonText: 'Aceptar'
                })
            });
        }
    });
}

function imagen(cur_id){
    $('#curx_idx').val(cur_id);
    $('#modalfile').modal('show');
}

function nuevo(){
    $('#lbltitulo').html('Nuevo Registro');
    $('#cursos_form')[0].reset();
    combo_categoria();
    combo_instructor();
    $('#modalmantenimiento').modal('show');
}

function combo_categoria(){
    $.post("../../controller/categoria.php?op=combo", function (data) {
        $('#cat_id').html(data);
    });
}

function combo_instructor(){
    $.post("../../controller/instructor.php?op=combo", function (data) {
        $('#inst_id').html(data);
    });
}

function guardaryeditarimg(e){
    e.preventDefault();
    var formData = new FormData($("#detalle_form")[0]);
    $.ajax({
        url: "../../controller/curso.php?op=update_imagen_curso",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(datos){ 
            $('#cursos_data').DataTable().ajax.reload();
            Swal.fire({
                title: 'Correcto!',
                text: 'Se Actualizo Correctamente',
                icon: 'success',
                confirmButtonText: 'Aceptar'
            })
            $("#modalfile").modal('hide');

        }
    });
}

init();
