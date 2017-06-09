function [sections_chord,bpm]=modify_chords(filename,musicDir,chordsDir,targetDir,bps,cps)

 
 if ~fexist(targetDir)
    mkdir(targetDir);
 end
 
%% read text chord data
 path=[chordsDir,'/',filename];
 chord_table = readChordtxt(path);
 disp(['file:  ',path ]);
 %% cut short time chord
 fullname = [musicDir , '/' ,strrep(filename ,'.txt','-100.mat') ];
 if fexist(fullname)
    music = load(fullname);
    bpm = music.bpm;
 else
     disp(['.mat file: ',fullname,'   not exist - skipping']);
 end
 
 cut_coff=0.8;
 beat_time=1/bpm*60;
 cut_duration = cut_coff*beat_time;
 newResult = cut_short_chord(chord_table, cut_duration);
 
 
writeChordtxt(newResult,[targetDir,'/',filename]);

 %% map chord to section
 sections_chord = mapChordinSection(newResult,bpm,bps,cps);
 save([targetDir,'/',strrep(filename ,'.txt','.mat')],'sections_chord');
     
     
     
 
