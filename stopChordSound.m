function [ x ] = stopChordSound( chord, soundData )
%PLAYCHORDSOUND Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(soundData)
    if strcmp(chord, soundData{i,1}) == 1
        stop(soundData{i,4});
        x = 1;
    end
end
x=0;
end