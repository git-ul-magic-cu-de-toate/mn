%m = load('matrix.txt');
m = magic(3);

rows = sum(m, 2)
columns = sum(m, 1)
diag1 = sum(diag(m));
diag2 = sum(diag(flip(m, 2)));

if all(rows == diag1) && all(columns == diag1) && diag1 == diag2
    disp("magic")
else
    disp("not magic")
end
