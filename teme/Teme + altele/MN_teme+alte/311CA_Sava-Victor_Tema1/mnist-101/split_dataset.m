function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  m = size(X, 1);

  % randomly permute the indexes from 1 to m
  idx = randperm(m);

  % apply permutation to X and y
  X_rand = X(idx, :);
  y_rand = y(idx);

  train_cutoff = floor(m * percent);

  % split data into training and test vectors
  X_train = X_rand(1 : train_cutoff, :);
  X_test = X_rand(train_cutoff + 1 : end, :);

  % split data into training and test vectors
  y_train = y_rand(1 : train_cutoff);
  y_test = y_rand(train_cutoff + 1 : end);
end

