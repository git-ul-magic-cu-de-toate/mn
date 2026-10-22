function [x] = superior(A, b)
  [n, n] = size(A);

  for i = [1 : n]
    S = 0;

    for j = [1: i - 1]
      S = S + A(i, j) * x(j);
    endfor

    x(i, 1) = (b(i, 1) - S) / A(i, i);
  endfor
endfunction
