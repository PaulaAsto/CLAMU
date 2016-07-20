from bottle import route, default_app, template, run, static_file, error
from bottle import SimpleTemplate
from lxml import etree
from neat import nn
import pickle
from audioClass import Audio
import feature
import common


@route('/') # Ruta de inicio del programa, pagina de presentacion
def index():
    return template("index.tpl", mostrar=False)

@route('/reproducir') # Reproducir la grabacion
def reproducirA():
	reproducirAudio.reproducir() # Funcion en python de reproduccion de sonido


@route('/clasificar') # Reproducir la grabacion
def clasificar():
    a = Audio('output.wav', nro_texture_windows=2584, hopsize=256)
    dict = feature.getFeatureVector(a, 512, 256, 86)

    arr = common.featureDictToArray(dict)

    winner = pickle.load(open('neuralNetwork.p', 'r'))
    winner_net = nn.create_feed_forward_phenotype(winner)
    output = winner_net.serial_activate(arr)

    print output
    return template("index.tpl", mostrar=True, metal=output[0],
                    clasica=output[1], pop=output[2], hiphop=output[3])


@route('/static/<filepath:path>') # Interaccion de las paginas con los styles, imagenes, etc.
def server_static(filepath):
    return static_file(filepath, root='static')

@error(404) # Cuando ocurre algun error de direccionamiento a alguna pagina inexistente
def error404(error):
    return 'Nothing here, sorry'

run(host='0.0.0.0', port=8080) # Puerto donde va a realizar la escucha
