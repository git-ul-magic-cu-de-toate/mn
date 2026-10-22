function [x, y] = parse_data(filename)
  % TODO 1: Open the file for reading
  fid = fopen(filename, "r");

  % TODO 2: Read n, x, y from the file
  n = fscanf(fid, '%d', 1);

  x = fscanf(fid, '%d', n + 1);
  y = fscanf(fid, '%d', n + 1);

  % TODO 3: Close the file
  fclose(fid);
end

