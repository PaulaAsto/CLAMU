# CLAMU
Clasificador de música por generos musicales

Se necesita instalar bottle: miniframework para el desarrollo de aplicaciones web.

En la grabacion del audio se necesitara importar:
import pyaudio
import wave
import sys

En la reproduccion del audio grabado se necesitara importar:
import pyaudio
import wave

En el programa principal python:
from bottle import route, default_app, template, run, static_file, error
from lxml import etree
