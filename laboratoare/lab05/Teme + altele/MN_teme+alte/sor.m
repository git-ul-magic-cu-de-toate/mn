function [x, nr_iter] = sor(A, b, max_iter, tol, w)
  x = zeros(length(b), 1);

  for i = 1 : max_iter
    x_prev = x;

    for j = 1 : length(x)
      x(j) = (b(j) - A(j, 1 : (j - 1)) * x(1 : (j - 1)) - A(j, (j + 1) : length(b)) * x_prev((j + 1) : length(b))) / A(j, j);
    endfor

    x = w * x + (1 - w) * x_prev;

    if abs(x - x_prev) < tol
      nr_iter = i;
      break;
    endif
  endfor

  nr_iter = max_iter;
  if abs(x - x_prev) < tol
    nr_iter = i;
  endif

endfunction
