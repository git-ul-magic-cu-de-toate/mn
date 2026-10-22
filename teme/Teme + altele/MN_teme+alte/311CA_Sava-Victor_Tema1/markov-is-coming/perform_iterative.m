function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
  % basic Jacobi method
  x = x0;
  i = 1;
  while i <= max_steps
    x_prev = x;
    x = G * x + c;
    err = norm(x - x_prev, 2);
    steps = i;

    if err < tol
      break;
    endif

    i = i + 1;
  endwhile
end

