function [c] = determine_interpolation_polynome(m, y)
  i = sqrt(-1);

  for k = 1 : 2 * m
    polynome_sum(k) = 0;
    polynome_diff(k) = 0;

    for j = 1 : m
      polynome_sum(k) += y(2 * j - 1) * e ^ (i * (k - 1) * pi * (j - 1)) / (m / 2);
      polynome_diff(k) += y(2 * j) * e ^ (i * (k - 1) * pi * j) / (m / 2);
    endfor

    polynome_sum(k) *= 2;
    polynome_diff(k) *= 2 * e ^ (i * (k - 1) * pi / m);
  endfor

  for j = 1 : m
    c(j) = (polynome_sum(j) + polynome_diff(j)) / 2;
    c(j + m) = (polynome_sum(j) - polynome_diff(j)) / 2;
  endfor
endfunction

