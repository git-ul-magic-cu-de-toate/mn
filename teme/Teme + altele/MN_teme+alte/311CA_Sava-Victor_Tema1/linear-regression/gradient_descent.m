function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % basic gradient descent
  Theta = zeros(n, 1);
  i = 1;
  while i <= iter
    Theta_prev = Theta;
    Theta = Theta_prev - (alpha / m * sum((FeatureMatrix * Theta_prev - Y) .* FeatureMatrix))';

    i += 1;
  endwhile

  Theta = [0; Theta];
end

