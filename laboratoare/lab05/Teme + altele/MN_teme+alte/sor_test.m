A = [10 -5 1; 1 4 3; 4 -3 -9];
b = [1; 4; 6];
max_iter = 10000;
tol = 0.00001;

min_iter = max_iter;
for w = [0.01 : 0.01 : 1.99]
  [x, nr_iter] = sor(A, b, max_iter, tol, w);

  if (nr_iter < min_iter)
    min_iter = nr_iter;
    min_w = w;
  endif
endfor

disp(min_iter)
disp(min_w)

