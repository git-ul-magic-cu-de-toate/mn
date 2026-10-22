function [Y, InitialMatrix] = parse_csv_file(file_path)
  % read the Y vector (can do with csvread because it's double)
  x = csvread(file_path);
  Y = x(2 : end, 1);

  [m, n] = size(x);

  fid = fopen(file_path, 'r');

  for i = 1 : m
    % read each line of the file and save in tmpMatrix
    % tmpMatrix will be a column vector of size m
    % and each vector will have another n elements
    tmpMatrix(i, :) = textscan(fid, '%s', n, 'Delimiter', ',');
  endfor

  % subtract 1 from row and cols because the 1st row and column will be deleted
  m -= 1;
  n -= 1;

  tmpMatrix(1, :) = []; % eliminate the headers

  for i = 1 : m
    tmpMatrix{i}(1) = []; % eliminate first element of each cell vector
  endfor

  InitialMatrix = cell(m, n);
  % transform tmpMatrix to a column vector with m * n rows
  tmpMatrix = cell2mat(tmpMatrix);
  % reshape tmpMatrix to fit the task
  InitialMatrix = reshape(tmpMatrix, n, m)';

  fclose(fid);
end
