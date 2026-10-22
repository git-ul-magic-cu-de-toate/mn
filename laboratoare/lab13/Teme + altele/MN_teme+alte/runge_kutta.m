function y = runge_kutta(a, b, n, y0, f)
  h = (b - a) / n; % nr de diviziuni
  x = [a : h : b];
  y = zeros(n + 1, 1);
  y(1) = y0;

  for i = 1 : n
    xi1 = x(i) + h / 2;
    yi1 = y(i) + h / 2 * f(x(i), y(i));
    y(i + 1) = y(i) + h * f(xi1, yi1);
  endfor
endfunction

