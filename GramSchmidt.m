function B = GramSchmidt(A)
%initializari

[N,M] = size(A);
Q = zeros(N,N);
R = zeros(M,M);
I = zeros(N,N);
x = zeros(N,0);
B = [];
%fac matricea unitate
 for i=1:N
  I(i,i) = 1;
 endfor
 
 for i=1:M
	Q(:,i) = A(:,i);
	for j=1:i-1
		R(j,i) = Q(:,j)' * Q(:,i);
        Q(:,i) = Q(:,i) - R(j,i)*Q(:,j);
	endfor
	%normez fiecare vector
	R(i,i) = norm(Q(:,i))';
	Q(:,i) = Q(:,i)/R(i,i);

 endfor

  %pentru a afla x apelez functia SST()
  %SST() intoarce rezultatul unui sistem superior triunghiular
  for t=1:N
    x = SST(R,Q' * I(:,t));
 	%concatenez vectorii rezultati la matricea B
 	%B reprezinta inversa
    B = [B x];
  endfor
endfunction

