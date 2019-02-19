function [x] = SST(A, b)
    

    n = length(b);
    x = zeros(n, 1);

    % calculam x(n)
    x(n) = b(n) / A(n, n);

    % calculam x(i)
    for i = (n - 1): -1 : 1
        suma = A(i, (i + 1) : n) * x((i + 1) : n, 1);
        x(i) = (b(i) - suma) / A(i, i);
    endfor
endfunction