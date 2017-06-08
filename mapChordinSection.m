function sections=mapChordinSection(chord_table,bpm,bps,cps)
% chord_table :chord and time imformation
% bpm : beat per minute
% cps : chord per section, ex:1,2 or 4
% bps : beat per section,defaut=4

if nargin < 2
    bpm=120;
end

if nargin < 3
   bps=4;
   
end

if nargin < 4
   cps=1; 
end


[len,~]=size(chord_table);
beat_duration = 1/bpm*60;
section_duration = beat_duration * bps;
sections={};
cur_section=1;
cur_chord_num=1;
disp(['beat_duration=',num2str(beat_duration),'   section_duration=',num2str(section_duration)]);
line=1;
while line<len
   
   chord_duration = section_duration/cps;
   for cur_chord_num=1:cps
       chord_in_section={};
       sec_start_time = section_duration * (cur_section-1) + (cur_chord_num-1)*chord_duration ;
       sec_end_time = section_duration * (cur_section-1) + (cur_chord_num)*chord_duration ;
       chord_start_time = chord_table{line,1};
       chord_end_time = chord_table{line,2};
       chord = chord_table{line,3};
       while chord_end_time>=sec_start_time
           chord_in_section=[chord_in_section,chord];
           if chord_end_time<sec_end_time
                line=line+1;
           end
           if line>len
               break
           end
           chord_start_time = chord_table{line,1};
           chord_end_time = chord_table{line,2};
           chord = chord_table{line,3};
           if chord_end_time>sec_end_time 
               break;
           end
       end
       chord=mostchords(chord_in_section);
       disp(['start_time:',num2str(sec_start_time),'  end_time:',num2str(sec_end_time),' ,chord:',chord]);
       divide=4/cps;
       for i=1:divide
           sections{cur_section,(cur_chord_num-1)*divide+i}=chord;
       end
   end

   cur_section=cur_section+1;
end

end
