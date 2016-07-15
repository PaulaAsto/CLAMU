<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>{{title}}</title>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
  <link rel="stylesheet" type="text/css" href="/static/style/style.css" />
  <SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
  function popitup(url)
  { 
    newwindow=window.open(url,'name','height=200,width=600'); 
    if (window.focus) {newwindow.focus()}
    return false;
  }
  function empezar() {
    if (marcha==30) { //solo si el cronómetro esta parado
      emp=new Date() //fecha actual
      elcrono=setInterval(tiempo,10); //función del temporizador.
      marcha=1 //indicamos que se ha puesto en marcha.
      }
    }
  </SCRIPT>
</head>

<body>
  <div id="main">
    <div id="header">
      <div id="logo">
        <h1> <center>
          <div id="caja1"><img src="/static/images/clamu.png"></div>
          <div id="caja2"><span class="alternate_colour"> CLASIFICADOR DE MUSICA </span></div>
        </center></h1>
      </div>
    </div>
    <div id="wrapper">
      <div id="three-column" class="container">
        <div class="boxA">
          <span class="fa fa-cloud-download"></span>
          <p>GRABAR MUSICA</p>
          <img src="/static/images/grabar.png">
          <br><a href="#" onClick="return popitup('grabar')" class="button button-alt">GRABAR</a>
        </div>
        <div class="boxB">
          <span class="fa fa-cogs"></span>
          <p>REPRODUCIR MUSICA</p>
          <br><img src="/static/images/play.png">
          <br><a href="#" onClick="return popitup('reproducir')" class="button button-alt">REPRODUCIR</a>
        </div>
        <div class="boxC">
          <span class="fa fa-wrench"></span>
          <p> CLASIFICAR MUSICA</p>
          <img src="/static/images/clasif.png">
          <br><a href="#" class="button button-alt">CLASIFICAR</a>
          <!-- <br><br><br><label>Genero <input type="text" id="genero" name="genero" /></label> -->
        </div>
      </div>
    </div>
  </div>
</body>
</html>