function coef = spline_c2 (x, y)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

  n = size(x, 1) - 1;       % no of intervals
                            % A * coef = b
  A = sparse(4 * n, 4 * n);  % matrix for coeffs of the described equations
  b = sparse(4 * n, 1);      % vector of free variables
  row = 1;                  % row iterator

	% TODO 1: si(xi) = yi, i = 0 : n - 1
  %         ai = yi , i = 0 : n - 1
  for i = 1 : n
    A(row, 4 * (i - 1) + 1) = 1;
    b(row) = y(i);

    row += 1;
  end

	% TODO 2: s_n-1(xn) = yn
  % p = xn - x_n-1
  % a_n-1 + b_n-1 * p + c_n-1 * p ^ 2 + d_n-1 * p ^ 3 = yn
  p = x(n + 1) - x(n);              % p = xn - x_n-1
  A(row, 4 * (n - 1) + 1) = 1;      % a_n-1
  A(row, 4 * (n - 1) + 2) = p;      % b_n-1
  A(row, 4 * (n - 1) + 3) = p ^ 2;  % c_n-1
  A(row, 4 * (n - 1) + 4) = p ^ 3;  % d_n-1
  b(row) = y(n + 1);
  row += 1;

  % TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
  % pi = x_i+1 - xi
  % 3: ai + bi * pi + ci * pi ^ 2 + di * pi ^ 3 = a_i+1
  % 4: bi + 2 * ci * pi + 3 * di * pi ^ 2 = b_i+1
  % 5: 2 * ci + 6 * di * pi = 2 * c_i+1
  for i = 1 : n - 1
    pi = x(i + 1) - x(i);

    % TODO 3
    A(row, 4 * (i - 1) + 1) = 1;      % ai
    A(row, 4 * (i - 1) + 2) = pi;     % bi
    A(row, 4 * (i - 1) + 3) = pi ^ 2; % ci
    A(row, 4 * (i - 1) + 4) = pi ^ 3; % di
    A(row, 4 * i + 1) = -1;           % -a_i+1
    b(row) = 0;
    row += 1;

    % TODO 4
    A(row, 4 * (i - 1) + 2) = 1;          % bi
    A(row, 4 * (i - 1) + 3) = 2 * pi;     % ci
    A(row, 4 * (i - 1) + 4) = 3 * pi ^ 2; % di
    A(row, 4 * i + 2) = -1;               % -b_i+1
    b(row) = 0;
    row += 1;

    % TODO 5
    A(row, 4 * (i - 1) + 3) = 2;      % 2 * ci
    A(row, 4 * (i - 1) + 4) = 6 * pi; % 6 * di
    A(row, 4 * i + 3) = -2;           % -2 * c_i+1
    b(row) = 0;
    row += 1;
  end

	% TODO 6: s0''(x0) = 0
  % 2 * c0 = 0
  A(row, 3) = 2;  % 2 * c0
  b(row) = 0;
  row += 1;

	% TODO 7: s_n-1''(x_n) = 0
  % p = xn - x_n-1
  % 2 * c_n-1 + 6 * d_n-1 * p = 0
  p = x(n + 1) - x(n);
  A(row, 4 * (n - 1) + 3) = 2;      % 2 * c_n-1
  A(row, 4 * (n - 1) + 4) = 6 * p;  % 6 * d_n-1
  b(row) = 0;

	% Solve the system of equations
  coef = A \ b;
end

