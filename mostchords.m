function max_chord=mostchords(chords)
    [~,all]=size(chords);
    max_num=0;
    max_chord='N';
    while all>0
        sample = chords{1,1};
        num=0;
        cur=1;
        len = all;
        while cur<=len
            if strcmp(chords{1,cur},sample)==1
                num=num+1;
                chords(:,cur)=[];
            else
                cur=cur+1;
            end
            [~,len]=size(chords);
        end
        if num>max_num | strcmp(max_chord,'N')==1
            max_num=num;
            max_chord=sample;
        end
        [~,all]=size(chords);
    end
end