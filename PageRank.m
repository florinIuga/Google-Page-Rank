function [R1 R2] = PageRank(nume, d, eps)

   fileID = fopen(nume,'r');
   %facem fisierul de output in care vom scrie
   outFile = strcat(nume,'.out');
   fileID2 = fopen(outFile,'w');
   
   linie = fgetl(fileID);
   N = str2num(linie);
   PR1 = zeros(N,1);
   F = zeros(N,1);
   pos_final = zeros(N,1);
   pos_init = zeros(N,1); %vector cu pozitiile initiale ale PageRank urilor
   %facem din nou citirea pentru a ajunge la ultimele 2 valori
   for l=1:N %pt fiecare linie

	    linie = fgetl(fileID); %linia cu nodul plus vecinii
	    [token,rest] = strtok(linie); %token este primul nod
	    i = str2num(token);
	    
	    [token,rest] = strtok(rest); %token va fi numarul de iesiri ale lui i
	    nr_out = str2num(token);
	    
	    for k=1:nr_out
		   [token,rest] =  strtok(rest); %iesirile lui i
		   j = str2num(token);
		   
	    endfor

    endfor	
    %citim valorile val1 si val2
    linie = fgetl(fileID);
    val1 = str2num(linie);
    linie = fgetl(fileID);
    val2 = str2num(linie);

    %sfarsit citirea
    fprintf(fileID2,'%d',N);
    fprintf(fileID2,'\n');
    R1 = Iterative(nume,d,eps);
    R2 = Algebraic(nume,d);
    
    fprintf(fileID2,'%f\n',R1);
	
    fprintf(fileID2,'\n');
    
    fprintf(fileID2,'%f\n', R2);
    fprintf(fileID2, '\n');

	for i=1:N
		pos_init(i) = i;
		
	endfor

  %vrem sa sortam vectorul, deci ne trebuie o copie pe care o vom afisa in output
	pos_final = pos_init; 
	PR1 = R2; %facem o copie pentru R2
    %sortam vectorul PR1
    t = 1;
    while t
    	t = 0;
    	for i=1:N-1
    		if PR1(i+1) > PR1(i)
    			temp = PR1(i);
    			temp2 = pos_final(i);
    			PR1(i) = PR1(i+1);
    			pos_final(i) = pos_final(i+1);
    			PR1(i+1) = temp;
    			pos_final(i+1) = temp2;
    			t = 1;
    		endif
    	endfor		
    endwhile

   for i=1:N
    	F(i) = Apartenenta(PR1(i),val1,val2);
   endfor

   %afisez in fisier in formatul dorit
   for i=1:N
    	fprintf(fileID2, "%d ",pos_init(i));
      fprintf(fileID2, "%d ",pos_final(i));
      fprintf(fileID2, "%f\n",F(i));
   endfor
      	
   
    fclose(fileID2);
endfunction