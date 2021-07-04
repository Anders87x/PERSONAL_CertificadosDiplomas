var usu_id = $('#usu_idx').val();

$(document).ready(function(){
    $.post("../../controller/usuario.php?op=mostrar", { usu_id : usu_id }, function (data) {
        data = JSON.parse(data);
        $('#usu_nom').val(data.usu_nom);
        $('#usu_apep').val(data.usu_apep);
        $('#usu_apem').val(data.usu_apem);
        $('#usu_correo').val(data.usu_correo);
        $('#usu_telf').val(data.usu_telf);
        $('#usu_pass').val(data.usu_pass);
        $('#usu_sex').val(data.usu_sex).trigger("change");
    });
});


$(document).on("click","#btnactualizar", function(){

    $.post("../../controller/usuario.php?op=update_perfil", { 
        usu_id : usu_id,
        usu_nom : $('#usu_nom').val(),
        usu_apep : $('#usu_apep').val(),
        usu_apem : $('#usu_apem').val(),
        usu_pass : $('#usu_pass').val(),
        usu_sex : $('#usu_sex').val(),
        usu_telf : $('#usu_telf').val()
     }, function (data) {
    });

    Swal.fire({
        title: 'Correcto!',
        text: 'Se actualizo Correctamente',
        icon: 'success',
        confirmButtonText: 'Aceptar'
    })
});