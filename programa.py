from bottle import route, template, run, static_file, error
from bottle import request
from neat import nn
import pickle
from audioClass import Audio
import feature
import common
import os
import subprocess


@route('/')  # Ruta de inicio del programa, pagina de presentacion
def index():
    return template("index.tpl", mostrar=False)


@route('/subir', method='POST')
def do_upload():
    upload = request.POST['archivo']
    name, ext = os.path.splitext(upload.filename)
    if ext not in ('.wav', '.mp3'):
        return 'Extension no permitida'
    upload.save('.')

    s = ['sox', upload.filename,
         '-c', '1',
         '-b', '16',
         '-r', '22050',
         name + '-convert.wav']
    subprocess.call(s)

    a = Audio(name + '-convert.wav', nro_texture_windows=2584, hopsize=256)
    dict = feature.getFeatureVector(a, 512, 256, 86)

    arr = common.featureDictToArray(dict)

    winner = pickle.load(open('redNeuronal.p', 'r'))
    winner_net = nn.create_feed_forward_phenotype(winner)
    output = winner_net.serial_activate(arr)

    print output
    return template("index.tpl", mostrar=True, metal=output[0],
                    clasica=output[1], pop=output[2], hiphop=output[3])


@route('/clasificar')  # Reproducir la grabacion
def clasificar():
    s = ['sox', 'static/output.wav',
         '-c', '1',
         '-b', '16',
         '-r', '22050',
         'output' + '-convert.wav']
    subprocess.call(s)

    a = Audio('output' + '-convert.wav', nro_texture_windows=2584, hopsize=256)
    dict = feature.getFeatureVector(a, 512, 256, 86)

    arr = common.featureDictToArray(dict)

    winner = pickle.load(open('redNeuronal.p', 'r'))
    winner_net = nn.create_feed_forward_phenotype(winner)
    output = winner_net.serial_activate(arr)

    print output
    return template("index.tpl", mostrar=True, metal=output[0],
                    clasica=output[1], pop=output[2], hiphop=output[3])


@route('/static/<filepath:path>')  # Archivos estaticos
def server_static(filepath):
    return static_file(filepath, root='static')


@error(404)  # Direccionamiento a alguna pagina inexistente
def error404(error):
    return 'Nothing here, sorry'


run(host='0.0.0.0', port=8080)  # Puerto donde va a realizar la escucha
