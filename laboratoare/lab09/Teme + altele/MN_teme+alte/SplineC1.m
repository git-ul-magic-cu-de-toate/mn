function yi = SplineC1(x, y, dy, xi)
  n = length(x);

  for i = 1 : (n - 1)
    if xi >= x(i) & xi <= x(i + 1) % daca xi e in intervalul [xi, xi+1]
      h = x(i + 1) - x(i); % calc lungimea intervalului
      t = (xi - x(i)) / h; % transformam in t dupa formula din lab

      % coeficientii (alte formule)
      ai = y(i);
      di = y(i + 1);
      bi = y(i) + h * dy(i) / 3;
      ci = y(i+1) - h * dy(i + 1) / 3;

      % functia spline
      s = ai * (1 - t) ^ 3 + 3 * bi * t * ((1 - t) ^ 2) + 3 * ci * (t ^ 2) * (1 - t) + di * (t ^ 3);

      yi = s;
      return;
    endif
  endfor
endfunction

