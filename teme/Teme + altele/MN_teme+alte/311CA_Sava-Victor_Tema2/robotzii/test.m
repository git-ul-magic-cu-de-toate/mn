filepath = "../checker/input/task_2/input1.txt";
[x, y] = parse_data(filepath);

coef = spline_c2(x, y);
coef;

x_interp = linspace(min(x), max(x), 100)';
y_interp = interp1(x, y, x_interp, 'spline');

% plot_spline(x, y, 100);
x;
y;
coef = vandermonde(x, y);
coef

plot_vandermonde(x, y, 100);

