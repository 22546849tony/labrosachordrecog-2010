function [ x ] = playChordSound( chord, soundData,volume )
%PLAYCHORDSOUND Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(soundData)
    if strcmp(chord, soundData{i,1}) == 1
        %play(soundData{i,4});
        sound(soundData{i,2}*volume, soundData{i,3});
        x = 1;
    end
end
x=0;
end
