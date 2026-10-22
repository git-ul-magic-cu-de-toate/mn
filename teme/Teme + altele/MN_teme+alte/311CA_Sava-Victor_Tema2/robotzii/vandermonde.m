function coef = vandermonde(x, y)
  % TODO: Calculate the Vandermonde coefficients
  A = vander(x); % :)
  A = fliplr(A);
  b = y;

  coef = A \ b;
endfunction

