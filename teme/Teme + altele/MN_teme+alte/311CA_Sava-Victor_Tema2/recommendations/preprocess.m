function reduced_mat = preprocess(mat, min_reviews)
  [n, ~] = size(mat);

  i = 1;
  while i <= size(mat, 1)
    sum_i = sum(mat(i, :) != 0);

    if (sum_i < min_reviews)
      mat(i, :) = []; % Remove row i
    else
      i += 1; % Only increment if row is kept
    endif
  endwhile

  reduced_mat = mat;
end

