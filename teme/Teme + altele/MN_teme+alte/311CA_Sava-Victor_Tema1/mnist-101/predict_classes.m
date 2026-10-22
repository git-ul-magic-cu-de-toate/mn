function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % get Theta1 and Theta2 (from weights)
  i = input_layer_size;
  h = hidden_layer_size;
  o = output_layer_size;

  Theta1 = weights(1 : h * (i + 1));
  Theta2 = weights(h * (i + 1) + 1 : end);
  Theta1 = reshape(Theta1, h, i + 1);
  Theta2 = reshape(Theta2, o, h + 1);

  % Forward propagation
  m = size(X, 1);

  a1 = [ones(m, 1) X]';

  z2 = Theta1 * a1;
  a2 = sigmoid(z2);
  a2 = a2';
  a2 = [ones(m, 1) a2]';

  z3 = Theta2 * a2;
  a3 = sigmoid(z3);

  % get the indexes of the biggest elements of each row
  [~, classes] = max(a3);
  % then flip the vector to be a column vector
  classes = classes';
end
