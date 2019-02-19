function R = Iterative(nume, d, eps)

%citirea si initializari pentru vectori si matrice
   
   fileID = fopen(nume,'r');
   linie = fgetl(fileID);
   N = str2num(linie);
   A = zeros(N,N);
   pr_init = zeros(N,1);
   %L reprezinta vectorul de iesiri
   L = zeros(N,1);
   R = pr_init;

   %pentru fiecare linie
   for l=1:N
   	   %linia cu nodul si vecinii

   	   linie = fgetl(fileID);
   	   %impart in tokeni
   	   %token este primul nod

   	   [token,rest] = strtok(linie);
   	   i = str2num(token);

   	   %la primul pas avem probabilitate egala
   	   pr_init(i) = 1/N;

   	   %token va fi numarul de iesiri ale lui i
   	   [token,rest] = strtok(rest);
   	   nr_out = str2num(token);

   	   %acum pagina i are nr_out iesiri catre alte pagini
   	   L(i) = nr_out;

   	   for k=1:nr_out
   	   	   [token,rest] = strtok(rest);
   	   	   j = str2num(token);

   	   	   if i ~= j
   	   	   	  %creez matricea de adiacenta
   	   	   	  A(i,j) = 1;
   	   	   else
   	   	      L(i) = L(i) - 1;
   	   	    endif
   	   	endfor
   	endfor
   	
   	%pana aici a fost citirea
   	%in continuare, voi implementa algoritmul indicat de cerinta

   	while 1

   	   suma = zeros(N,1);

   	   for i=1:N 
   	      for j=1:N
   	      	%verific daca este link intre cele 2 pagini

   	         if A(j,i) == 1

   	           %creez sumele pentru fiecare pagina
   	           suma(i) = suma(i) + pr_init(j)/L(j);
   	         endif
   	       endfor
           %fac vectorul de pagerank pentru fiecare pagina

   	       R(i) = (1-d)/N + d*suma(i);
   	   endfor

   	       %conditia de oprire
           %daca am ajuns la acuratetea dorita ne oprim
   	       if norm(R - pr_init) < eps
   	            break;
   	       endif
   	        
   	     pr_init = R;

   	endwhile
   	fclose(fileID);
endfunction   	                   	      	  