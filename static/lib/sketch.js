var mic, recorder, soundFile, song;

function setup() {
  // create an audio in
  mic = new p5.AudioIn();

  // users must manually enable their browser microphone for recording to work properly!
  mic.start();

  // create a sound recorder
  recorder = new p5.SoundRecorder();

  // connect the mic to the recorder
  recorder.setInput(mic);

  // create an empty sound file that we will use to playback the recording
  soundFile = new p5.SoundFile();
}

function detener(){
  recorder.stop();
  saveSound(soundFile, 'output.wav');
}

function funcionAudio() {
  recorder.record(soundFile);
  alert("Grabando audio. Espere 30 segundos.");
  setTimeout('detener()',10000);
}

function funcionReproducir(){
  song = loadSound('/static/output.wav');
  alert("Reproduciendo audio. Espere 30 segundos.");
  song.play();
}