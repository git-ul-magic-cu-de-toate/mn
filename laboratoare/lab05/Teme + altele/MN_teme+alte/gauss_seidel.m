function [x] = gauss_seidel(A, b, max_iter, tol)
  x = zeros(length(b), 1);

  for i = 1 : max_iter
    x_prev = x;

    for j = 1 : length(x)
      x(j) = (b(j) - A(j, 1 : (j - 1)) * x(1 : (j - 1)) - A(j, (j + 1) : length(b)) * x_prev((j + 1) : length(b))) / A(j, j);
      # hold on;
      # plot(x)
    endfor

    if abs(x - x_prev) < tol
      break;
    endif
  endfor
  # hold off;
endfunction
