function [x] = jacobi(A, b, max_iter, tol)
  D = diag(diag(A));
  L = -tril(A, -1);
  U = -triu(A, 1);
  G = inv(D) * (L + U);
  c = inv(D) * b;
  x = zeros(length(b), 1);

  i = 1;
  while i <= max_iter
    x_prev = x;
    x = G * x + c;
    # hold on;
    # plot(x)
    if abs(x - x_prev) < tol
      break;
    endif
    i = i + 1;
  endwhile
  # hold off;
endfunction
