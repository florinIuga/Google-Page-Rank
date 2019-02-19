function R = Algebraic(nume,d)

%citirea si initializari

   fileID = fopen(nume,'r');
   linie = fgetl(fileID);
   N = str2num(linie);
   A = zeros(N,N);
   M = zeros(N,N);
   L = zeros(N,1);
   I = zeros(N,N); %pt matricea unitate
   D = zeros(N,N);
   U = ones(N,1);
   D_INV = zeros(N,N);

   for i=1:N
   	 I(i,i) = 1; %facem matricea unitate
   endfor

    for l=1:N %pentru fiecare linie

	    linie = fgetl(fileID); %linia cu nodul plus vecinii
	    [token,rest] = strtok(linie); %token este primul nod
	    i = str2num(token);
	    
	    [token,rest] = strtok(rest); %token va fi numarul de iesiri ale lui i
	    nr_out = str2num(token);
	    L(i) = nr_out; %nodul i are nr_out iesiri(adica linkuri catre alte pagini/noduri)

	    for k=1:nr_out
		   
       [token,rest] =  strtok(rest); %iesirile lui i
		   j = str2num(token);
        if i~=j
		      A(i,j) = 1;
        else
          L(i) = L(i) - 1;
       endif

	    endfor
    endfor	

    %sfarsit citirea
    %implementez algoritmul indicat de cerinta

    for i=1:N
    	for j=1:N
        %daca exista link de la pagina j la pagina i
    		if A(j,i) == 1
    			M(i,j) = 1/L(j);
    		else
    			M(i,j) = 0;
    		endif
    	endfor
    endfor

  	D = I - d*M;
    %pentru calcularea inversei folosesc GramSchmidt modificat
    %pentru a fi mai eficient
  	D_INV = GramSchmidt(D);
  	R = D_INV*((1-d)/N)*U;

    fclose(fileID);
endfunction

