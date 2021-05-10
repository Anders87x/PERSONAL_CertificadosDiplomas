const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');

/* Inicializamos la imagen */
const image = new Image();
/* Ruta de la Imagen */
image.src = '../../public/certificado.png';

$(document).ready(function(){
    var curd_id = getUrlParameter('curd_id');

    $.post("../../controller/usuario.php?op=mostrar_curso_detalle", { curd_id : curd_id }, function (data) {
        data = JSON.parse(data);
        $('#cur_descrip').html(data.cur_descrip);

        /* Dimensionamos y seleccionamos imagen */
        ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
        /* Definimos tamaño de la fuente */
        ctx.font = '40px Arial';
        ctx.textAlign = "center";
        ctx.textBaseline = 'middle';
        var x = canvas.width / 2;
        ctx.fillText(data.usu_nom+' '+ data.usu_apep+' '+data.usu_apem, x, 250);

        ctx.font = '30px Arial';
        ctx.fillText(data.cur_nom, x, 320);

        ctx.font = '18px Arial';
        ctx.fillText(data.inst_nom+' '+ data.inst_apep+' '+data.inst_apem, x, 420);
        ctx.font = '15px Arial';
        ctx.fillText('Instructor', x, 450);

        ctx.font = '15px Arial';
        ctx.fillText('Fecha de Inicio : '+data.cur_fechini+' / '+'Fecha de Finalización : '+data.cur_fechfin+'', x, 490);

    });

});

$(document).on("click","#btnpng", function(){
    let lblpng = document.createElement('a');
    lblpng.download = "Certificado.png";
    lblpng.href = canvas.toDataURL();
    lblpng.click();
});

$(document).on("click","#btnpdf", function(){
    var imgData = canvas.toDataURL('image/png');
    var doc = new jsPDF('l', 'mm');
    doc.addImage(imgData, 'PNG', 30, 15);
    doc.save('Certificado.pdf');
});

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};
