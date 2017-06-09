clear all;

  musicDir = 'scratch/4chords';
  chordsDir = 'results';
  targetDir = 'sections';
  
  filename3='Flo Rida - Whistle [Official Video]';
  
  bps=4;
  cps=1;
  
  [sections_chord,bpm]=modify_chords([filename3,'.txt'],musicDir,chordsDir,targetDir,bps,cps);
  audioPath = ['mp3s-32k/4chords/',filename3,'.mp3'];
  [y fs] = audioread(audioPath);
  sound(y,fs);

  playChords(sections_chord,bpm,bps,cps,3,3);
      
