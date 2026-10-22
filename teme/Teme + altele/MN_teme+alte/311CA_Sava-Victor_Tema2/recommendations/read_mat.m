function mat = read_mat(path)
  mat = csvread(path);
  mat = mat(2 : end, 2 : end);
end

