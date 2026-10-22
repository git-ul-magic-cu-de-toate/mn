function y_interp = P_vandermonde (coef, x_interp)
	% TODO: Calculate y_interp using the Vandermonde coefficients
  y_interp = zeros(size(x_interp, 1), 1);

  for i = 1 : size(x_interp, 1)
    xi = x_interp(i);

    for j = 0 : size(coef, 1) - 1
      y_interp(i) += coef(j+1) * xi ^ j;
    endfor
  endfor
end

