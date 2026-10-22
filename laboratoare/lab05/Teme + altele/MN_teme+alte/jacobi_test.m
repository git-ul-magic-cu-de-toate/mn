A = [10 -5 1; 1 4 3; 4 -3 -9];
b = [1; 4; 6];
max_iter = 10000;
tol = 0.00001;

x = jacobi(A, b, max_iter, tol);
disp(x)
disp(A \ b)
