function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % use the linear regression cost function to get the error
  linear_regression_err = linear_regression_cost_function(Theta, Y, FeatureMatrix);

  Error = 2 * linear_regression_err + lambda * sum(abs(Theta));
end
