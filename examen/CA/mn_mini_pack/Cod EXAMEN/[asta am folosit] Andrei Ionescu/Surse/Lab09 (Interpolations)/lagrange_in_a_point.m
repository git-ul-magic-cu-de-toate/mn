function [value] = lagrange_in_a_point(x, y, a)
  % x, y vectori de lungime n, suportul interpolarii
  % a, punctul in care trebuie calculat functia
  n = length(x);
  V = a * (ones(n) - eye(n)) - diag(x) * (ones(n) - eye(n)) + eye(n);
  U = diag(x) * ones(n) - ones(n) * diag(x) + eye(n);
  value = sum(prod(V) ./ prod(U) .* y); 
endfunction
