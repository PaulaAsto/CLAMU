<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" class="js">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{title}}</title>

    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <script src="/static/lib/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/style/style.css">
    <link rel="stylesheet" type="text/css" href="/static/style/normalize.css" />
    <link rel="stylesheet" type="text/css" href="/static/style/demo.css" />
    <link rel="stylesheet" type="text/css" href="/static/style/component.css" />
</head>

<body>
    <div id="main">
        <div id="header">
            <div id="logo">
                <h1> <center>
                    <div id="caja1"><img src="/static/images/clamu.png"></div>
                    <div id="caja2"><span class="alternate_colour"> CLASIFICADOR DE MÚSICA </span></div>
                </center></h1>
            </div>
        </div>
        <div id="wrapper">
            <center>
                <!--form method="post" action="/clasificar" enctype="multipart/form-data">
                Examinar &hellip; <input type="file" name="archivo">
                <button type="submit">Subir archivo</button>
            </form-->

            <div class="box">
                <input type="file" name="file-7[]" id="file-7" class="inputfile inputfile-6">
                <label for="file-7"><span></span> <strong><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> Seleccionar archivo&hellip;</strong></label>
                <br><a href="#" onclick="return enviar();" class="button button-alt" style="margin-bottom: 30px">CLASIFICAR</a>
                <br><br>
                <img id="loading-image" src="/static/images/loading.gif" alt="Cargando ..." style="width:150px">
                <table class="table" id="resultados">
                    <thead>
                        <tr>
                            <th>Metal</th>
                            <th>Clásica</th>
                            <th>Cumbia</th>
                            <th>Salsa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="metal"></td>
                            <td id="clasica"></td>
                            <td id="cumbia"></td>
                            <td id="salsa"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </center>
    </div>
</div>
<script src="/static/lib/custom-file-input.js"></script>
<script>
$('#loading-image').hide();
$('#resultados').hide();
function enviar(event){
    $('#loading-image').show();
    var data = new FormData();
    //event.preventDefault();
    jQuery.each(jQuery('#file-7')[0].files, function(i, file) {
        data.append('archivo', file);
    });

    jQuery.ajax({
        url: '/clasificar',
        data: data,
        cache: false,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
            var order = new Array();
            for(var i = 0; i < data.result.length; i++)
            {
                order.push(data.result[i]);
            }

            order.sort(function(a,b){
                return b.val - a.val
            });

            values = ["#009900", "#4dff4d", "#b3ffb3", "#e6ffe6"];

            for(var i = 0; i < order.length; i++)
            {
                console.log(values[i])
                switch(order[i].genre){
                    case 'metal':
                        $('#metal').css("background-color", values[i]);
                        break;
                    case 'clasica':
                        $('#clasica').css("background-color", values[i]);
                        break;
                    case 'cumbia':
                        $('#cumbia').css("background-color", values[i]);
                        break;
                    case 'salsa':
                        $('#salsa').css("background-color", values[i]);
                        break;
                }
            }
            $('#resultados').show();
        },
        complete: function(){
            $('#loading-image').hide();
        }
    });

    return false; //for good measure
};
</script>
</body>
</html>
