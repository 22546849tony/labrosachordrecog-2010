%  system('results/filename.bat')

 cut_duration = 0.3;
 musicDir = 'scratch/testpool';
 resultsDir = 'results';
 targetDir = 'newResults';
 if ~fexist(targetDir)
    mkdir(targetDir);+
 end
 list=dir('results/*.txt');
 for i = 1:length(list)
     filename=list(i).name;
     chordtable = readChordtxt([resultsDir,'/',filename]);
     
     %% cut short time chord
     
     newResult = cut_short_chord(chordtable, cut_duration);
     fullname = [musicDir , '/' ,strrep(filename ,'.txt','-100.mat') ];
     if fexist(fullname)
        music = load(fullname);
        bpm = music.bpm;
     else
         disp(['file: ',ofname,'   not exist - skipping']);
         continue;
     end
     segmentCut = length(chordtable) - length(newResult);
     disp(['Cut ',num2str(segmentCut),' segments in ',resultsDir,'/',list(i).name ,'  , bpm=',num2str(bpm)]);
   
     %% map chord to section
     
     
     
     %% save new chord
     
     writeChordtxt(newResult,[targetDir,'/',list(i).name]);
     
 end
 
