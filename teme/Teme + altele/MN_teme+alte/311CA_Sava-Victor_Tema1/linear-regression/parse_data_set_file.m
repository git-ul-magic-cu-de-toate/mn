function [Y, InitialMatrix] = parse_data_set_file(file_path)
  fid = fopen(file_path, 'r');

  m = fscanf(fid, '%d', 1);
  n = fscanf(fid, '%d', 1);
  InitialMatrix = cell(m, n);

  for i = 1 : m
    Y(i, 1) = fscanf(fid, '%d', 1);
    for j = 1 : n
      InitialMatrix{i, j} = fscanf(fid, '%s', 1);
    endfor
  endfor

  fclose(fid);
end
