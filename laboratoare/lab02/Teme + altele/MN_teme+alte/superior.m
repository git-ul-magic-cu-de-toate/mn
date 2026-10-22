function [x] = superior(A, b)
  [n, n] = size(A);

  for i = [n: -1 : 1]
    S = 0;

    for j = [i + 1: n]
      S = S + A(i, j) * x(j);
    endfor

    x(i, 1) = (b(i, 1) - S) / A(i, i);
  endfor
endfunction
