function [Adj] = get_adjacency_matrix (Labyrinth)
  [m, n] = size(Labyrinth);
  matrix_size = m * n + 2;

  Adj = sparse(matrix_size, matrix_size);

  for i = 1 : m
    for j = 1 : n
      % transform the number to binary and store in a vector of size 4
      bin = dec2bin(Labyrinth(i, j), 4);
      node = (i - 1) * n + j; % stores the node idx

      % North wall
      if (bin(1) == '0')
        if (i == 1)
          Adj(node, matrix_size - 1) = 1;
        else
          Adj(node, node - n) = 1;
        endif
      endif

      % South wall
      if (bin(2) == '0')
        if (i == m)
          Adj(node, matrix_size - 1) = 1;
        else
          Adj(node, node + n) = 1;
        endif
      endif

      % East wall
      if (bin(3) == '0')
        if (j == n)
          Adj(node, matrix_size) = 1;
        else
          Adj(node, node + 1) = 1;
        endif
      endif

      % West wall
      if (bin(4) == '0')
        if (j == 1)
          Adj(node, matrix_size) = 1;
        else
          Adj(node, node - 1) = 1;
        endif
      endif
    endfor
  endfor

  % Set WIN and LOSE positions in Adj matrix
  Adj(matrix_size - 1, matrix_size - 1) = 1;
  Adj(matrix_size, matrix_size) = 1;
end

