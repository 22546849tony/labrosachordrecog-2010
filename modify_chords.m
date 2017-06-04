%  system('results/filename.bat')

 list=dir('results/*.txt');
 cut_duration = 0.3;
 
 resultsDir = 'results/';
 mkdir('newResults');
 for i = 1:length(list)
     A = readChordtxt([resultsDir,list(i).name]);
     newResult = cut_short_chord(A, cut_duration);
     segmentCut = length(A) - length(newResult);
     disp(['Cut ',num2str(segmentCut),' segments in ',resultsDir,list(i).name]);
     
     writeChordtxt(newResult,['newResults/',list(i).name]);
     
 end
 
