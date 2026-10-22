A = [1 0 0; 2 3 0; 4 5 6];
b = [1; 2; 3];

x = inferior(A, b);
disp(x)

# Verificare
disp(A * x)
