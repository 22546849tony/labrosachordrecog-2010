function playChords(sections,bpm,bps,cps,volume,offset)

% load sound & creat soundData{}
loadSound; 
[s1,s2]=size(sections);
len=s1*s2;
chords=reshape(sections,len,1);
beat_time=1/bpm*60;

tic
i = 1;
played = 0;
while i < len
    cur_section=floor((i-1)/s2 +1);
    cur_chord=mod(i-1,s2)+1;
    current_time = toc;
    start_time=(i-1)*beat_time+offset;
    end_time=(i-1+bps/cps)*beat_time+offset;
    chord=sections{cur_section,cur_chord};
    if current_time <  end_time
        if played == 0
            playChordSound(chord,soundData,volume);
            disp([num2str(start_time),' - ',num2str( end_time),' : ',chord...
%                 ,'   (',num2str(floor((i-1)/s2 +1)),'-',num2str(mod(i-1,s2)+1) ,')'...
                ]);
            played = 1;
        end
    else
        %stopChordSound(chord,soundData);
        %clear sound;
        i = i+bps/cps;
        played = 0;
    end
end
toc
    
end
    