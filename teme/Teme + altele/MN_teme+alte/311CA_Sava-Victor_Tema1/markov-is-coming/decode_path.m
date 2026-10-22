function [decoded_path] = decode_path (path, lines, cols)
  decoded_path = zeros(length(path) - 1, 2);
  path(end) = []; % remove last element of path
  % map out the line and col of the decoded path
  decoded_path(:, 1:2) = [floor((path - 1) / cols) + 1; mod((path - 1), cols) + 1]';
end

