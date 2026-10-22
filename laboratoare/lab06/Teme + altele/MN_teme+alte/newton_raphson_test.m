f = @(x) x * x - 3;
df = @(x) 2 * x;
max_iter = 100;
tol = 0.001;
x0 = 1;

x = newton_raphson(f, df, x0, max_iter, tol);

disp(x)

