f = @(x, y) y * sin(x) - 1;
y = runge_kutta(0, 3, 10, 0.5, f)

