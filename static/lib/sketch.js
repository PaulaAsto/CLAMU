var mic, recorder, soundFile;

function setup() {
  //createCanvas(400,400);
  //background(200);
  //fill(0);
  //text('Enable mic and click the mouse to begin recording', 20, 20);

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
  saveSound(soundFile, 'mySound.wav');
}

function funcionAudio() {
    recorder.record(soundFile);
    setTimeout('detener()',10000);
}