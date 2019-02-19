function y = Apartenenta(x,val1,val2)

 %fac verificari in functie de x si calculez y
 %a si b au fost obtinute prin conditia de continuitate a functiei

  if x >= 0 && x < val1
	y = 0;
  elseif x >=val1 && x <=val2
	y = (1/(val2 - val1)) * x + val1/(val1-val2); 
  elseif x > val2 && x<= 1
	y = 1;
  endif	
  
endfunction  