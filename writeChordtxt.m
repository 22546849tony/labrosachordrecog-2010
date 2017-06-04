function writeChordtxt(chorddata,filename)

    f = fopen(filename, 'w');
     for j = 1:length(chorddata)
         msg = [num2str(chorddata{j,1}),' ',num2str(chorddata{j,2}),' ',chorddata{j,3},'\n'];
         fprintf(f,msg);
     end
     fclose(f);
end