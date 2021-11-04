const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');

/* Inicializamos la imagen */
const image = new Image();
const imageqr = new Image();

$(document).ready(function(){
    var curd_id = getUrlParameter('curd_id');

    $.post("../../controller/usuario.php?op=mostrar_curso_detalle", { curd_id : curd_id }, function (data) {
        data = JSON.parse(data);

        /* Ruta de la Imagen */
        image.src = data.cur_img;
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

        /* Ruta de la Imagen */
        imageqr.src = "../../public/qr/"+curd_id+".png";
        /* Dimensionamos y seleccionamos imagen */
        ctx.drawImage(imageqr, 400, 500, 100, 100);

        $('#cur_descrip').html(data.cur_descrip);
    });

});

/* Recarga por defecto solo 1 vez */
window.onload = function() {
    if(!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
}

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
