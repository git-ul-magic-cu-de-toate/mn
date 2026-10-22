function [L, U] = doolittle(A)
  [n, n] = size(A);
  L = eye(n);
  U = zeros(n);

  for p = [1: n]
    for i = [1: p]
      U(i, p) = A(i, p) - L(i, 1 : i) * U(1 : i, p);
    endfor
    for i = [p + 1 : n]
      L(i, p) = (A(i, p) - L(i, 1 : p) * U(1 : p, p)) / U(p, p);
    endfor
  endfor
endfunction
