function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)
  % get Theta1 and Theta2 (from params)
  i = input_layer_size;
  h = hidden_layer_size;
  o = output_layer_size;

  Theta1 = params(1 : h * (i + 1));
  Theta2 = params(h * (i + 1) + 1 : end);
  Theta1 = reshape(Theta1, h, i + 1);
  Theta2 = reshape(Theta2, o, h + 1);

  % Forward propagation
  m = size(X, 1);

  a1 = [ones(m, 1) X]';

  z2 = Theta1 * a1;
  a2 = sigmoid(z2);
  a2 = a2';
  z2 = z2;
  a2 = [ones(m, 1) a2]';

  z3 = Theta2 * a2;
  a3 = sigmoid(z3);

  % Compute the error in the output layer and perform backpropagation
  Error = sum(sumsq(Theta1(:, 2 : end))) + sum(sumsq(Theta2(:, 2 : end)));
  Error = (Error * lambda) / (2 * m);

  Y = zeros(o, m);
  for k = 1 : m
    Y(y(k), k) = 1;
  endfor

  delta3 = a3 - Y;
  Delta2 = delta3 * a2';
  delta2 = Theta2' * delta3;
  delta2 = delta2(2 : end, :) .* (sigmoid(z2)) .* (1 - sigmoid(z2));
  Delta1 = delta2 * a1';

  % Determine the gradients
  grad1 = Delta1 / m;
  grad2 = Delta2 / m;

  grad1(:, 2 : end) += (lambda / m) * Theta1(:, 2 : end);
  grad2(:, 2 : end) += (lambda / m) * Theta2(:, 2 : end);

  % Final J and grad
  cost = sum(sum(-Y .* log(a3) - (1 - Y) .* log(1 - a3)));
  J = cost / m;
  J += Error;

  grad = [grad1(1 : end) grad2(1 : end)];
  grad = grad';
end

