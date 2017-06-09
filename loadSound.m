
chordsName = {'N',...
    'C', 'Cm', 'C#', 'C#m',...
    'D', 'Dm', 'D#', 'D#m',...
    'E', 'Em', ...
    'F', 'Fm', 'F#', 'F#m',...
    'G', 'Gm', 'G#', 'G#m',...
    'A' ,'Am' ,'A#' ,'A#m',...
    'B', 'Bm'};
dir = 'ChordsSound';

for i=1:length(chordsName)
    path = [dir,'/',chordsName{i},'.mp3'];
    soundData{i,1} = chordsName{i};
    [soundData{i,2} soundData{i,3}] = audioread(path); 
    
    if strcmp(chordsName{i}, 'N') ~= 1
        tmp = soundData{i,2}(:,1);
        tmp2 = soundData{i,2}(:,2);
        soundData{i,2} = [];
        soundData{i,2}(:,1) = tmp(tmp~=0 & tmp2~=0);
        soundData{i,2}(:,2) = tmp2(tmp~=0 & tmp2~=0);
    end
end

chordsName = {'N',...
    'C:maj', 'C:min', 'C#:maj', 'C#:min',...
    'D:maj', 'D:min', 'D#:maj', 'D#:min',...
    'E:maj', 'E:min', ...
    'F:maj', 'F:min', 'F#:maj', 'F#:min',...
    'G:maj', 'G:min', 'G#:maj', 'G#:min',...
    'A:maj' ,'A:min' ,'A#:maj' ,'A#:min',...
    'B:maj', 'B:min'};

for i=1:length(chordsName)
    soundData{i,1} = chordsName{i}; 
end

