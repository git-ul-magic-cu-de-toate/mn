function [x] = newton_raphson(f, df, x0, max_iter, tol)
  i = 1;
  x = x0;

  while i <= max_iter
    x_prev = x;
    x = x - f(x) / df(x);

    if abs(x - x_prev) < tol
      break;
    endif
  endwhile

  i = i + 1;
endfunction

