A = [1 2 3; 0 4 5; 0 0 6];
b = [1; 2; 3];

x = superior(A, b);
disp(x);

# Verificare
disp(A * x);
