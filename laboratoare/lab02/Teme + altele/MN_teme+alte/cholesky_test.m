A = [4 2 1; 2 6 -2; 1 -2 5];

L = cholesky(A);

disp(L)

disp (L * L')
