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


@route('/clasificar', method='POST')
def do_upload():
    from bottle import response
    from json import dumps
    response.content_type = 'application/json'

    upload = request.POST['archivo']
    name, ext = os.path.splitext(upload.filename)
    if ext not in ('.wav', '.mp3'):
        return 'Extension no permitida'
    upload.save('.', overwrite=True)

    s = ['sox', upload.filename,
         '-c', '1',
         '-b', '16',
         '-r', '22050',
         'output.wav']
    subprocess.call(s)

    a = Audio('output.wav', nro_texture_windows=2584, hopsize=256)
    dict = feature.getFeatureVector(a, 512, 256, 86)

    arr = common.featureDictToArray(dict)

    winner = pickle.load(open('redNeuronal.p', 'r'))
    winner_net = nn.create_feed_forward_phenotype(winner)
    output = winner_net.serial_activate(arr)

    print output
    rv = {'result': [
            {'genre': 'metal', 'val': output[0]},
            {'genre': 'clasica', 'val': output[1]},
            {'genre': 'cumbia', 'val': output[2]},
            {'genre': 'salsa', 'val': output[3]}
    ]}
    return dumps(rv)


@route('/static/<filepath:path>')  # Archivos estaticos
def server_static(filepath):
    return static_file(filepath, root='static')


@error(404)  # Direccionamiento a alguna pagina inexistente
def error404(error):
    return 'No encontrado'


run(host='0.0.0.0', port=8080)  # Puerto donde va a realizar la escucha
