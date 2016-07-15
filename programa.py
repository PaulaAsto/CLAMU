from bottle import route, default_app, template, run, static_file, error
from lxml import etree
import grabarAudio
import reproducirAudio

@route('/') # Ruta de inicio del programa, pagina de presentacion
def index():
    return template("index.tpl")

@route('/grabar') # Ruta de grabacion del sonido
def grabarA():
	grabarAudio.grabar() # Funcion en python de grabacion de sonido

@route('/reproducir') # Reproducir la grabacion
def reproducirA():
	reproducirAudio.reproducir() # Funcion en python de reproduccion de sonido

@route('/static/<filepath:path>') # Interaccion de las paginas con los styles, imagenes, etc.
def server_static(filepath):
    return static_file(filepath, root='static')

@error(404) # Cuando ocurre algun error de direccionamiento a alguna pagina inexistente
def error404(error):
    return 'Nothing here, sorry'

run(host='0.0.0.0', port=8080) # Puerto donde va a realizar la escucha