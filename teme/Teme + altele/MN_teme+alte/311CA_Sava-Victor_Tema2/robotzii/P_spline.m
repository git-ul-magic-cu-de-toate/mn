function y_interp = P_spline(coef, x, x_interp)
	% TODO: Calculate y_interp using the Spline coefficients
  y_interp = zeros(size(x_interp, 1), 1);

  for i = 1 : size(x_interp, 1)
    xi = x_interp(i);

    % Find k for interval [xk, x_k+1], where xi belongs
    k = 1;
    while k < size(x, 1) && x(k + 1) <= xi
      k = k + 1;
    end

    % Out of bounds check
    if k == size(x, 1)
      k -= 1;
    end

    % Get coeffs
    ai = coef(4 * (k - 1) + 1);
    bi = coef(4 * (k - 1) + 2);
    ci = coef(4 * (k - 1) + 3);
    di = coef(4 * (k - 1) + 4);

    % p - substitute for xi - xk
    p = xi - x(k);

    % Compute y_interp(i)
    y_interp(i) = ai + bi * p + ci * p ^ 2 + di * p ^ 3;
  end
end

