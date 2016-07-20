<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>{{title}}</title>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
  <link rel="stylesheet" type="text/css" href="/static/style/style.css" />

  <script language="javascript" type="text/javascript" src="/static/lib/p5.js"></script>
  <script language="javascript" type="text/javascript" src="/static/lib/p5.dom.js"></script>
  <script language="javascript" type="text/javascript" src="/static/lib/p5.sound.js"></script>
  <SCRIPT language="javascript" type="text/javascript" src="/static/lib/sketch.js"></script>
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
          <br> <a href="#" class="button button-alt" onClick="funcionAudio()">GRABAR</a>
          <!--<a href="/grabar" onClick="funcionAudio()" class="button button-alt">GRABAR</a>-->
        </div>
        <div class="boxB">
          <span class="fa fa-cogs"></span>
          <p>REPRODUCIR MUSICA</p>
          <br><img src="/static/images/play.png">
          <br><a href="/reproducir" onClick="" class="button button-alt">REPRODUCIR</a>
        </div>
        <div class="boxC">
          <span class="fa fa-wrench"></span>
          <p> CLASIFICAR MUSICA</p>
          <img src="/static/images/clasif.png">
          <br><a href="/clasificar" class="button button-alt">CLASIFICAR</a>
        </div>

      </div>
      <br>
      <br>
      <center>
          <form method="post" action="/subir" enctype="multipart/form-data">
              Examinar &hellip; <input type="file" name="archivo">
              <button type="submit">Subir archivo</button>
          </form>
      </center>
    </div>
  </div>
</body>
</html>
