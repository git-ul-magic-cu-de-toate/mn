function A = final2021(A)
  [n n] = size(A);

  for i = 1 : n - 3
    v = A(i + 2 : n, i);
    sigma = norm(A(i + 2 : n, i));
    if (A(i + 2, i) < 0)
      sigma = -sigma;
    endif
    v(1) = v(1) + sigma;

    P_curr = eye(n - i - 1) - 2 * v * v' / (v' * v);
    I = eye(i + 1);

    Pi = blkdiag(I, P_curr);

    A = Pi * A * Pi'
  endfor
endfunction
