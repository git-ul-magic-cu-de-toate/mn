function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  [m, n] = size(FeatureMatrix);

  % sumsq - function that calculates the sum of the elements squared
  Error = sumsq(FeatureMatrix * Theta (2 : end) - Y) / (2 * m);
end
