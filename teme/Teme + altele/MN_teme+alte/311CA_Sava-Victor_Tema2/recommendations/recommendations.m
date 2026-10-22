function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  # load matrix
  mat = read_mat(path);

  # preprocess
  reduced_mat = preprocess(mat, min_reviews);

  # compute reduced SVD with given number of features
  [u, s, v] = svds(reduced_mat, num_features);

  # get liked theme vector
  liked_vector = v(liked_theme, :);

  # compute cosine similarities
  n = size(v, 1);
  similarities = zeros(n, 1);

  for i = 1 : n
    similarities(i) = cosine_similarity(v(i, :), liked_vector);
  endfor

  # sort themes in descending order and exclude liked_theme
  [~, sorted_idx] = sort(similarities, 'descend');
  recoms = sorted_idx(2 : num_recoms + 1);
  recoms = recoms';
end

