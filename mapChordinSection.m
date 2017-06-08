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
for line=1:len
   chord_in_section={};
   chord_duration = section_duration/cps;
   
   sec_start_time = section_duration * (cur_section-1) ;
   sec_end_time = section_duration * (cur_section);
   chord_start_time = chord_table{line,1};
   chord_end_time = chord_table{line,2};
   chord = chord_table{line,3};
   while chord_end_time>sec_start_time
       chord_in_section=[chord_in_section,chord];
       chord_start_time = chord_table{line,1};
       chord_end_time = chord_table{line,2};
       chord = chord_table{line,3};
       if chord_start_time>sec_end_time
           break;
       end
       line=line+1;
   end
   
   if cps==1
      chord=mostchords(chord_in_section);
      sections{cur_section,1}=chord;
      sections{cur_section,2}=chord;
      sections{cur_section,3}=chord;
      sections{cur_section,4}=chord;
   end
   
   cur_chord_num=mod(cur_chord_num+1,cps);
   cur_section=cur_section+1;
end

end