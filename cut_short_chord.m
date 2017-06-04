function [result]=cut_short_chord(chord_table,cut_duration)

result=chord_table;
[len,~]=size(result);
line=1;
while(line<len)
    start_time=result{line,1};
    end_time=result{line,2};
    chord=result{line,3};
    duration=end_time-start_time;
    if duration<cut_duration & chord~='N'
        result{line-1,2}=end_time;
        result(line,:)=[];
    end
    line=line+1;
    [len,~]=size(result);
end

end